<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Profile;
use App\Models\Management;
use App\Models\Rate;
use App\Rules\validateRut;

class CatalogueController extends Controller
{  
    public function index()
    {
        return view('master');
    }

    public function getTableList () 
    {
        $list = Management::with('code')
                            ->withTrashed()
                            ->orderBy('name')
                            ->get();
        return response($list, 200);
    }
  
    public function store(Request $request)
    {
        $request->validate([
            'rut'        => ['required','unique:managements', 'max:12', new validateRut],
            'name'       => ['required'],
            'phone'      => ['required', 'numeric', 'max:999999999'],
            'email'      => ['required', 'email'],
            'region_id'  => ['required'],
            'commune_id' => ['required'],
            'address'    => ['required'],
            'code_id'    => ['required']           
        ]);        
        $data_viatic['rut']           = $request->input('rut');
        $data_viatic['name']          = $request->input('name');
        $data_viatic['address']       = $request->input('address'); 
        $data_viatic['phone_contact'] = $request->input('phone');
        $data_viatic['mail_contact']  = $request->input('email');
        $data_viatic['code_id']       = $request->input('code_id');
        $data_viatic['commune_id']    = $request->input('commune_id');
        $management = Management::firstOrCreate($data_viatic);
        return $management;    
    }

    public function update(Request $request)
    {
        $id = $request->input('id');     
        $request->validate([
            'rut'        => ['required', 'max:12', new validateRut, 'unique:managements,rut,'.$id],
            'name'       => ['required'],
            'phone'      => ['required', 'numeric', 'max:999999999'],
            'email'      => ['required', 'email'],
            'region_id'  => ['required', 'numeric'],
            'commune_id' => ['required', 'numeric'],
            'address'    => ['required'],
            'code_id'    => ['required']
        ]);
        $management                = Management::find($id);
        $management->rut           = $request->input('rut');
        $management->name          = $request->input('name');
        $management->address       = $request->input('address'); 
        $management->phone_contact = $request->input('phone');
        $management->mail_contact  = $request->input('email');
        $management->code_id       = $request->input('code_id');
        $management->commune_id    = $request->input('commune_id');
        $management->save();
        return $management;    
    }

    public function getCatalogue (Request $request) 
    {
        return response(Management::with('commune.region')->find($request->input('id')), 200);
    }

    public function status (Request $request) 
    {
        $id         = $request->input('id');
        $management = Management::where('id', '=', $request->input('id'))->withTrashed()->first();
        if ($management->deleted_at) {
            $management->restore();
        } else {
            $management->delete();
        }
        return response($management, 200);
    }

    public function storeRates (Request $request) 
    {
        $request->validate([           
            'description' => ['required'],
            'value'       => ['required']
        ]);
        if ( $request->input('create_or_update') == 'update' ) {
            $rate              = Rate::find((int)$request->input('id_to_edit'));
            $rate->description = $request->input('description');
            $rate->value       = $request->input('value');
            $rate->save();            
        } else {
            Rate::create([
                'description'   => $request->input('description'),
                'value'         => $request->input('value'),
                'management_id' => (int)$request->input('management_id')
            ]);
        }    
        $rates = Rate::where('management_id', '=', (int)$request->input('management_id'))->withTrashed()->get();
        return response($rates, 200);
    }

    public function getCatalogueRates (Request $request) 
    {
        $rates = Rate::where('management_id', '=', $request->input('id'))
                    ->withTrashed()
                    ->orderBy('updated_at', 'desc')
                    ->get();
        return response($rates, 200);
    }

    public function rateStatus (Request $request) 
    {
        $id   = $request->input('id');
        $rate = Rate::where('id', '=', $request->input('id'))->withTrashed()->first();        
        if ($rate->deleted_at) {
            $rate->restore();
        } else {
            $rate->delete();
        }
        return response(Rate::where('management_id', '=', (int)$request->input('management_id'))->withTrashed()->get(), 200);
    }
}
