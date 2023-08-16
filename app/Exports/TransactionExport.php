<?php

namespace App\Exports;

use App\Models\Payments;
use App\Models\Transaction;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class TransactionExport implements FromView
{
    private $program_id;
    private $is_verified;
    public function __construct($program_id,$is_verified)
    {
        $this->program_id = $program_id;
        $this->is_verified = $is_verified;
    }

    public function view(): View
    {
        $program_id = $this->program_id;
        $is_verified = $this->is_verified;

        $items = Transaction::with(['payment','program']);
        // jika program_id dan is_verified di isi atau 1/2
        if($program_id && $is_verified !== NULL)
        {
            if($is_verified == 2){
                $is_verified = 0;
            }

            $items->where('program_id',$program_id)->where('is_verified',$is_verified)->latest();
            $payments2 = Transaction::select('payment_id', 'program_id')->where('program_id', $program_id)->where('is_verified', $is_verified)->with(['payment.transactions'])->groupBy('payment_id')->groupBy('program_id')->get();
        }elseif($program_id && $is_verified === NULL)
        {
            $items->where('program_id',$program_id);
            $payments2 = Transaction::select('program_id','payment_id')->with(['payment.transactions'])->groupBy('payment_id')->groupBy('program_id')->get();
        }elseif(!$program_id && $is_verified)
        {
            if($is_verified == 2){
                $is_verified = 0;
            }

            $items->where('is_verified',$is_verified)->latest();
            $payments2 = Transaction::select('payment_id')->with(['payment.transactions'])->groupBy('payment_id')->get();
        }else{
            $items->latest();
            $payments2 = Transaction::select('payment_id','program_id')->with(['payment.transactions'])->groupBy('payment_id')->groupBy('program_id')->get();
        }

        $count = [
            'sum_total_program' => Transaction::where('is_verified', 1)->where('program_id', $program_id)->sum('nominal') ?? 0,
            'sum_total_without_program' =>Transaction::where('is_verified', 1)->sum('nominal') ?? 0,
            'sum_not_total' => Transaction::where('is_verified', 0)->where('program_id', $program_id)->sum('nominal') ?? 0
        ];

        $payments = Payments::with(['transactions.program'])->whereIn('id', $payments2->pluck('payment_id'))->groupBy('id')->get();
        return view('admin.pages.transaction.excel', [
            'items' => $items->get(),
            'program_id' => $program_id,
            'is_verified' => $is_verified,
            'count' => $count,
            'payments' => $payments
        ]);
    }
}
