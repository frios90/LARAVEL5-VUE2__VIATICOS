<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Type extends Model
{
    protected $guarded = [];
    use SoftDeletes;

    public function codes()
    {
        return $this->hasMany('\App\Models\Code');
    }
}
