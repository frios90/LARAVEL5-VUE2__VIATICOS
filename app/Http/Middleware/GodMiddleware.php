<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\Profile;
use Auth;
class GodMiddleware
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
        $profile = Profile::where('id', '=', Auth::user()->profile_id)->first()->name;
        if ( $profile == 'god' ) {
            return $next($request);
        } else {
            return redirect()->route('home');            
        }
    }
}
