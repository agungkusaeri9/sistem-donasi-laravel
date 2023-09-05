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
    private $month;
    private $year;
    public function __construct($program_id, $is_verified, $month, $year)
    {
        $this->program_id = $program_id;
        $this->is_verified = $is_verified;
        $this->month = $month;
        $this->year = $year;
    }

    public function view(): View
    {
        $program_id = $this->program_id;
        $is_verified = $this->is_verified;
        $month = $this->month;
        $year = $this->year;
        $items = Transaction::with(['payment', 'program']);
        // jika program_id dan is_verified di isi atau 1/2
        if ($program_id) {
            $data = $items->where('program_id', $program_id);
        }
        if ($is_verified == 1) {
            $data = $items->where('is_verified', 1);
        } elseif ($is_verified == 2) {
            $data = $items->where('is_verified', 0);
        }

        if ($month) {
            $data = $items->whereMonth('created_at', $month);
        }

        if ($year) {
            $data = $items->whereYear('created_at', $year);
        }

        $data = $items->latest();

        $count = [
            'sum_total_program' => $data->sum('nominal'),
            'sum_total_without_program' => Transaction::where('is_verified', 1)->sum('nominal') ?? 0,
            'sum_not_total' => Transaction::where('is_verified', 0)->where('program_id', $program_id)->sum('nominal') ?? 0
        ];

        return view('admin.pages.transaction.excel', [
            'items' => $data->get(),
            'program_id' => $program_id,
            'is_verified' => $is_verified,
            'count' => $count,
            'month' => $this->getMonthName($month),
            'year' => $year
        ]);
    }

    public function getMonthName($monthNumber)
    {
        switch ($monthNumber) {
            case 1:
                $monthName = "Januari";
                break;
            case 2:
                $monthName = "Februari";
                break;
            case 3:
                $monthName = "Maret";
                break;
            case 4:
                $monthName = "April";
                break;
            case 5:
                $monthName = "Mei";
                break;
            case 6:
                $monthName = "Juni";
                break;
            case 7:
                $monthName = "Juli";
                break;
            case 8:
                $monthName = "Agustus";
                break;
            case 9:
                $monthName = "September";
                break;
            case 10:
                $monthName = "Oktober";
                break;
            case 11:
                $monthName = "November";
                break;
            case 12:
                $monthName = "Desember";
                break;
            default:
                $monthName = NULL;
                break;
        }

        return $monthName;
    }
}
