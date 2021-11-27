<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Profile;
use App\Models\Code;

class ViaticController extends Controller
{
    public function index()
    {
        return view('master');
    }

    public function getTableList () 
    {
        $list = Code::with('type')->whereHas('type', function ($query) {
                                $query->where('name',   '=', 'EXPENSE_TRANSPORT');
                                $query->orWhere('name', '=', 'EXPENSE_LODGING');
                                $query->orWhere('name', '=', 'EXPENSE_OTHER');
                                $query->orWhere('name', '=', 'EXPENSE_FOOD');
                            })
                    ->orderBy('label')
                    ->withTrashed()
                    ->get();
        return response($list, 200);
    }

    public function store(Request $request)
    {
        $request->validate([
            'type_id'     => ['required'],
            'name'        => ['required', 'unique:codes',],
            'label'       => ['required', 'unique:codes'],
            'description' => ['required']                      
        ]);
        
        $data_viatic['type_id']     = $request->input('type_id');
        $data_viatic['name']        = $request->input('name');
        $data_viatic['label']       = $request->input('label');
        $data_viatic['description'] = $request->input('description');         
        $viatic                     = Code::firstOrCreate($data_viatic);
        return $viatic;    
    }

    public function update(Request $request)
    {
        $id = $request->input('id');
        $request->validate([
            'type_id'     => ['required'],
            'name'        => ['required', 'unique:codes,name,'.$id],
            'label'       => ['required', 'unique:codes,label,'.$id],
            'description' => ['required']                      
        ]);
        $viatic = Code::find($id);

        $viatic->name        = $request->input('name');
        $viatic->label       = $request->input('label'); 
        $viatic->description = $request->input('description');
        $viatic->type_id     = $request->input('type_id');        
        $viatic->save();
        return $viatic;  
    }

    public function getViatic (Request $request) {
        return response(Code::find($request->input('id')), 200);
    }

    public function status (Request $request) {
        $id     = $request->input('id');
        $viatic = Code::where('id', '=', $request->input('id'))->withTrashed()->first();        
        if ($viatic->deleted_at) {
            $viatic->restore();
        } else {
            $viatic->delete();
        }
        return response($viatic, 200);
    }
}
