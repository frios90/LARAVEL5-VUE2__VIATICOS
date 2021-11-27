<?php

namespace App\Http\Middleware;

use Closure;
use Auth;
use App\Models\Profile;

class TravelMiddleware
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
        if ( $profile == 'traveler' || $profile == 'god' || $profile == 'project_manager' )
        {
            return $next($request);
        } else {
            return redirect()->route('home');
            
        }
    }
}
