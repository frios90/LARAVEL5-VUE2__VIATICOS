<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Code;

class CodeController extends Controller
{
    public function getManagementList (Request $request) 
    {
        return response(Code::whereHas('managements.rates')
                             ->where('type_id', '=', $request->input('type'))
                             ->get(), 200); 
    }
   
    public function getListSelectBox () 
    {
        $list = Code::whereHas('type', function ($query) {
                                $query->where('name', '=', 'EXPENSE_TRANSPORT');
                                $query->orWhere('name', '=', 'EXPENSE_LODGING');
                                $query->orWhere('name', '=', 'EXPENSE_OTHER');
                                $query->orWhere('name', '=', 'EXPENSE_FOOD');
                            })->get();
        return response($list, 200); 
    }  
}
