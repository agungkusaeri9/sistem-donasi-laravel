<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PostCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

class PostCategoryController extends Controller
{
    public function __construct()
    {

        $this->middleware('can:Post Category View', ['only' => ['index']]);
        $this->middleware('can:Post Category Create', ['only' => ['store']]);
        $this->middleware('can:Post Category Edit', ['only' => ['update ']]);
        $this->middleware('can:Post Category Delete', ['only' => ['destroy ']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.pages.post-category.index',[
            'title' => 'Data Kategori Artikel'
        ]);
    }

    public function data()
    {
        if(request()->ajax())
        {
            $data = PostCategory::query();
            return DataTables::of($data)
                    ->addIndexColumn()
                    ->addColumn('action',function($model){
                       if(auth()->user()->getRoleNames()->first() === 'Super Admin' ||auth()->user()->getPermissions('Post Category Edit')){
                        $act_edit = "<button class='btn btn-sm btn-info btnEdit mx-1' data-id='$model->id' data-name='$model->name'><i class='fas fa fa-edit'></i> Edit</button>";
                       }else{
                        $act_edit = "";
                       }

                        if(auth()->user()->getRoleNames()->first() === 'Super Admin' ||auth()->user()->getPermissions('Post Category Delete'))
                        {
                            $act_delete = "<button class='btn btn-sm btn-danger btnDelete mx-1' data-id='$model->id' data-name='$model->name'><i class='fas fa fa-trash'></i> Hapus</button>";
                        }else{
                            $act_delete = "";
                        }
                        return $act_edit . $act_delete;
                    })
                    ->rawColumns(['action'])
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
            'name' => ['required',Rule::unique('post_categories')->ignore(request('id'))]
        ]);

        PostCategory::updateOrCreate([
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

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        PostCategory::find($id)->delete();
        return response()->json(['status'=>'succcess','message' => 'Data kategori berhasil dihapus.']);
    }
}
