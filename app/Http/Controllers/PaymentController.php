<?php

namespace App\Http\Controllers;

use App\Models\Payments;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function get()
    {
        $items = Payments::orderBy('name','ASC')->get();
        if($items)
        {
            $data = [
                'code' => 200,
                'status' => true,
                'data' => $items
            ];
        }else{
            $data = [
                'code' => 400,
                'status' => false,
                'data' => NULL
            ];
        }

        return response()->json($data);
    }
}
