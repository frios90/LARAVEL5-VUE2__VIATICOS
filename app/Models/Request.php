<?php //b4f2e6d787e3632e35b6465fb958eef5

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Request extends Model
{
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo('\App\Models\User');
    }

    public function userApprove()
    {
        return $this->belongsTo('\App\Models\User', 'user_approve_id');
    }

    public function userManagement()
    {
        return $this->belongsTo('\App\Models\User', 'user_management_id');
    }

    public function code()
    {
        return $this->belongsTo('\App\Models\Code');
    }

    public function users()
    {
        return $this->belongsToMany('\App\Models\User', 'request_user', 'request_id', 'user_id');
    }

    public function projects()
    {
        return $this->hasMany('\App\Models\RequestProject');
    }
    public function commune()
    {
        return $this->belongsTo('\App\Models\Commune');
    }
    public function rates()
    {
        return $this->belongsToMany('\App\Models\Rate')->withPivot('qty','value');
    }
    public function requestPayment()
    {
        return $this->hasMany('\App\Models\RequestPayment');
    }
    public function accreditDocuments()
    {
        return $this->hasMany('\App\Models\AccreditDocument');
    }

}
