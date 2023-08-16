<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\PostCategory;
use App\Models\PostTag;
use App\Models\Program;
use App\Models\ProgramCategory;
use App\Models\Transaction;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function __construct()
    {

        $this->middleware('can:Dashboard', ['only' => ['index']]);
    }
    public function index()
    {
        $count = [
            'users' => User::count(),
            'posts' => auth()->user()->posts()->count(),
            'post_categories' => PostCategory::count(),
            'post_tags' => PostTag::count(),
            'transactions' => Transaction::count()
        ];

        $transactions = Transaction::with('program')->latest()->limit(10)->get();

        return view('admin.pages.dashboard', [
            'title' => 'Dashboard',
            'count' => $count,
            'transactions' => $transactions
        ]);
    }

    public function ajaxTransaction()
    {

        if (request()->ajax()) {
            $year = Carbon::now()->format('Y');
            $query = Transaction::select(DB::raw('sum(transactions.nominal) as `nominal`'), DB::raw("DATE_FORMAT(created_at, '%m') month"),  DB::raw('YEAR(created_at) year'))
            ->groupby('month','year')
            ->whereYear('created_at',$year)
            ->orderBy('month','ASC')
            ->get();

            $month = [];
            $bg = [];
            $bg2 = [];
            $nominal = [];
            $qNominal = $query->pluck('nominal');
            $qMonth = $query->pluck('month');

            for($i = 0; $i < count($qMonth); $i++)
            {
                $mn = $this->toMonth($qMonth[$i]);
                $b = 'rgba('. rand(1,255) .', '. rand(1,255) .', '. rand(1,255) .', 0.2)';
                $b2 = 'rgba('. rand(1,255) .', '. rand(1,255) .', '. rand(1,255) .', 0.2)';
                array_push($month,$mn);
                array_push($bg,$b);
                array_push($bg2,$b2);
                array_push($nominal,$qNominal[$i]);
            }


            $data = [
                $month,
                $nominal,
                $bg,
                $bg2
            ];



            return response()->json($data);
        }
    }

    public function ajaxKategoriProgram()
    {

        if (request()->ajax()) {
            $query = DB::table('programs')
                ->select('program_categories.name', DB::RAW('count(programs.id) as jumlah'))
                ->join('program_categories', 'program_categories.id', '=', 'programs.program_category_id', 'right')
                ->groupBy('program_categories.id')
                ->get();


            $data = [
                $query->pluck('name'),
                $query->pluck('jumlah')
            ];
            return response()->json($data);
        }
    }

    public function toMonth($monthNumber)
    {
        switch ($monthNumber) {
            case '01':
                return 'Jan';
                break;
            case '02':
                return 'Feb';
                break;
            case '03':
                return 'Mar';
                break;
            case '04':
                return 'Apr';
                break;
            case '05':
                return 'Mei';
                break;
            case '06':
                return 'Jun';
                break;
            case '07':
                return 'Jul';
                break;
            case '08':
                return 'Agu';
                break;
            case '09':
                return 'Sep';
                break;
            case '10':
                return 'Okt';
                break;
            case '11':
                return 'Nov';
                break;
            case '12':
                return 'Des';
                break;
            default:
                return 'Salah';
        }
    }
}
