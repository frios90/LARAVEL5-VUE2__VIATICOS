<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Profile;
use App\Rules\validateRut;
use Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function userAuth() {
        return response(Auth::user(), 200);
    }

    public function index()
    {
        return view('master');
    }

    public function getTravelerList()
    {
        $travelers = User::where('profile_id', '=', Profile::where('name', '=', 'traveler')
                                                            ->first()->id)->get();
        return response($travelers, 200);
    }
   
    public function getTableList ()
    {
        $list = User::with(['area', 'profile'])
                    ->withTrashed()
                    ->orderBy('rut', 'ASC')
                    ->get();
        return response($list, 200);
    }

    public function store(Request $request)
    {
        $request->validate([
            'rut'        => ['required','unique:users', 'max:12', new validateRut],
            'name'       => ['required'],
            'phone'      => ['required', 'numeric', 'max:999999999'],
            'email'      => ['required', 'unique:users', 'email'],
            'region_id'  => ['required'],
            'commune_id' => ['required'],
            'address'    => ['required'],
            'area_id'    => ['required'],
            'profile_id' => ['required']           
        ]);        
        $data_user['rut']        = $request->input('rut');
        $data_user['name']       = $request->input('name');

        $pass                    =  substr($data_user['rut'], 7, 3) . substr($data_user['rut'], 7, 3);
        \Log::debug('pass del usuario');
        \Log::debug($pass);
        $data_user['password']   = bcrypt($pass); 
        $data_user['address']    = $request->input('address'); 
        $data_user['phone']      = $request->input('phone');
        $data_user['email']      = $request->input('email');
        $data_user['area_id']    = $request->input('area_id');
        $data_user['profile_id'] = $request->input('profile_id');
        $data_user['commune_id'] = $request->input('commune_id');
        $user                    = User::firstOrCreate($data_user);
        return $user;    
    }

    public function update(Request $request)
    {
        $id = $request->input('id');
        $request->validate([
            'name'       => ['required'],
            'phone'      => ['required', 'numeric', 'max:999999999'],
            'email'      => ['required', 'email', 'unique:users,email,'.$id],
            'region_id'  => ['required'],
            'commune_id' => ['required'],
            'address'    => ['required'],
            'area_id'    => ['required'],
            'profile_id' => ['required']           
        ]);
        $user             = User::find($id);
        $user->name       = $request->input('name');
        $user->address    = $request->input('address'); 
        $user->phone      = $request->input('phone');
        $user->email      = $request->input('email');
        $user->area_id    = $request->input('area_id');
        $user->profile_id = $request->input('profile_id');
        $user->commune_id = $request->input('commune_id');
        $user->save();
        return $user;    
    }

    public function getUser (Request $request)
    {
        return response(User::with('commune.region')->find($request->input('id')), 200);
    }

    public function status (Request $request)
    {
        $id   = $request->input('id');
        $user = User::where('id', '=', $request->input('id'))->withTrashed()->first();
        
        if ($user->deleted_at) {
            $user->restore();
        } else {
            $user->delete();
        }
        return response($user, 200);
    }
}
