<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderStatusCode extends Model
{
    /** @use HasFactory<\Database\Factories\OrderStatusCodeFactory> */
    use HasFactory;

    protected $fillable = [
        'status_code',
        'description',
    ];

    public function orders()
    {
        return $this->hasMany(Order::class, 'status_code_id');
    }
}
