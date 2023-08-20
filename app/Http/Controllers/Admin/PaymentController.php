<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Payments;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use Illuminate\Support\Str;
use Yajra\DataTables\Facades\DataTables;

class PaymentController extends Controller
{
    public function __construct()
    {

        $this->middleware('can:Payment View', ['only' => ['index']]);
        $this->middleware('can:Payment Create', ['only' => ['store']]);
        $this->middleware('can:Payment Edit', ['only' => ['update ']]);
        $this->middleware('can:Payment Delete', ['only' => ['destroy ']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        return view('admin.pages.payments.index', [
            'title' => 'Data Pembayaran'
        ]);
    }

    public function data()
    {
        if (request()->ajax()) {
            $data = Payments::query();
            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($model) {
                    if (auth()->user()->getRoleNames()->first() === 'Admin' || auth()->user()->getPermissions('Payment Edit')) {
                        $edit = "<button class='btn btn-sm btn-info btnEdit mx-1' data-id='$model->id' data-name='$model->name' data-number='$model->number' data-description='$model->description'><i class='fas fa fa-edit'></i> Edit</button>";
                    } else {
                        $edit = "";
                    }
                    if (auth()->user()->getRoleNames()->first() === 'Admin' || auth()->user()->getPermissions('Payment Delete')) {
                        $delete = "<button class='btn btn-sm btn-danger btnDelete mx-1' data-id='$model->id' data-name='$model->name'><i class='fas fa fa-trash'></i> Hapus</button>";
                    } else {
                        $delete = "";
                    }

                    $action = $edit . $delete;
                    return $action;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
            'name' => ['required'],
            'number' => ['required', 'numeric'],
            'description' => ['required']
        ]);

        Payments::updateOrCreate([
            'id'  => request('id')
        ], [
            'name' => request('name'),
            'number' => request('number'),
            'description' => request('description')
        ]);

        if (request('id')) {
            $message = 'Metode Pembayaran berhasil disimpan.';
        } else {
            $message = 'Metode Pembayaran berhasil ditambahakan.';
        }
        return response()->json(['status' => 'succcess', 'message' => $message]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Payments::find($id)->delete();
        return response()->json(['status' => 'succcess', 'message' => 'Metode Pembayaran berhasil dihapus.']);
    }
}
