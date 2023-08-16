<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PostTag;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Str;

class PostTagController extends Controller
{
    public function __construct()
    {

        $this->middleware('can:Post Tag View', ['only' => ['index']]);
        $this->middleware('can:Post Tag Create', ['only' => ['store']]);
        $this->middleware('can:Post Tag Edit', ['only' => ['update ']]);
        $this->middleware('can:Post Tag Delete', ['only' => ['destroy ']]);
    }
    public function index()
    {
        return view('admin.pages.post-tag.index',[
            'title' => 'Data Tag'
        ]);
    }

    public function data()
    {
        if(request()->ajax())
        {
            $data = PostTag::query();
            return DataTables::of($data)
                    ->addIndexColumn()
                    ->addColumn('action',function($model){
                       if(auth()->user()->getRoleNames()->first() === 'Super Admin' ||auth()->user()->getPermissions('Post Tag Edit'))
                       {
                        $edit = "<button class='btn btn-sm btn-info btnEdit mx-1' data-id='$model->id' data-name='$model->name'><i class='fas fa fa-edit'></i> Edit</button>";
                       }else{
                        $edit = "";
                       }

                       if(auth()->user()->getRoleNames()->first() === 'Super Admin' ||auth()->user()->getPermissions('Post Tag Delete'))
                       {
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

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        request()->validate([
            'name' => ['required',Rule::unique('post_tags','name')->ignore(request('id'))]
        ]);

        PostTag::updateOrCreate([
            'id'  => request('id')
        ],[
            'name' => request('name'),
            'slug' => Str::slug(request('name'))
        ]);

        if(request('id'))
        {
            $message = 'Tag berhasil disimpan.';
        }else{
            $message = 'Tag berhasil ditambahakan.';
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
        PostTag::find($id)->delete();
        return response()->json(['status'=>'succcess','message' => 'Data Tag berhasil dihapus.']);
    }
}
