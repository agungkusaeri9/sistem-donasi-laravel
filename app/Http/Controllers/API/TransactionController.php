<?php

namespace App\Http\Controllers\API;

use App\Helper\Wablas;
use App\Http\Controllers\Controller;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Facades\Validator;
use Midtrans\Notification as MidtransNotification;

class TransactionController extends Controller
{
    public function transactionHandling2()
    {
        $order_id = request('order_id');
        $status_code = request('status_code');
        $gross_amount = request('gross_amount');
        $serverKey = env('SERVER_KEY');
        $signature = hash('sha512', $order_id . $status_code . $gross_amount . $serverKey);

        if ($signature !== request('signature_key')) {
            return 'Kesalahan dalam kode keamanan';
        }
        // cek payment
        $transaction = Transaction::with('details')->where('code', $order_id)->first();

        // return response()->json($transaction);
        if ($transaction) {
            if (request()->transaction_status === 'capture' || request()->transaction_status === 'settlement') {
                $transaction->update([
                    'is_verified' => 1
                ]);
            }
            // $transaction->details()->update([
            //     'transaction_time' => request()->transaction_time,
            //     'transaction_status' => request()->transaction_status,
            //     'transaction_uuid' => request()->transaction_id,
            //     'store' => request()->store,
            //     'status_message' => request()->status_message,
            //     'status_code' => request()->status_code,
            //     'signature_key' => request()->signature_key,
            //     'settlement_time' => request()->settlement_time,
            //     'payment_type' => request()->payment_type,
            //     'payment_code' => request()->payment_code,
            //     'order_id' => request()->order_id,
            //     'merchant_id' => request()->merchant_id,
            //     'gross_amount' => request()->gross_amount,
            //     'fraud_status' => request()->fraud_status,
            //     'currency' => request()->currency,
            // ]);
        } else {
            // $transaction->details()->create([
            //     'transaction_time' => request()->transaction_time,
            //     'transaction_status' => request()->transaction_status,
            //     'transaction_uuid' => request()->transaction_id,
            //     'store' => request()->store,
            //     'status_message' => request()->status_message,
            //     'status_code' => request()->status_code,
            //     'signature_key' => request()->signature_key,
            //     'settlement_time' => request()->settlement_time,
            //     'payment_type' => request()->payment_type,
            //     'payment_code' => request()->payment_code,
            //     'order_id' => request()->order_id,
            //     'merchant_id' => request()->merchant_id,
            //     'gross_amount' => request()->gross_amount,
            //     'fraud_status' => request()->fraud_status,
            //     'currency' => request()->currency,
            // ]);
        }
        return response()->json($transaction);


        // if ($payment->transaction_status === 'settlement' || $payment->transaction_status === 'capture') {
        //     return redirect()->back()->with('success', 'Anda berhasil melakukan pembayaran. Silahkan tunggu sistem untuk memvalidasi.');
        // } elseif ($payment->transaction_status === 'expire') {
        //     return redirect()->back()->with('error', 'Pembayaran anda sudah kadaluarsa. Silahkan checkout kembali.');
        // } elseif ($payment->transaction_status === 'pending') {
        //     return redirect()->back()->with('success', 'Pembayaran sedang diproses.');
        // }
    }

    public function transactionHandling3()
    {
        \Midtrans\Config::$isProduction = false;
        \Midtrans\Config::$serverKey = env('SERVER_KEY');

        $transaction_status = request()->transaction_status;
        $type = request()->payment_type;
        $order_id = request()->order_id;
        $fraud = request()->fraud_status;
        $status_code = request('status_code');
        $gross_amount = request('gross_amount');
        $serverKey = env('SERVER_KEY');
        $signature = hash('sha512', $order_id . $status_code . $gross_amount . $serverKey);

        if ($signature !== request('signature_key')) {
            return response()->json('Kesalahan kode keamanan!');
        }

        $transaction = Transaction::where('code', $order_id)->first();
        // return response()->json(request()->all());

        if ($transaction_status == 'capture') {
            // transfer bank

        } else if ($transaction_status == 'settlement') {
            $is_veried = 0;
            if ($type === 'bank_transfer') {
                if ($fraud === 'accept') {
                    // transaksi di acc
                    $transaction->update([
                        'is_verified' => 1
                    ]);
                    // $transaction->details()->create([
                    //     'transaction_time' => request()->transaction_time,
                    //     'transaction_status' => request()->transaction_status,
                    //     'transaction_uuid' => request()->transaction_id,
                    //     'store' => request()->store,
                    //     'status_message' => request()->status_message,
                    //     'status_code' => request()->status_code,
                    //     'signature_key' => request()->signature_key,
                    //     'settlement_time' => request()->settlement_time,
                    //     'payment_type' => request()->payment_type,
                    //     'payment_code' => request()->payment_code,
                    //     'order_id' => request()->order_id,
                    //     'merchant_id' => request()->merchant_id,
                    //     'gross_amount' => request()->gross_amount,
                    //     'fraud_status' => request()->fraud_status,
                    //     'currency' => request()->currency,
                    // ]);
                }
            } else if ($type === 'echannel') {
                if ($fraud === 'accept') {
                    // transaksi di acc
                    $transaction->update([
                        'is_verified' => 1
                    ]);
                    // $transaction->details()->create([
                    //     'transaction_time' => request()->transaction_time,
                    //     'transaction_status' => request()->transaction_status,
                    //     'transaction_uuid' => request()->transaction_id,
                    //     'store' => request()->store,
                    //     'status_message' => request()->status_message,
                    //     'status_code' => request()->status_code,
                    //     'signature_key' => request()->signature_key,
                    //     'settlement_time' => request()->settlement_time,
                    //     'payment_type' => request()->payment_type,
                    //     'payment_code' => request()->payment_code,
                    //     'order_id' => request()->order_id,
                    //     'merchant_id' => request()->merchant_id,
                    //     'gross_amount' => request()->gross_amount,
                    //     'fraud_status' => request()->fraud_status,
                    //     'currency' => request()->currency,
                    // ]);
                }
            } else {
                $transaction->update([
                    'is_verified' => 1
                ]);
            }
        } else if ($transaction_status == 'pending') {
            // TODO set payment status in merchant's database to 'Pending'
            echo "Waiting customer to finish transaction order_id: " . $order_id . " using " . $type;
        } else if ($transaction_status == 'deny') {
            // TODO set payment status in merchant's database to 'Denied'
            echo "Payment using " . $type . " for transaction order_id: " . $order_id . " is denied.";
        } else if ($transaction_status == 'expire') {
            // TODO set payment status in merchant's database to 'expire'
            echo "Payment using " . $type . " for transaction order_id: " . $order_id . " is expired.";
        } else if ($transaction_status == 'cancel') {
            // TODO set payment status in merchant's database to 'Denied'
            echo "Payment using " . $type . " for transaction order_id: " . $order_id . " is canceled.";
        }
    }

    public function check()
    {
        $validator = Validator::make(request()->all(), [
            'code' => ['required'],
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors());
        }
        $code = request('code');

        $item = Transaction::where('code', $code)->first();
        if (!$item) {
            $status = false;
            $item = NULL;
            $message = "Invoide tidak ditemukan";
            $rescode = 403;
        } else {
            $status = true;
            $message = "Invoice ditemukan";
            $rescode = 200;
        }

        $data = [
            'status' => $status,
            'code' => $rescode,
            'data' => $item,
            'message' => $message
        ];

        return response()->json($data);
    }

    public function transactionHandling()
    {
        \Midtrans\Config::$isProduction = env('MIDTRANS_IS_PRODUCTION');
        \Midtrans\Config::$serverKey = env('MIDTRANS_SERVER_KEY');
        $notif = new \Midtrans\Notification();

        $transaction = $notif->transaction_status;
        $type = $notif->payment_type;
        $order_id = $notif->order_id;
        $fraud = $notif->fraud_status;
        $item = Transaction::where('code', $order_id)->first();

        if ($transaction == 'capture') {
            $item->update([
                'is_verified' => 1
            ]);
        } else if ($transaction == 'settlement') {
            $item->update([
                'is_verified' => 1
            ]);
        } else if ($transaction == 'pending') {
            // TODO set payment status in merchant's database to 'Pending'
            echo "Waiting customer to finish transaction order_id: " . $order_id . " using " . $type;
        } else if ($transaction == 'deny') {
            // TODO set payment status in merchant's database to 'Denied'
            echo "Payment using " . $type . " for transaction order_id: " . $order_id . " is denied.";
        } else if ($transaction == 'expire') {
            // TODO set payment status in merchant's database to 'expire'
            echo "Payment using " . $type . " for transaction order_id: " . $order_id . " is expired.";
        } else if ($transaction == 'cancel') {
            // TODO set payment status in merchant's database to 'Denied'
            echo "Payment using " . $type . " for transaction order_id: " . $order_id . " is canceled.";
        }
    }
}
