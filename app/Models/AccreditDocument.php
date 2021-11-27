<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AccreditDocument extends Model
{
    protected $guarded = [];
    public function user()
    {
        return $this->belongsTo('\App\Models\User');
    }
}
