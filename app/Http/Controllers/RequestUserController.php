<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\Models\Code;
use App\Models\Request as REQUEST_MODEL;
use App\Models\User;
use App\Models\RequestProject;
use App\Helpers;
use App\Rules\ValidateLengthObject;
use App\Models\RequestPayment;
use App\Models\AccreditDocument;
use App\Rules\validateRut;
use App\Rules\CompanyDocumentRepeat;
use Illuminate\Support\Facades\Storage;

class RequestUserController extends Controller
{
    public function index()
    {
        return view('master');
    }
   
    public function getTableList (Request $request) 
    {       
        $list = User::with('requests.code')
                    ->find(Auth::user()->id)->requests;     
        $list->values()->all();
        $formater_list = [];
        foreach ($list as $key => $row) {
            $formater_list[$key]['id']           = $row->id;
            $formater_list[$key]['folio']        = $row->folio;
            $formater_list[$key]['cash']         = Helpers::money($row->cash);
            $formater_list[$key]['rank_date']    = Helpers::invertDate($row->going_at) . ' ~ ' . Helpers::invertDate($row->return_at);
            $formater_list[$key]['status_label'] = $row->code->label;
            $formater_list[$key]['status_code']  = $row->code->name;
            $formater_list[$key]['class_status'] = Helpers::classStatusColor($row->code->name);
        }
        return response()->json($formater_list, 200);             
    }   
 
    public function store(Request $request)
    {
        $request->validate([
            'commune'     => ['required'],
            'region'      => ['required'],
            'init'        => ['required'],
            'end'         => ['required'],
            'description' => ['required'],
            'cash'        => ['required'],
            'destiny'     => ['required'],
            'end'         => ['required'],
            'staff'       => [new ValidateLengthObject]
        ]);

        $data_request['folio']        = date('ymdhis');
        $data_request['staff_amount'] = count($request->input('staff')); /**contar registros de staff */
        $data_request['commune_id']   = $request->input('commune');
        $data_request['going_at']     = $request->input('init');
        $data_request['return_at']    = $request->input('end');
        $data_request['description']  = $request->input('description');
        $data_request['cash']         = $request->input('cash');
        $data_request['destiny']      = $request->input('destiny');
        $data_request['user_id']      = Auth::user()->id;       
        $data_request['code_id']      = Code::where('name', '=', 'PENDING_APPROVAL')->first()->id;/**El estado inicial de la solicitud */
        $REQUEST                      = REQUEST_MODEL::create($data_request);        
        $data['staff']                = $request->input('staff');
        $data['projects']             = $request->input('projects');

        $REQUEST->users()->sync($data['staff']);
       
        foreach ($data['projects'] as $project) {   
            if (!empty( $project['folio']) && !empty( $project['description'] )) {
                RequestProject::firstOrCreate(
                    ['folio' => $project['folio'],
                     'description' => $project['description'],
                     'request_id'  => $REQUEST->id]
                ); 
            }               
        }        
        return $REQUEST;
    }
   
    public function getRequest (Request $request) {
        $data['request'] = REQUEST_MODEL::with(
                                                'commune.region', 
                                                'code',
                                                'projects',
                                                'user',
                                                'userApprove',
                                                'userManagement',
                                                'users',                                                
                                                'rates.management.code.type',
                                                'requestPayment',
                                                'accreditDocuments'
                                            )
                                        ->find($request->input('id'));
        
        $data['staff']         = $data['request']->users->pluck('id'); 
        $data['total_request'] = 0;       
        foreach($data['request']->rates as $rate){
            $data['total_request'] = $data['total_request'] + (int)$rate->pivot->value;
        }
        $data['total_accredit'] = 0;
        if (isset($data['request']->requestPayment)) {
            foreach($data['request']->requestPayment as $accredit){
                $data['total_accredit'] = $data['total_accredit'] + (int)$accredit->amount;
            } 
        }
        return response($data, 200);
    }
   
    public function update(Request $request)
    {    
        $request->validate([
            'commune'     => ['required'],
            'region'      => ['required'],
            'init'        => ['required'],
            'end'         => ['required'],
            'description' => ['required'],
            'cash'        => ['required'],
            'destiny'     => ['required'],
            'end'         => ['required']           
        ]);        
        $data_request['staff_amount'] = (int)count($request->input('staff')); /**contar registros de staff */
        $data_request['commune_id']   = (int)$request->input('commune');
        $data_request['going_at']     = $request->input('init');
        $data_request['return_at']    = $request->input('end');
        $data_request['description']  = $request->input('description');
        $data_request['cash']         = (int)$request->input('cash');
        $data_request['destiny']      = $request->input('destiny');
        $data_request['user_id']      = (int)Auth::user()->id;       
        $data_request['code_id']      = (int)Code::where('name', '=', 'PENDING_APPROVAL')->first()->id;/**El estado inicial de la solicitud */
        
        REQUEST_MODEL::where('id','=',$request->input('id'))
                    ->update($data_request);

        $REQUEST                      = REQUEST_MODEL::find($request->input('id'));
        $data['staff']                = $request->input('staff');
        $data['projects']             = $request->input('projects');

        $REQUEST->users()->sync($data['staff']);
        RequestProject::where('request_id', $request->input('id'))->delete();
        foreach ($data['projects'] as $project) {   
            if (!empty( $project['folio']) && !empty( $project['description'] )) {
                RequestProject::firstOrCreate(
                    ['folio' => $project['folio'],
                     'description' => $project['description'],
                     'request_id'  => $REQUEST->id]
                ); 
            }               
        }        
        return $REQUEST;
    }
 
    public function postRequestPayments (Request $request) 
    {
        $request->validate([           
            'number'       => ['required', 'numeric'],
            'emited_at'    => ['required'],
            'name_company' => ['required'],
            'rut_company'  => ['required', 'max:12', new validateRut],
            'description'  => ['required'],
            'amount'       => ['required', 'numeric'],
        ]);
        $validate_company_document = RequestPayment::where('number', '=', $request->input('number'))
            ->where('rut_company', '=', $request->input('rut_company'))
            ->count();
        if ($validate_company_document > 0) {
            $error['errors']['number'][] = 'El Comprobante ya existe';  
            return response()->json($error, 422);
        }
        RequestPayment::create([
            'number'       => $request->input('number'),
            'emited_at'    => $request->input('emited_at'),
            'name_company' => $request->input('name_company'),
            'rut_company'  => $request->input('rut_company'),
            'description'  => $request->input('description'),
            'amount'       => $request->input('amount'),
            'request_id'   => (int)$request->input('request_id'),
            'path_document'=> 'false',
            'user_id'      => Auth::user()->id,
            'code_id'      => Code::where('name', '=', 'ENABLED')->first()->id
        ]);    
        $payments         = RequestPayment::where('request_id', '=', (int)$request->input('request_id'))->get();
        $request          = REQUEST_MODEL::find((int)$request->input('request_id'));
        $request->code_id = Code::where('name', '=', 'REQUEST_ACCREDITED')->first()->id;
        $request->save();
        return response($payments, 200);
    }

    public function paymentStatus (Request $request) 
    {
        $payment = RequestPayment::where('id', '=', (int)$request->input('id'))->first();        
        if ($payment->deleted_at) {
            $payment->restore();
        } else {
            $payment->delete();
        }
        return response(RequestPayment::where('request_id', '=', (int)$request->input('request_id'))->get(), 200);
    }

    public function getRequestFiles (Request $request) 
    {
        $data['files']       = AccreditDocument::with(['user'])->where('request_id', '=', $request->input('request_id'))->get();
        $data['array_files'] = $data['files']->pluck('path')->toArray();
        return response($data, 200);
    }

    public function fileStore(Request $request)
    {
        if ($request->hasFile('file')) {
            $user        = Auth::user()->id;
            $request_id  = $request->input('request_id');
            $size        = $request->file->getSize();
            $file_name   = $request->file->getClientOriginalName();
            $extension   = $request->file->getClientOriginalExtension();
            $new_name    = $user .'_'.time() . '.' . $extension;
            $upload_path = public_path('upload/'.'user_'. $user .'/'. date('Y_m_d'));
            $path        = '/upload/'.'user_'. $user .'/'. date('Y_m_d') .'/'. $new_name;
            if ($extension != 'jpg' && $extension != 'jpeg' ) {
                return response()->json(['error' => '*Debe cargar un Archivo valido (.jpg, .jpeg)']);
            }
            if ( empty($size) || $size >= 2097152) {
                return response()->json(['error' => '*El Archivo es demasiado grande(2MB max.)']);
            }        
            $request->file->move($upload_path, $new_name);
            AccreditDocument::create([
                'user_id'       => $user,
                'request_id'    => $request_id,
                'size'          => $size,
                'original_name' => $file_name,
                'name'          => $new_name,
                'extension'     => $extension,
                'path'          => $path        
           ]);
        } else {
            return response()->json(['error' => '*Debe seleccionar un Archivo valido ([2MB max.], [.jpg, .jpeg])']);
        }        
    }

    public function postDeletePicture (Request $request) 
    {        
        $picture_id = $request->input('picture_id');       
        $picture    = AccreditDocument::find($picture_id);
        if (Auth::user()->id != $picture->user_id) {
            return response()->json(['error' => '*Usted no es el responsable de la imagen. No puede realizar su eliminado']);
        }
        unlink(public_path($picture->path));
        $picture->delete();
        return response($picture, 200);
    }

    public function postDeletePaymentRow (Request $request)  
    {
        $payment = RequestPayment::find($request->input('id'));
        $payment->delete();
        return response($payment, 200); 
    }   
}
