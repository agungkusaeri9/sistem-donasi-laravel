<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use Illuminate\Auth\MustVerifyEmail;
use Illuminate\Contracts\Auth\MustVerifyEmail as AuthMustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable implements AuthMustVerifyEmail
{
    use HasApiTokens, HasFactory, HasRoles, Notifiable, SoftDeletes, MustVerifyEmail;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'username',
        'avatar',
        'status'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function avatar()
    {
        if ($this->avatar) {
            return asset('storage/' . $this->avatar);
        } else {
            return asset('assets/img/avatar/avatar-1.png');
        }
    }

    public function status()
    {
        if ($this->status === 1) {
            return '<span class="badge badge-success">Aktif</span>';
        } else {
            return '<span class="badge badge-danger">Tidak Aktif</span>';
        }
    }

    public function posts()
    {
        return $this->hasMany(Post::class);
    }

    public function getPermissions($permission)
    {
        return $this->roles->map(function ($role) {
            return $role->permissions;
        })->collapse()->unique()->where('name',$permission)->first();
        // return $this->roles()->first()->getAllPermissions();
    }

}
