<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Slider extends Model
{
    use HasFactory;
    protected $guarded = ['id'];

    public function program()
    {
        return $this->belongsTo(Program::class,'program_id','id');
    }

    public function image()
    {
        if($this->image)
        {
            return asset('storage/' . $this->image);
        }else{
            return asset('assets/img/news/img01.jpg');
        }
    }

}
