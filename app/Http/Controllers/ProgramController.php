<?php

namespace App\Http\Controllers;

use App\Models\Slider;
use App\Models\Program;
use App\Models\ProgramCategory;
use Illuminate\Http\Request;

class ProgramController extends Controller
{
    public function index()
    {
        $items = Program::published()->withCount('transactions_success')->latest()->paginate(12);
        $categories = ProgramCategory::orderBy('name', 'ASC')->limit(4)->get();
        $slider = Slider::get();
        return view('frontend.pages.campaign.index', [
            'title' => 'Campaign',
            'items' => $items,
            'slider' => $slider,
            'categories' => $categories,
            'category' => NULL,
            'keyword' => NULL
        ]);
    }

    public function show($slug)
    {
        $item = Program::published()->with('transactions_success', 'budgets', 'category')->withCount('transactions_success')->where('slug', $slug)->firstOrFail();
        return view('frontend.pages.campaign.show', [
            'title' => $item->name,
            'item' => $item
        ]);
    }
    public function category($slug)
    {
        $category = ProgramCategory::where('slug', $slug)->firstOrFail();
        $items = Program::published()->where('program_category_id', $category->id)->withCount('transactions_success')->latest()->paginate(12);
        $categories = ProgramCategory::orderBy('name', 'ASC')->limit(4)->get();
        $slider = Slider::get();
        return view('frontend.pages.campaign.index', [
            'title' => 'Campaign',
            'items' => $items,
            'slider' => $slider,
            'categories' => $categories,
            'category' => $category,
            'keyword' => NULL
        ]);
    }

    public function search()
    {
        $keyword = request('keyword');
        $items = Program::published()->where('name', 'LIKE', '%' . $keyword . '%')->withCount('transactions_success')->latest()->paginate(12);
        $categories = ProgramCategory::orderBy('name', 'ASC')->limit(4)->get();
        $slider = Slider::get();
        return view('frontend.pages.campaign.index', [
            'title' => 'Campaign',
            'items' => $items,
            'slider' => $slider,
            'categories' => $categories,
            'category' => NULL,
            'keyword' => $keyword
        ]);
    }
}
