<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Menu;
use App\Models\Profile;

use Auth;

class MenuController extends Controller
{
    public function getMenusUserSession()
    {
        $menus = Menu::whereHas('profiles', function($query){
                            $query->where('profiles.id', Profile::where('id', '=', Auth::user()->profile_id)->first()->id);
                        })->get();
        return response($menus, 200);
    }
}
