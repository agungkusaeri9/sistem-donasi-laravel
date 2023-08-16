@extends('admin.layouts.app')
@section('content')
    <section class="section">
        <div class="section-header">
            <h1>Edit Slider</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">Dashboard</a></div>
                <div class="breadcrumb-item active"><a href="{{ route('admin.posts.index') }}">Data Slider</a></div>
                <div class="breadcrumb-item">Edit Slider</div>
            </div>
        </div>
        <div class="section-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="{{ route('admin.sliders.update',$item->id) }}" method="post" enctype="multipart/form-data">
                                @csrf
                                @method('patch')
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="title">Judul</label>
                                            <input type="text" class="form-control @error('title') is-invalid @enderror"
                                                name="title" value="{{ $item->title ?? old('title') }}" id="title">
                                            @error('title')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label for="program_id">Kategori</label>
                                            <select name="program_id" id="program_id"
                                                class="form-control @error('program_id') is-invalid @enderror">
                                                <option value="" selected disabled>Pilih Kategori</option>
                                                @foreach ($program as $category)
                                                    <option @if($category->id == $item->program_id) selected @endif value="{{ $category->id }}">{{ $category->name }}</option>
                                                @endforeach
                                            </select>
                                            @error('program_id')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label for="is_active">Status</label>
                                            <select name="is_active" id="is_active" class="form-control @error('is_active') is-invalid @enderror">
                                                <option value="" selected disabled>Pilih Status</option>
                                                <option @if ($item->is_active === 1) selected @endif value="1">
                                                    Aktif</option>
                                                <option @if ($item->is_active ==0 ) selected @endif value="0">
                                                    Tidak Aktif
                                                </option>
                                            </select>
                                            @error('is_active')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-2">
                                                <label for="image">Gambar</label>
                                                <b></b>
                                                <img src="{{ $item->image() }}" class="img-fluid" style="max-height: 60px" alt="">
                                            </div>
                                            <div class="col-md-10 align-self-center">
                                                <input type="file" name="image" class="form-control @error('image') is-invalid @enderror">
                                            @error('image')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-block btn-primary"><i class="fas fa-save"></i> Simpan</button>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="description">Deskripsi</label>
                                            <textarea name="description" id="description"
                                                class="form-control @error('description') is-invalid @enderror" cols="30" rows="5">{{ $item->description ?? old('description')}}</textarea>
                                            @error('description')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@push('styles')
<link rel="stylesheet" href="{{ asset('assets/plugin/select2/css/select2.min.css') }}">
<link rel="stylesheet" href="{{ asset('assets/plugin/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
@endpush
@push('scripts')
<script src="{{ asset('assets/plugin/ckeditor/ckeditor.js') }}"></script>
<script src="{{ asset('assets/plugin/select2/js/select2.min.js') }}"></script>
<script>
    $(function(){
        $('#post_tag_id').select2({
                    theme: 'bootstrap4'
                });
        var options = {
    filebrowserImageBrowseUrl: '/filemanager',
    filebrowserImageUploadUrl: '/filemanager/upload?type=Images&_token=',
    filebrowserBrowseUrl: '/filemanager?type=Files',
    filebrowserUploadUrl: '/filemanager/upload?type=Files&_token='
  };
        CKEDITOR.replace( 'description',options);
    })
</script>
@endpush
