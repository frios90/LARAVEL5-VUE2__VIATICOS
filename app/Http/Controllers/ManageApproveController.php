<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\Models\Code;
use App\Models\Request as REQUEST_MODEL;

class ManageApproveController extends Controller
{
    public function index()
    {
        return view('master');
    }

    public function getTableList (Request $request) 
    {       
        $list = REQUEST_MODEL::where('code_id', '=', Code::where('name', '=', 'REQUEST_MANAGED') ->first()->id)->get();
        return response($list, 200);              
    }

    public function apply (Request $request)
    {
        $REQUEST = REQUEST_MODEL::find($request->input('id'));
        if ($request->input('approve') === true) { 
            $REQUEST->code_id = Code::where('name', '=', 'MANAGEMENT_APPROVE')->first()->id;
        } else {
            $REQUEST->code_id = Code::where('name', '=', 'MANAGEMENT_REJECTED')->first()->id;
        }
        $REQUEST->user_approve_id = Auth::user()->id;$REQUEST->user_approve_id = Auth::user()->id;
        $REQUEST->save();
        return response($REQUEST, 200);                   
    }
}
