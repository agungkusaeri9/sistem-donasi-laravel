<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\PostCategory;
use App\Models\PostTag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use Illuminate\Support\Str;
use Yajra\DataTables\Facades\DataTables;

class PostController extends Controller
{
    public function __construct()
    {

        $this->middleware('can:Post View', ['only' => ['index']]);
        $this->middleware('can:Post Create', ['only' => ['create','store']]);
        $this->middleware('can:Post Edit', ['only' => ['edit','update ']]);
        $this->middleware('can:Post Delete', ['only' => ['destroy ']]);
        $this->middleware('can:Post Change Status', ['only' => ['changeStatus ']]);
        $this->middleware('can:Post Detail', ['only' => ['show ']]);
    }

    public function index()
    {
        return view('admin.pages.post.index',[
            'title' => 'Data Artikel'
        ]);
    }

    public function data()
    {
        if(request()->ajax())
        {
            $data = Post::with('category')->latest();
            return DataTables::eloquent($data)
                    ->addIndexColumn()
                    ->addColumn('category', function($model){
                        return $model->category->name ?? '-';
                    })
                    ->addColumn('user', function($model){
                        return $model->user->name ?? '-';
                    })
                    ->addColumn('image', function($model){
                        return '<img src='.$model->image.' class="img-fluid" style="max-height:70px"></img>';
                    })
                    ->addColumn('action',function($model){
                        $route = route('admin.posts.edit',$model->id);
                        $routeDetail = route('admin.posts.show',$model->id);

                        if(auth()->user()->getRoleNames()->first() === 'Super Admin' || auth()->user()->getPermissions('Post Detail'))
                        {
                         $detail = "<a href='$routeDetail' class='btn btn-sm btn-warning btnDetail mx-1' data-id='$model->id' data-title='$model->title'><i class='fas fa fa-eye'></i> Detail</a>";
                        }else{
                         $detail = "";
                        }

                        if(auth()->user()->getRoleNames()->first() === 'Super Admin' || auth()->user()->getPermissions('Post Edit'))
                        {
                         $edit = "<a href='$route' class='btn btn-sm btn-info btnEdit mx-1' data-id='$model->id' data-title='$model->title'><i class='fas fa fa-edit'></i> Edit</a>";
                        }else{
                         $edit = "";
                        }


                        if(auth()->user()->getRoleNames()->first() === 'Super Admin' || auth()->user()->getPermissions('Post Delete'))
                        {
                         $delete = "<button class='btn btn-sm btn-danger btnDelete mx-1' data-id='$model->id' data-title='$model->title'><i class='fas fa fa-trash'></i> Hapus</button>";
                        }else{
                         $delete = "";
                        }

                        $action = $detail . $edit . $delete;
                        return $action;
                    })
                    ->editColumn('status',function($model){
                        if(auth()->user()->getRoleNames()->first() === 'Super Admin' || auth()->user()->getpermissions('Post Change Status')){
                            if($model->status == 1)
                        {
                            $status = '<div class="custom-control custom-switch">
                                <input type="checkbox" value='.$model->status.' class="custom-control-input btnStatus" checked id='.$model->id.' data-id="'.$model->id.'">
                                <label class="custom-control-label" for='.$model->id.'></label>
                            </div>';
                        }else{
                            $status = '<div class="custom-control custom-switch">
                                    <input type="checkbox"  value='.$model->status.' class="custom-control-input btnStatus" id='.$model->id.' data-id="'.$model->id.'">
                                    <label class="custom-control-label" for='.$model->id.'></label>
                                </div>';
                        }
                        }else{
                            $status = '';
                        }

                        return $status;
                    })
                    ->addColumn('created', function($model){
                        return $model->created_at->translatedFormat('d F Y');
                    })
                    ->rawColumns(['action','image','status'])
                    ->make(true);
        }
    }

    public function create()
    {
        return view('admin.pages.post.create',[
            'title' => 'Tambah Data',
            'post_categories' => PostCategory::orderBy('name')->get(),
            'post_tags' => PostTag::orderBy('name')->get(),
        ]);
    }

    public function edit($id)
    {
        $item = Post::with('tags')->findOrFail($id);
        $item_tags = [];
        foreach($item->tags as $itag)
        {
            array_push($item_tags,$itag->id);
        }
        $post_tags = PostTag::orderBy('name')->get();
        return view('admin.pages.post.edit',[
            'title' => 'Edit Data',
            'item' =>$item,
            'post_categories' => PostCategory::orderBy('name')->get(),
            'post_tags' => $post_tags,
            'item_tags' => $item_tags
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
            'title' => ['required',Rule::unique('posts')->ignore(request('id'))],
            'post_category_id' => ['required'],
            'status' => ['required'],
            'description' => ['required'],
            'image' => ['image','mimes:jpg,png,jpeg','max:2048']
        ]);

        $data = request()->all();
        if(request()->file('image'))
        {
            $data['image'] = request()->file('image')->store('posts','public');
        }else{
            $data['image'] = NULL;
        }
        $data['slug'] = Str::slug(request('title'));
        $data['user_id'] = auth()->id();
        $post = Post::create($data);

        $post->tags()->attach(request('post_tag_id'));
        return redirect()->route('admin.posts.index')->with('success','Data Artikel berhasil ditambahkan.');
    }

    public function show($id)
    {
        $item = Post::with('category','user','tags')->findOrFail($id);
        return view('admin.pages.post.show',[
            'title' => 'Detail Artikel ' . $item->title,
            'item' => $item
        ]);
    }

    public function update($id)
    {
        $item = Post::findOrFail($id);
        request()->validate([
            'title' => ['required',Rule::unique('posts')->ignore($item->id)],
            'post_category_id' => ['required'],
            'status' => ['required'],
            'description' => ['required'],
            'image' => ['image','mimes:jpg,png,jpeg','max:2048']
        ]);

        $data = request()->all();
        if(request()->file('image'))
        {
            if($item->image)
            {
                Storage::disk('public')->delete($item->image);
            }
            $data['image'] = request()->file('image')->store('posts','public');
        }else{
            $data['image'] = $item->image;
        }
        $data['slug'] = Str::slug(request('title'));
        $item->update($data);
        $item->tags()->sync(request('post_tag_id'));
        return redirect()->route('admin.posts.index')->with('success','Data Artikel berhasil berhasil disimpan.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Post::find($id)->delete();
        return response()->json(['status'=>'succcess','message' => 'Data Artikel berhasil dihapus.']);
    }

    public function changeStatus()
    {
        $status = request('status');
        $item = Post::findOrFail(request('id'));
        if($status == 1)
        {
            $item->status = 0;
        }elseif($status == 0){
            $item->status = 1;
        }
        $item->save();

        return response()->json(['status'=>'succcess','message' => 'Status Artikel berhasil diubah.']);
    }

    public function trash()
    {
        if(request()->ajax())
        {
            $data = Post::with('category')->onlyTrashed()->latest();
            return DataTables::eloquent($data)
                    ->addIndexColumn()
                    ->addColumn('category', function($model){
                        return $model->category->name ?? '-';
                    })
                    ->addColumn('user', function($model){
                        return $model->user->name ?? '-';
                    })
                    ->addColumn('action',function($model){
                        if (auth()->user()->getRoleNames()->first() === 'Super Admin' || auth()->user()->getPermissions('Trash Restore')) {
                            $restore = "<button class='btn btn-sm btn-info btnRestore d-inline mx-1' data-id='$model->id' data-title='$model->title'><i class='fas fa fa-trash'></i> Restore</button>";
                        }else{
                            $restore = "";
                        }

                        if (auth()->user()->getRoleNames()->first() === 'Super Admin' || auth()->user()->getPermissions('Trash Delete Permanent')) {
                            $delete = "<button class='btn btn-sm btn-danger btnDelete d-inline mx-1' data-id='$model->id' data-title='$model->code'><i class='fas fa fa-trash'></i> Hapus Permanen</button>";
                        }else{
                            $delete = "";
                        }
                        $action = $restore . $delete;
                        return $action;
                    })
                    ->addColumn('created', function($model){
                        return $model->created_at->translatedFormat('d F Y');
                    })
                    ->rawColumns(['action','image'])
                    ->make(true);
        }

        return view('admin.pages.post.trash',[
            'title' => 'Keranjang Sampah Artikel'
        ]);
    }

    public function deletePermanent($id)
    {
        $item = Post::onlyTrashed()->find($id);
        if($item->image)
            Storage::disk('public')->delete($item->image);
        $item->forceDelete();
        return response()->json(['status'=>'succcess','message' => 'Artikel berhasil dihapus secara permanen.']);
    }

    public function restore($id)
    {
        $item = Post::onlyTrashed()->find($id);
        $item->restore();
        return response()->json(['status'=>'succcess','message' => 'Artikel berhasil dipulihkan dari keranjang sampah.']);
    }
}
