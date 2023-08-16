<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Socmed;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Str;

class SocmedController extends Controller
{
    public function __construct()
    {

        $this->middleware('can:Social Media View', ['only' => ['index']]);
        $this->middleware('can:Social Media Create', ['only' => ['store']]);
        $this->middleware('can:Social Media Edit', ['only' => ['update ']]);
        $this->middleware('can:Social Media Delete', ['only' => ['destroy ']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.pages.socmed.index', [
            'title' => 'Data Sosial Media'
        ]);
    }

    public function data()
    {
        if (request()->ajax()) {
            $data = Socmed::query();
            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($model) {
                    if (auth()->user()->getRoleNames()->first() === 'Super Admin' || auth()->user()->getPermissions('Social Media Edit')) {
                        $edit = "<button class='btn btn-sm btn-info btnEdit mx-1' data-id='$model->id' data-name='$model->name'  data-link='$model->link'><i class='fas fa fa-edit'></i> Edit</button>";
                    } else {
                        $edit = "";
                    }
                    if (auth()->user()->getRoleNames()->first() === 'Super Admin' || auth()->user()->getPermissions('Social Media Delete')) {
                        $delete = "<button class='btn btn-sm btn-danger btnDelete mx-1' data-id='$model->id' data-name='$model->name'><i class='fas fa fa-trash'></i> Hapus</button>";
                    } else {
                        $delete = "";
                    }

                    $action = $edit . $delete;
                    return $action;
                })
                ->editColumn('icon', function ($model) {
                    return '<img src="' . $model->icon() . '" class="img-fluid" style="max-height:50px">';
                })
                ->rawColumns(['action', 'icon'])
                ->make(true);
        }
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
            'name' => ['required', Rule::unique('socmeds')->ignore(request('id'))],
            'icon' => ['image', 'mimes:jpg,jpeg,png,svg', 'max:2048'],
            'link' => ['required']
        ]);




        if (request('id')) {
            $item = Socmed::find(request('id'));
            if (request()->file('icon')) {
                if ($item->icon)
                    Storage::disk('public')->delete($item->icon);
                $icon = request()->file('icon')->store('socmed', 'public');
            } else {
                $icon = $item->icon;
            }
        } else {
            if (request()->file('icon')) {
                $icon = request()->file('icon')->store('socmed', 'public');
            } else {
                $icon = NULL;
            }
        }

        Socmed::updateOrCreate([
            'id'  => request('id')
        ], [
            'name' => request('name'),
            'icon' => $icon,
            'link' => request('link')
        ]);

        if (request('id')) {
            $message = 'Data Sosial Media berhasil disimpan.';
        } else {
            $message = 'Data Sosial Media berhasil ditambahakan.';
        }
        return response()->json(['status' => 'succcess', 'message' => $message]);
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
        return response()->json(['status' => 'succcess', 'message' => 'Data Sosial Media berhasil dihapus.']);
    }
}
