<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;

class ArtikelController extends Controller
{
    public function index()
    {
        $posts = Post::published()->latest()->paginate(2);
        return view('frontend.pages.artikel.index', [
            'posts' => $posts,
            'title' => 'List Artikel',
            'keyword' => NULL
        ]);
    }

    public function detail($slug)
    {
        $post = Post::published()->with('tags', 'category')->withCount('tags')->where('slug', $slug)->firstOrFail();
        $post->increment('visitor');
        return view('frontend.pages.artikel.show', [
            'title' => $post->title,
            'post' => $post
        ]);
    }

    public function search()
    {
        $keyword = request('keyword');
        $posts = Post::published()->where('title', 'LIKE', '%' . $keyword . '%')->latest()->paginate(2);
        return view('frontend.pages.artikel.index', [
            'posts' => $posts,
            'keyword' => $keyword,
            'title' => $keyword
        ]);
    }
}
