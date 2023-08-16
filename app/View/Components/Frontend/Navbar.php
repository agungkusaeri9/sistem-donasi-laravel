<?php

namespace App\View\Components\Frontend;

use App\Models\ProgramCategory;
use App\Models\Setting;
use Illuminate\View\Component;

class Navbar extends Component
{
    /**
     * Create a new component instance.
     *
     * @return void

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        $setting = Setting::first();
        $categories = ProgramCategory::orderBy('name','ASC')->get();
        return view('components.frontend.navbar',[
            'setting' => $setting,
            'categories' => $categories
        ]);
    }
}
