<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Rate;
use App\Models\Request as REQUEST_MODEL;

class RateController extends Controller
{
    public function getManagementList (Request $request) 
    {
        return response(Rate::where('management_id','=',$request->input('management'))->get(), 200); 
    }        
}
