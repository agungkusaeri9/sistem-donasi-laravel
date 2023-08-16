<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Storage;

class Transaction extends Model
{
    use HasFactory, SoftDeletes;
    protected $guarded = ['id'];
    public function program()
    {
        return $this->belongsTo(Program::class, 'program_id', 'id');
    }
    public function payment()
    {
        return $this->belongsTo(Payments::class, 'payment_id', 'id');
    }

    public function evidenceDownload()
    {
        // $file = Storage::disk('public')->get($this->evidence);

        // return (new Response($file, 200))
        //       ->header('Content-Type', 'image/jpeg');

        return asset('storage/' . $this->evidence);
    }

    public function count_day()
    {
        if ($this->created_at) {
            $now = Carbon::now();
            return $this->created_at->diffInDays($now);
        } else {
            return "-";
        }
    }

    public function avatar()
    {
        return asset('assets/img/avatar/avatar-1.png');
    }

    public function scopeName()
    {
        if ($this->is_anonim) {
            return 'Hamba Allah';
        } else {
            return $this->name;
        }
    }

    public function isVerified()
    {
        if ($this->is_verified == 1) {
            return ' <span class="badge py-2 badge-success">Terverifikasi</span>';
        } else {
            return ' <span class="badge py-2 badge-warning">Tidak Terverivikasi</span>';
        }
    }

    public function details()
    {
        return $this->hasOne(TransactionDetail::class, 'transaction_id', 'id');
    }
}
