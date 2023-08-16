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
        if (request()->ajax()) {
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
                ->addColumn('created', function ($model) {
                    return $model->created_at->translatedFormat('d-m-Y H:i:s');
                })
                ->rawColumns(['action'])
                ->make(true);
        }
    }

    public function create()
    {
        $programs = Program::withdrawal()->get();
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
            'amount_total' => ['required', 'numeric', 'min:10000']
        ]);


        DB::beginTransaction();
        try {
            $data = request()->only(['program_id', 'manual_payment_amount', 'automatic_payment_amount', 'amount_total']);
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

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $item = Socmed::find($id);
        if ($item->icon)
            Storage::disk('public')->delete($item->icon);
        $item->delete();
        return response()->json(['status' => 'succcess', 'message' => 'Data Penarikan Dana berhasil dihapus.']);
    }
}
