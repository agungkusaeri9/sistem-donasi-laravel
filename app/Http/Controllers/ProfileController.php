<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProfileController extends Controller
{
    public function index()
    {
        return view('frontend.pages.profile.index',[
            'title' => 'Profile Saya'
        ]);
    }

    public function update()
    {
        request()->validate([
            'name' => ['required'],
            'avatar' => ['image','mimes:jpg,jpeg,png','max:2048']
        ]);

        $data = request()->only(['name','avatar']);
        if(request()->file('avatar'))
        {
            Storage::disk('public')->delete(auth()->user()->avatar);
            $data['avatar'] = request()->file('avatar')->store('users','public');
        }else{
            $data['avatar'] = NULL;
        }

        auth()->user()->update($data);

        return redirect()->route('profile.index')->with('success','Profile berhasil disimpan.');

    }
}
