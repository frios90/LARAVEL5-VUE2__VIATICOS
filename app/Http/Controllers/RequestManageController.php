<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\Models\Code;
use App\Models\Request as REQUEST_MODEL;

class RequestManageController extends Controller
{
    public function index()
    {
        return view('master');
    }

    public function getTableList (Request $request)
    {
        $list = REQUEST_MODEL::with('user', 'code')
                            ->where('code_id', '=', Code::where('name', '=', 'REQUEST_APPROVED')->first()->id)                                                       
                            ->orWhere('code_id', '=', Code::where('name', '=', 'MANAGEMENT_REJECTED')->first()->id)
                            ->orWhere('code_id', '=', Code::where('name', '=', 'REQUEST_ACCREDITED')->first()->id)
                            ->orWhere('code_id', '=', Code::where('name', '=', 'REQUEST_MANAGED')->first()->id)       
                            ->get();
        return response($list, 200);                  
    }

    public function getListTarifManage (Request $request) 
    {       
        $request = REQUEST_MODEL::with('rates.management.code.type')
                                ->where('id', '=', $request->input('id'))
                                ->first();
        $list = [];
        foreach ($request->rates as $r) {
            $list[] = [
                'type'       => $r->management->code->type->label,
                'code'       => $r->management->code->label,
                'management' => $r->management->name,
                'rate'       => $r->description,
                'qty'        => $r->pivot->qty,
                'value'      => $r->pivot->value,
                'rate_id'    => $r->id
            ];            
        }
        return response($list, 200);  
    }

}
