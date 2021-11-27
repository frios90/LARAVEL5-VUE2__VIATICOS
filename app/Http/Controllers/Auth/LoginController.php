<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use App\Models\User;
use Auth;

class LoginController extends Controller
{
    public function __construct()
    {

    }
    public function index()
    {
        return view('auth.login');
    }

    public function singIn(Request $request)
    {
        $user = $this->validate(request() , [
            'email' => 'email|required',
            'password' => 'required'
        ]);

        if ( Auth::attempt($user)) {
          return redirect()->route('home');
        }
        return back()
            ->withErrors(['email'=>'No podemos encontrar ningún usuario con ese correo electrónico.'])
            ->withInput([$request->input('email')]);

    }

    public function logOut() {
        Auth::logout();
        return response('log-out', 200);
    }
}
