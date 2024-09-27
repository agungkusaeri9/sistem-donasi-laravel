<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Program;
use App\Models\Withdrawal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Yajra\DataTables\DataTables as DataTablesDataTables;
use Yajra\DataTables\Facades\DataTables;

class WithdrawalController extends Controller
{
    public function __construct()
    {

        $this->middleware('can:Withdrawal View', ['only' => ['index']]);
        $this->middleware('can:Withdrawal Create', ['only' => ['store']]);
        $this->middleware('can:Withdrawal Edit', ['only' => ['update ']]);
        $this->middleware('can:Withdrawal Delete', ['only' => ['destroy ']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.pages.withdrawal.index', [
            'title' => 'Data Penarikan Dana'
        ]);
    }

    public function data()
    {
        // if (request()->ajax()) {
        $data = Withdrawal::with('program')->latest();
        return DataTablesDataTables::of($data)
            ->addIndexColumn()
            ->addColumn('program_name', function ($model) {
                return $model->program->name ?? '-';
            })
            ->editColumn('manual_payment_amount', function ($model) {
                return 'Rp ' . number_format($model->manual_payment_amount, 0, '.', '.');
            })
            ->editColumn('automatic_payment_amount', function ($model) {
                return 'Rp ' . number_format($model->automatic_payment_amount, 0, '.', '.');
            })
            ->editColumn('amount_total', function ($model) {
                return 'Rp ' . number_format($model->amount_total, 0, '.', '.');
            })
            ->addColumn('admin_fee', function ($model) {
                return 'Rp ' . number_format($model->program->admin_fee_nominal(), 0, '.', '.');
            })
            ->addColumn('dicairkan', function ($model) {
                $total = $model->amount_total;
                $admin_fee = $model->program->admin_fee_nominal();
                $dicairkan = $total - $admin_fee;
                return 'Rp ' . number_format($dicairkan, 0, '.', '.');
            })
            ->addColumn('created', function ($model) {
                return $model->created_at->translatedFormat('d-m-Y H:i:s');
            })
            ->addColumn('bank_tujuan', function ($model) {
                return $model->bankComplete();
            })
            ->editColumn('proof', function ($model) {
                $proof = "<button class='btn btn-sm btn-success btnBukti mx-1' data-url=" . $model->proof() . "><i class='fas fa fa-eye'></i> Bukti</button>";
                return $proof;
            })
            ->rawColumns(['action', 'bank_tujuan', 'proof'])
            ->make(true);
        // }
    }

    public function create()
    {
        $programs = Program::withdrawal()->whereHas('transactions_success', function ($q) {
            $q->where('nominal', '>', 0);
        })->get();
        return view('admin.pages.withdrawal.create', [
            'title' => 'Buat Penarikan Dana',
            'programs' => $programs
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        request()->validate([
            'program_id' => ['required', Rule::unique('withdrawal')->ignore(request('id'))],
            'manual_payment_amount' => ['required'],
            'automatic_payment_amount' => ['required'],
            'amount_total' => ['required', 'numeric', 'min:10000'],
            'bank_name' => ['required'],
            'bank_number' => ['required', 'numeric'],
            'bank_owner' => ['required'],
            'proof' => ['required', 'image', 'mimes:jpeg,png,jpg', 'max:2048']
        ]);
        DB::beginTransaction();
        try {
            $program = Program::findOrFail(request('program_id'));
            $data = request()->only(['program_id', 'manual_payment_amount', 'automatic_payment_amount', 'amount_total', 'bank_name', 'bank_number', 'bank_owner']);
            $data['proof'] = request()->file('proof')->store('withdrawal', 'public');
            $data['admin_fee'] = $program->admin_fee_nominal();
            $data['total'] = $program->dicairkan();
            Withdrawal::create($data);

            // update status program menjadi 3 = selesai
            Program::find(request('program_id'))->update([
                'status' => 2,
                'is_withdrawal' => 1,
                'is_published' => 0
            ]);

            DB::commit();
            return redirect()->route('admin.withdrawals.index')->with('success', 'Penarikan dana berhasil dibuat.');
        } catch (\Throwable $th) {
            //throw $th;
            DB::rollBack();
            return redirect()->back()->with('error', $th->getMessage());
        }
    }
}
