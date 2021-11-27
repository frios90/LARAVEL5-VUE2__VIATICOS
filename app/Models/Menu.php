<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    protected $guarded = [];
    public function profiles()
    {
        return $this->belongsToMany('\App\Models\Profile');
    }
}
