<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SoldItems extends Model
{
    use SoftDeletes;

    public $table = 'items_sold';
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';
    protected $dates = ['deleted_at'];

    public function items() {
        return $this->hasMany('\App\Item','id', 'id_item')->orderBy('name','ASC');
    }

    public function orders() {
        return $this->hasMany('\App\OrderInfo','id', 'id_order')->orderBy('name','ASC');
    }
}