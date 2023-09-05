<?php

namespace App\Http\Controllers\Admin;

use App\Exports\TransactionExport;
use App\Helper\Wablas;
use App\Http\Controllers\Controller;
use App\Models\Payments;
use App\Models\Program;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Yajra\Datatables\Facades\Datatables;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\App;
use Maatwebsite\Excel\Facades\Excel;

class TransactionController extends Controller
{
    public function __construct()
    {

        $this->middleware('can:Transaction View', ['only' => ['index']]);
        $this->middleware('can:Transaction Print', ['only' => ['print ']]);
        $this->middleware('can:Transaction Export', ['only' => ['export ']]);
        $this->middleware('can:Transaction Change Status', ['only' => ['changeStatus ']]);
        $this->middleware('can:Transaction Detail', ['only' => ['show ']]);
        $this->middleware('can:Trash View', ['only' => ['trash']]);
        $this->middleware('can:Trash Restore', ['only' => ['restore']]);
        $this->middleware('can:Trash Delete Permanent', ['only' => ['deletePermanent']]);
    }
    public function index()
    {
        $programs = Program::select('id', 'name')->get();
        return view('admin.pages.transaction.index', [
            'title' => 'Data Transaksi',
            'programs' => $programs
        ]);
    }

    public function data(Request $request)
    {
        if (request()->ajax()) {
            return datatables()->eloquent(Transaction::query()->with('program')->latest())
                ->addIndexColumn()
                ->editColumn('nominal', function ($model) {
                    return 'Rp. ' . number_format($model->nominal);
                })
                ->addColumn('action', function ($model) {
                    if (auth()->user()->getRoleNames()->first() === 'Admin' || auth()->user()->getPermissions('Transaction Detail')) {
                        $detail = "<button class='btn btn-sm btn-warning btnDetail mx-1' data-id='$model->id' data-title='$model->name'><i class='fas fa fa-eye'></i> Detail</button>";
                    } else {
                        $detail = "";
                    }

                    if (auth()->user()->getRoleNames()->first() === 'Admin' || auth()->user()->getPermissions('Transaction Delete')) {
                        $delete = "<button class='btn btn-sm btn-danger btnDelete mx-1' data-id='$model->id' data-title='$model->name'><i class='fas fa fa-trash'></i> Hapus</button>";
                    } else {
                        $delete = "";
                    }
                    $action = $detail . $delete;
                    return $action;
                })
                ->addColumn('verification', function ($model) {
                    if (auth()->user()->getRoleNames()->first() === 'Admin' || auth()->user()->getPermissions('Transaction Change Status')) {

                        if ($model->is_verified == 1) {
                            if ($model->type === 'otomatis') {
                                $is_verified = '<div class="custom-control custom-switch">
                                    <input type="checkbox" value=' . $model->is_verified . ' class="custom-control-input btnStatus" checked id=' . $model->id . ' data-id="' . $model->id . '" disabled title="tidak bisa dikarenakan">
                                    <label class="custom-control-label btnDisabled" for=' . $model->id . '></label>
                                </div>';
                            } else {
                                $is_verified = '<div class="custom-control custom-switch">
                                    <input type="checkbox" value=' . $model->is_verified . ' class="custom-control-input btnStatus" checked id=' . $model->id . ' data-id="' . $model->id . '" title="tidak bisa dikarenakan">
                                    <label class="custom-control-label" for=' . $model->id . '></label>
                                </div>';
                            }
                        } else {
                            if ($model->type === 'otomatis') {
                                $is_verified = '<div class="custom-control custom-switch">
                                        <input type="checkbox"  value=' . $model->is_verified . ' class="custom-control-input btnStatus" id=' . $model->id . ' data-id="' . $model->id . '" disabled title="tidak bisa dikarenakan">
                                        <label class="custom-control-label btnDisabled" for=' . $model->id . '></label>
                                    </div>';
                            } else {
                                $is_verified = '<div class="custom-control custom-switch">
                                        <input type="checkbox"  value=' . $model->is_verified . ' class="custom-control-input btnStatus" id=' . $model->id . ' data-id="' . $model->id . '" title="tidak bisa dikarenakan">
                                        <label class="custom-control-label" for=' . $model->id . '></label>
                                    </div>';
                            }
                        }
                    } else {
                        $is_verified = "";
                    }


                    return $is_verified;
                })
                ->addColumn('program_name', function ($model) {
                    return $model->program->name ?? '-';
                })
                ->addColumn('invoice', function ($model) {
                    return '#' . $model->code;
                })
                ->addColumn('created', function ($model) {
                    return $model->created_at->translatedFormat('h:i:s  d M Y');
                })
                ->filter(function ($instance) use ($request) {

                    if ($request->get('program_id')) {

                        $instance->where('program_id', $request->get('program_id'));
                    }
                    if ($request->get('is_verified')) {
                        $ver = request('is_verified') == 1 ? "1" : "0";
                        $instance->where('is_verified', $ver);
                    }

                    if ($request->get('month')) {

                        $instance->whereMonth('created_at', $request->get('month'));
                    }
                    if ($request->get('year')) {

                        $instance->whereYear('created_at', $request->get('year'));
                    }
                })
                ->rawColumns(['action', 'verification'])
                ->make(true);
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
        $transaction = Transaction::find($id);
        if ($transaction->is_verified == 1) {
            return response()->json(['status' => 'error', 'message' => 'Transaksi yang sudah terverifikasi tidak bisa dihapus.']);
        }
        $transaction->delete();
        return response()->json(['status' => 'success', 'message' => 'Data Transaksi berhasil dihapus.']);
    }

    public function changeStatus()
    {
        $is_verified = request('status');
        $item = Transaction::with('program')->findOrFail(request('id'));

        // cek dulu apakah program sudah dilakukan penarikan dana
        if ($item->program->is_withdrawal == 1) {
            return response()->json(['status' => 'error', 'message' => 'Status Transaksi tidak dapat dirubah dikarenakan program tersebut sudah dilakukan penarikan dana.']);
        } else {
            if ($is_verified == 1) {
                $item->is_verified = 0;
            } elseif ($is_verified == 0) {
                // send wa ke donatur
                $item->is_verified = 1;
            }
            $item->save();
            if ($item->is_verified == 1)
                Wablas::send($item->id, $item->phone_number, "Update");

            return response()->json(['status' => 'success', 'message' => 'Status Transaksi berhasil diubah.']);
        }
    }

    public function getById()
    {
        $id = request('id');
        $item = Transaction::with(['payment', 'program'])->find($id);
        $item->created = $item->created_at->translatedFormat('h:i:s d M Y');
        if ($item->evidence) {
            $item->evidence = $item->evidenceDownload();
        } else {
            $item->evidence = NULL;
        }
        return response()->json($item);
    }

    public function print()
    {

        try {
            ini_set('max_execution_time', 300);
            ini_set("memory_limit", "1024M");

            $program_id = request('program_id');
            $is_verified = request('is_verified');
            $month = request('month');
            $year = request('year');

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

            $pdf = Pdf::loadView('admin.pages.transaction.print', [
                'items' => $data->get(),
                'program_id' => $program_id,
                'is_verified' => $is_verified,
                'count' => $count,
                'month' => $this->getMonthName($month),
                'year' => $year
            ]);
            $fileName = "Laporan-transaksi-" . date('Y-m-d') . '.pdf';
            // return $pdf->download($fileName);
            return $pdf->stream();
        } catch (\Throwable $th) {
            return $th;
            return redirect()->route('admin.transactions.index')->with('error', 'Sistem Bermasalah!');
        }
    }

    public function export()
    {
        try {
            $program_id = request('program_id');
            $is_verified = request('is_verified');
            $month =  request('month');
            $year = request('year');
            $fileName = "Laporan-transaksi-" . date('Y-m-d') . '.xlsx';
            return Excel::download(new TransactionExport($program_id, $is_verified, $month, $year), $fileName);
        } catch (\Throwable $th) {
            return redirect()->route('admin.transactions.index')->with('error', 'Sistem Bermasalah!');
        }
    }

    public function trash()
    {
        if (request()->ajax()) {
            return datatables()->eloquent(Transaction::query()->with('program')->onlyTrashed()->latest())
                ->addIndexColumn()
                ->addColumn('program', function ($model) {
                    return $model->program->name ?? '-';
                })
                ->addColumn('action', function ($model) {
                    if (auth()->user()->getRoleNames()->first() === 'Admin' || auth()->user()->getPermissions('Trash Restore')) {
                        $restore = "<button class='btn btn-sm btn-info btnRestore d-inline mx-1' data-id='$model->id' data-title='$model->code'><i class='fas fa fa-trash'></i> Restore</button>";
                    } else {
                        $restore = "";
                    }

                    if (auth()->user()->getRoleNames()->first() === 'Admin' || auth()->user()->getPermissions('Trash Delete Permanent')) {
                        $delete = "<button class='btn btn-sm btn-danger btnDelete d-inline mx-1' data-id='$model->id' data-title='$model->code'><i class='fas fa fa-trash'></i> Hapus Permanen</button>";
                    } else {
                        $delete = "";
                    }
                    $action = $restore . $delete;
                    return $action;
                })
                ->addColumn('invoice', function ($model) {
                    return '#' . $model->code;
                })
                ->addColumn('created', function ($model) {
                    return $model->created_at->translatedFormat('d F Y');
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('admin.pages.transaction.trash', [
            'title' => 'Keranjang Sampah Transaksi'
        ]);
    }

    public function deletePermanent($id)
    {
        $item = Transaction::onlyTrashed()->find($id);
        $item->forceDelete();
        return response()->json(['status' => 'succcess', 'message' => 'Program dihapus secara permanen.']);
    }

    public function restore($id)
    {
        $item = Transaction::onlyTrashed()->find($id);
        $item->restore();
        return response()->json(['status' => 'succcess', 'message' => 'Program berhasil dipulihkan dari keranjang sampah.']);
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
