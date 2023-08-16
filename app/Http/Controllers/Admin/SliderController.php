<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Program;
use App\Models\Slider;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use Illuminate\Support\Str;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Http\Request;

class SliderController extends Controller
{
    public function __construct()
    {

        $this->middleware('can:Slider View', ['only' => ['index']]);
        $this->middleware('can:Slider Create', ['only' => ['store']]);
        $this->middleware('can:Slider Edit', ['only' => ['update ']]);
        $this->middleware('can:Slider Delete', ['only' => ['destroy ']]);
        $this->middleware('can:Slider Detail', ['only' => ['show ']]);
    }

    public function index()
    {
        return view('admin.pages.sliders.index',[
            'title' => 'Data Slider'
        ]);
    }

    public function data()
    {
        if(request()->ajax())
        {
            $data = Slider::with('program')->latest();
            return DataTables::eloquent($data)
                    ->addIndexColumn()
                    ->addColumn('program', function($model){
                        return $model->program->name ?? '-';
                    })
                    ->addColumn('image', function($model){
                        return '<img src='.$model->image().' class="img-fluid" style="max-height:70px"></img>';
                    })
                    ->addColumn('action',function($model){
                        $route = route('admin.sliders.edit',$model->id);
                        $routeDetail = route('admin.sliders.show',$model->id);

                        if(auth()->user()->getRoleNames()->first() === 'Super Admin' ||auth()->user()->getPermissions('Slider Detail')){
                            $detail = "<a href='$routeDetail' class='btn btn-sm btn-warning btnDetail mx-1' data-id='$model->id' data-title='$model->title'><i class='fas fa fa-eye'></i> Detail</a>";
                        }else{
                            $detail = "";
                        }


                        if(auth()->user()->getRoleNames()->first() === 'Super Admin' ||auth()->user()->getPermissions('Slider Edit')){
                            $edit = "<a href='$route' class='btn btn-sm btn-info btnEdit mx-1' data-id='$model->id' data-title='$model->title'><i class='fas fa fa-edit'></i> Edit</a>";
                        }else{
                            $edit = "";
                        }

                        if(auth()->user()->getRoleNames()->first() === 'Super Admin' ||auth()->user()->getPermissions('Slider Delete')){
                            $delete = "<button class='btn btn-sm btn-danger btnDelete mx-1' data-id='$model->id' data-title='$model->title'><i class='fas fa fa-trash'></i> Hapus</button>";
                        }else{
                            $delete = "";
                        }

                        $action = $detail . $edit . $delete;
                        return $action;
                    })
                    ->editColumn('status',function($model){
                        if($model->is_active == 1)
                        {
                            $status = '<div class="custom-control custom-switch">
                                <input type="checkbox" value='.$model->is_active.' class="custom-control-input btnStatus" checked id='.$model->id.' data-id="'.$model->id.'">
                                <label class="custom-control-label" for='.$model->id.'></label>
                            </div>';
                        }else{
                            $status = '<div class="custom-control custom-switch">
                                    <input type="checkbox"  value='.$model->is_active.' class="custom-control-input btnStatus" id='.$model->id.' data-id="'.$model->id.'">
                                    <label class="custom-control-label" for='.$model->id.'></label>
                                </div>';
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

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.pages.sliders.create',[
            'title' => 'Tambah Data',
            'program' => Program::orderBy('name')->get()
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
            'title' => ['required'],
            'program_id' => ['required'],
            'description' => ['required'],
            'image' => ['image','mimes:jpg,png,jpeg','max:2048']
        ]);

        $data = request()->all();
        if(request()->file('image'))
        {
            $data['image'] = request()->file('image')->store('sliders','public');
        }else{
            $data['image'] = NULL;
        }
        Slider::create($data);

        return redirect()->route('admin.sliders.index')->with('success','Data Slider berhasil ditambahkan.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $item = Slider::with('program')->findOrFail($id);
        return view('admin.pages.sliders.show',[
            'title' => 'Detail Slider ' . $item->name,
            'item' => $item
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $item = Slider::with('program')->findOrFail($id);
        return view('admin.pages.sliders.edit',[
            'title' => 'Edit Data',
            'item' =>$item,
            'program' => Program::orderBy('name')->get()
        ]);
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
        $item = Slider::findOrFail($id);
        request()->validate([
            'title' => ['required'],
            'program_id' => ['required'],
            'is_active' => ['required'],
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
            $data['image'] = request()->file('image')->store('sliders','public');
        }else{
            $data['image'] = $item->image;
        }
        $item->update($data);
        return redirect()->route('admin.sliders.index')->with('success','Data Slider berhasil berhasil disimpan.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $item = Slider::find($id);
        Storage::disk('public')->delete($item->image);
        $item->delete();
        return response()->json(['status'=>'succcess','message' => 'Data Slider berhasil dihapus.']);
    }

    public function changeStatus()
    {
        $status = request('status');
        $item = Slider::findOrFail(request('id'));
        if($status == 1)
        {
            $item->is_active = 0;
        }elseif($status == 0){
            $item->is_active = 1;
        }
        $item->save();

        return response()->json(['status'=>'succcess','message' => 'Status berhasil diubah.']);
    }
}
