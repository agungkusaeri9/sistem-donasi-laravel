<?php

namespace App\Http\Controllers;

use App\Models\Program;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TransController extends Controller
{
    public function index(){
        $title = 'Transparansi Dana';
        $items = Program::where('status',0)->with('transactions_success')->whereHas('transactions_success', function($query){
                $query->where('nominal','>',0);
                 })->withCount('transactions_success')->latest()->get();
        return view('frontend.pages.transparansi.index',[
            'title' => $title,
            'items' => $items
        ]);
    }
}
