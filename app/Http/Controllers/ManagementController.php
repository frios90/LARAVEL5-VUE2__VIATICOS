<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Management;
use App\Models\Request as REQUEST_MODEL;
use App\Models\Code;
use Auth;

class ManagementController extends Controller
{
    public function getManagementList (Request $request) 
    {
        return response(Management::whereHas('rates')
                                    ->where('code_id','=',$request->input('code'))
                                    ->get(), 200); 
    }
    
    public function postManagement (Request $request) 
    {
        $REQUEST = REQUEST_MODEL::find($request->input('id'));
        $detail  = collect( $request->input('detail'));
        $REQUEST->rates()->detach();
        $detail->each(function ($item, $key) use ($REQUEST) {
            $REQUEST->rates()->attach( $item['rate_id'], [
                                            'qty'   => $item['qty'],
                                            'value' =>  $item['value'] 
                                        ]);           
        });          
        $REQUEST->user_management_id = Auth::user()->id; 
        $REQUEST->code_id            = Code::where('name', '=', 'REQUEST_MANAGED')->first()->id;
        $REQUEST->save();
        return response($REQUEST, 200);
    }
}
