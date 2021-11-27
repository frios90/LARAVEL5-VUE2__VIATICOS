<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Rate extends Model
{
    protected $guarded = [];
    use SoftDeletes;

    public function requests()
    {
        return $this->belongsToMany('\App\Models\Request')->withPivot('qty','value');
    }
    public function management()
    {
        return $this->belongsTo('\App\Models\Management');
    }
}
