<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Request as REQUEST_MODEL;
use App\Models\Code;
use App\Models\Type;

class WidgetController extends Controller
{
    public function getWidgetRequestInfoMonth (Request $request) 
    {
        $requests    = REQUEST_MODEL::with('rates')
                                    ->whereYear('created_at', '=', date('Y'))
                                    ->whereMonth('created_at', '=', $request->input('month'))
                                    ->get();
        $data['qty'] = count($requests);
        
        $data['total_cash']   = 0;
        $data['total_manage'] = 0;
        $data['no_manage']     = 0;
        foreach ($requests as $request) {
            $data['total_cash'] = $data['total_cash'] + $request->cash;
            if (count($request->rates) == 0) $data['no_manage']++;
            foreach ($request->rates as $rate) {

                $data['total_manage'] = $data['total_manage'] + $rate->pivot->value;
                
            }           
        }
        return response($data, 200);
    }

    public function requestsForState (Request $request) 
    {
        $requests    = REQUEST_MODEL::with('rates')
                                    ->whereYear('created_at', '=', date('Y'))
                                    ->whereMonth('created_at', '=', $request->input('month'))
                                    ->get();
        $statuses = Code::where('type_id', '=', Type::where('name', '=', 'REQUEST_STATUS')->first()->id)->get();
            \Log::info('esto es un punto en el cual no se puede resolver el tema');
            \Log::info($requests);  

        $data = [];
        foreach ($statuses as $status) {
            $data[] = [
                'status_id'    => $status->id,
                'status_code'  => $status->name,
                'status_label' => $status->label,
                'qty'          => $requests->where('code_id', $status->id)->count()   
            ];
        }
        \Log::info(count($data));  

        \Log::info($data);  

        return response($data, 200); 

    }
}
