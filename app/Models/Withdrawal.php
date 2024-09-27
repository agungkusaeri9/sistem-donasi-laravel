<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Withdrawal extends Model
{
    use HasFactory;
    protected $table = 'withdrawal';
    protected $guarded = ['id'];

    public function program()
    {
        return $this->belongsTo(Program::class);
    }

    public function bankComplete()
    {
        return $this->bank_name . '<br>' . $this->bank_number . '<br>' . $this->bank_owner;
    }

    public function proof()
    {
        return asset('storage/' . $this->proof);
    }
}
