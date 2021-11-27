<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{ 
    public function index()
    {
        return view('master');
    }
}
