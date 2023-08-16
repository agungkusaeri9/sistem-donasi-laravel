<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ProgramCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

class ProgramCategoryController extends Controller
{
    public function __construct()
    {

        $this->middleware('can:Program Category View', ['only' => ['index']]);
        $this->middleware('can:Program Category Create', ['only' => ['store']]);
        $this->middleware('can:Program Category Edit', ['only' => ['update ']]);
        $this->middleware('can:Program Category Delete', ['only' => ['destroy ']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.pages.program-category.index',[
            'title' => 'Data Kategori Program'
        ]);
    }

    public function data()
    {
        if(request()->ajax())
        {
            $data = ProgramCategory::query();
            return DataTables::of($data)
                    ->addIndexColumn()
                    ->addColumn('action',function($model){
                        if(auth()->user()->getRoleNames()->first() === 'Super Admin' ||auth()->user()->getPermissions('Program Category Edit')){
                            $edit = "<button class='btn btn-sm btn-info btnEdit mx-1' data-id='$model->id' data-name='$model->name'><i class='fas fa fa-edit'></i> Edit</button>";
                        }else{
                            $edit = "";
                        }
                        if(auth()->user()->getRoleNames()->first() === 'Super Admin' ||auth()->user()->getPermissions('Program Category Delete')){
                            $delete = "<button class='btn btn-sm btn-danger btnDelete mx-1' data-id='$model->id' data-name='$model->name'><i class='fas fa fa-trash'></i> Hapus</button>";
                        }else{
                            $delete = "";
                        }
                        $action = $edit . $delete;
                        return $action;
                    })
                    ->rawColumns(['action'])
                    ->make(true);
        }
    }

    public function store(Request $request)
    {
        request()->validate([
            'name' => ['required',Rule::unique('program_categories')->ignore(request('id'))]
        ]);

        ProgramCategory::updateOrCreate([
            'id'  => request('id')
        ],[
            'name' => request('name'),
            'slug' => Str::slug(request('name'))
        ]);

        if(request('id'))
        {
            $message = 'Kategori berhasil disimpan.';
        }else{
            $message = 'Kategori berhasil ditambahakan.';
        }
        return response()->json(['status'=>'succcess','message' => $message]);
    }

    public function destroy($id)
    {
        ProgramCategory::find($id)->delete();
        return response()->json(['status'=>'succcess','message' => 'Data kategori berhasil dihapus.']);
    }
}
