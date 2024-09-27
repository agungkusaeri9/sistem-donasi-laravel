<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Program extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $guarded = ['id', 'visitor'];
    protected $dates = ['deleted_at', 'time_up'];

    // information
    // status : 0 => Belum Selesai, 1 => Sedang Berjalan, 2 => Selesai
    // is_withdrawal : 0 => Dana Belum Ditarik, 1 => Dana Sudah Ditarik

    public function category()
    {
        return $this->belongsTo(ProgramCategory::class, 'program_category_id', 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function image()
    {
        if ($this->image) {
            return asset('storage/' . $this->image);
        } else {
            return asset('assets/img/news/img01.jpg');
        }
    }

    public function galleries()
    {
        return $this->hasMany(ProgramGallery::class);
    }

    public function budgets()
    {
        return $this->hasMany(ProgramBudget::class, 'program_id');
    }

    public function transactions_success()
    {
        return $this->hasMany(Transaction::class, 'program_id', 'id')->where('is_verified', 1)->latest();
    }

    public function count_day()
    {
        if ($this->time_up) {
            $now = Carbon::now();
            if ($now > $this->time_up)
                return '-' . $this->time_up->diffInDays($now) + 1;
            else
                return $this->time_up->diffInDays($now) + 1;
        } else {
            return "0";
        }
    }

    public function deficiency()
    {
        $nominal = $this->donation_target;
        $ready = $this->transactions_success()->sum('nominal');
        if ($nominal < $ready) {
            return '0';
        } else {
            return $nominal - $ready;
        }
    }

    public function percent()
    {
        $nominal = $this->donation_target;
        $ready = $this->transactions_success()->sum('nominal');
        $percent = ($ready / $nominal) * 100;
        return $percent;
    }

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }

    public function scopeWithdrawal($query)
    {
        return $query->where([
            'status' => 2,
            'is_withdrawal' => 0
        ]);
    }

    public function scopePublished($query)
    {
        $query->where('is_published', 1)->where('status', '!=', 2)->where('is_withdrawal', 0);
    }

    public function scopeSelesai($query)
    {
        return $query->where([
            'status' => 2
        ]);
    }

    public function donation_collacted()
    {
        return $this->transactions_success->sum('nominal');
    }

    public function admin_fee()
    {
        return $this->hasMany(ProgramBudget::class, 'program_id')
            ->where('name', 'Biaya Admin');
    }

    public function admin_fee_nominal()
    {
        $adminFee = $this->hasOne(ProgramBudget::class, 'program_id')
            ->where('name', 'Biaya Admin')
            ->first();

        return $adminFee ? $adminFee->nominal : null; // Ambil nominal atau null jika tidak ada
    }

    public function dicairkan()
    {
        $total = $this->donation_collacted();
        $admin_fee = $this->admin_fee_nominal();
        $dicairkan = $total - $admin_fee;
        return $dicairkan;
    }
}
