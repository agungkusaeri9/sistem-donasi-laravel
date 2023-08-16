<?php

namespace App\Http\Controllers;

use App\Models\Transaction;
use Illuminate\Http\Request;

class InvoiceController extends Controller
{
    public function index()
    {
        return view('frontend.pages.invoice.index',[
            'title' => 'Cek Invoice',
            'item' => NULL,
            'status' => false,
            'code' => NULL
        ]);
    }

    public function check()
    {
        request()->validate([
            'code' => ['required','string']
        ]);
        $code = request()->code;
        $item = Transaction::with(['program','payment'])->where('code',$code)->first();

        return view('frontend.pages.invoice.index',[
            'title' => 'Cek Invoice',
            'item' => $item,
            'status' => true,
            'code' => $code
        ]);
    }
}
