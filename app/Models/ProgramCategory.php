<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProgramCategory extends Model
{
    use HasFactory;
    protected $guarded = ['id'];

    public function programs()
    {
        return $this->hasMany(Program::class,'program_category_id','id');
    }
}
