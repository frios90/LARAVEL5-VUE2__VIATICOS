<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Type;

class TypeController extends Controller
{
    public function index()
    {
        return view('master');
    }

    public function getTableList () {
        $list = Type::withTrashed()
                    ->where('name', '<>', 'STATUS')
                    ->where('name', '<>', 'REQUEST_STATUS')
                    ->orderBy('label')
                    ->get();
        return response($list, 200);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name'        => ['required', 'unique:types',],
            'label'       => ['required', 'unique:types'],
            'description' => ['required']                      

        ]);
        
        $data_type['name']       = $request->input('name');
        $data_type['label']      = $request->input('label');       
        $data_type['description']    = $request->input('description'); 
 
        $type                    = Type::firstOrCreate($data_type);
        return $type;    
    }
   
    public function update(Request $request)
    {
        $id = $request->input('id');
        $request->validate([
            'name'        => ['required', 'unique:types,name,'.$id],
            'label'       => ['required', 'unique:types,label,'.$id],
            'description' => ['required']
        ]);
        $type              = Type::find($id);
        $type->name        = $request->input('name');
        $type->label       = $request->input('label'); 
        $type->description = $request->input('description');
        $type->save();
        return $type;  
    }

    public function getType (Request $request) 
    {
        return response(Type::find($request->input('id')), 200);
    }

    public function status (Request $request) 
    {
        $id   = $request->input('id');
        $type = Type::where('id', '=', $request->input('id'))->withTrashed()->first();        
        if ($type->deleted_at) {
            $type->restore();
        } else {
            $type->delete();
        }
        return response($type, 200);
    }
    
    public function getManagementList () 
    {
        $types = Type::whereHas('codes.managements.rates')
                    ->where('name','<>','STATUS')
                    ->where('name','<>','REQUEST')                           
                    ->get();        
        return response($types, 200); 
    }

    public function getListSelectBox () 
    {
        $list = Type::where('name','<>','STATUS')
                    ->where('name','<>','REQUEST_STATUS')   
                    ->get();
        return response($list, 200); 
    }
}
