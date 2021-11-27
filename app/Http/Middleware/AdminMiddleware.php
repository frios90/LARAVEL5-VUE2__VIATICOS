<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Http\Middleware;

use Closure;
use App\Models\Profile;
use Auth;
class AdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        /*
            Se considera admin a aquellos usuarios cuyo perfil puede ser:
            *god
            *administrator
            *applicant
        */
        $profile = Profile::where('id', '=', Auth::user()->profile_id)->first()->name;
        if ( $profile == 'god' || $profile == 'administrator') 
        {
            return $next($request);
        } else {
            return redirect()->route('home');
            
        }
    }
}
