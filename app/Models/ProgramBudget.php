<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProgramBudget extends Model
{
    use HasFactory;
    protected $table = 'program_budget';
    protected $guarded = ['id'];

    public function program()
    {
        return $this->belongsTo(Program::class,'program_id','id');
    }
}
