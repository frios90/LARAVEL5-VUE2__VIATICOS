<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\SoftDeletes;

class User extends Model
{
    protected $guarded = [];
    use SoftDeletes;

    public function commune()
    {
        return $this->belongsTo('\App\Models\Commune');
    }

    public function requests()
    {
        return $this->hasMany('\App\Models\Request');
    }

    public function staff()
    {
        return $this->belongsToMany('\App\Models\Request', 'request_user', 'user_id', 'request_id');
    }

    public function area()
    {
        return $this->belongsTo('\App\Models\Area');
    }

    public function profile()
    {
        return $this->belongsTo('\App\Models\Profile');
    }

}
