<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Http\Middleware;

use Closure;
use Auth;
use App\Models\Profile;

class ProjectManagerMiddleware
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
        return $next($request);
    }
}
