<?php

namespace App\Http\Controllers;

use App\Helper\Wablas;
use App\Models\Payments;
use App\Models\Program;
use App\Models\Setting;
use App\Models\Transaction;
use App\Models\TransactionDetail;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Midtrans\Snap;


class TransactionController extends Controller
{
    public function index()
    {
        $items = Transaction::with(['program', 'payment'])->where('user_id', auth()->id())->latest()->get();

        return view('frontend.pages.transaction.index', [
            'title' => 'Donasi Saya',
            'items' => $items
        ]);
    }

    public function payment($slug)
    {
        $item = Program::where('slug', $slug)->first();
        $target_donasi = $item->donation_target;
        $terkumpul = $item->transactions_success->sum('nominal');

        if ($terkumpul >= $target_donasi || $item->count_day() < 1) {
            return redirect()->route('campaign.show', $item->slug)->with('error', 'Donasi sudah melebihi target atau waktu donasi sudah habis.');
        }
        $payments = Payments::orderBy('name', 'ASC')->get();
        return view('frontend.pages.transaction.payment', [
            'title' => 'Pilih Metode Pembayaran',
            'item' => $item,
            'payments' => $payments
        ]);
    }

    public function donate()
    {
        request()->validate([
            'nominal' => ['required', 'numeric'],
            'program_id' => ['required', 'numeric'],
            'phone_number' => ['required'],
            'name' => ['required']
        ]);

        $data = request()->only(['payment_id', 'name', 'acceptance', 'is_anonim', 'nominal', 'program_id', 'email', 'phone_number', 'type']);
        $data['phone_number'] = request('phone_number');

        if (request('type') === 'manual') {
            if (request('payment_id') == NULL) {
                return redirect()->back()->with('error', 'Pilih terlebih dahulu metode pembayarannya.');
            }
        }

        try {
            // cek login
            if (Auth::check() == FALSE) {
                $data['user_id'] = NULL;
            } else {
                $data['user_id'] = auth()->id();
            }

            // cek nominal apakah lebih dari sisa
            $program = Program::findOrFail(request('program_id'));
            if (request('nominal') > $program->deficiency()) {
                $nominal = $program->deficiency();
            } else {
                $nominal = request('nominal');
            }

            $u_code = rand(100, 999);
            $data['u_code'] = $u_code;
            $data['nominal'] = $nominal + $u_code;
            $latest = Transaction::withTrashed()->latest()->first();
            // cek apakah ada transaksi
            if ($latest) {
                $code_date = Str::substr($latest->code, 0, 8);
                $current_date = Carbon::now()->translatedFormat('Ymd');
                if ($code_date === $current_date) {
                    $code_latest = Str::substr($latest->code, 8);
                    $new_code = $code_date . str_pad(($code_latest + 1), 3, "0", STR_PAD_LEFT);
                } else {
                    $current_date = Carbon::now()->translatedFormat('Ymd');
                    $new_code = $current_date . str_pad(1, 3, "0", STR_PAD_LEFT);
                }
            } else {
                $current_date = Carbon::now()->translatedFormat('Ymd');
                $new_code = $current_date . str_pad(1, 3, "0", STR_PAD_LEFT);
            }

            // dd($latest_id);
            $data['code'] = $new_code;
            // insert ke db
            $transaction = Transaction::create($data);

            if ($transaction->type === 'manual') {
                // send notification admin
                Wablas::sendAdmin($transaction->id);

                // send notification donatur
                Wablas::send($transaction->id, $transaction->phone_number, 'Created');
            }
            $encrypt_code = encrypt($transaction->code);
            return redirect()->route('success', $encrypt_code)->with(['success', 'Donasi Berhasil silahkan lakukan transfer!', 'code' => $transaction->code]);
        } catch (\Throwable $th) {
            return $th;
            return redirect()->back()->with('error', 'Donasi Gagal');
        }
    }

    public function success($token)
    {
        $code = decrypt($token);
        if (!$code) {
            return redirect()->route('home');
        }
        $item = Transaction::where('code', $code)->first();
        $setting = Setting::first();
        return view('frontend.pages.transaction.success', [
            'title' => 'Berhasil',
            'item' => $item,
            'setting' => $setting
        ]);
    }

    public function createPayment()
    {
        $transaction_id = request('transaction_id');
        // Set your Merchant Server Key
        \Midtrans\Config::$serverKey = env('MIDTRANS_SERVER_KEY');
        // Set to Development/Sandbox Environment (default). Set to true for Production Environment (accept real transaction).
        \Midtrans\Config::$isProduction = env('MIDTRANS_IS_PRODUCTION');
        // Set sanitization on (default)
        \Midtrans\Config::$isSanitized = true;
        // Set 3DS transaction for credit card to true
        \Midtrans\Config::$is3ds = true;

        $transaction = Transaction::findOrFail($transaction_id);


        $params = array(
            'transaction_details' => array(
                'order_id' => $transaction->code,
                'gross_amount' => $transaction->nominal,
            ),
            'customer_details' => array(
                'first_name' => $transaction->name ?? '-'
            ),
        );

        $snaptoken = Snap::getSnapToken($params);
        $transaction->details()->create([
            'snap_token' => $snaptoken
        ]);
        // $transaction->snaptoken = $snaptoken;
        // $transaction->save();

        return response()->json($snaptoken);
    }
}
