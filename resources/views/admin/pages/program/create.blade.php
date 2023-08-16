@extends('admin.layouts.app')
@section('content')
    <section class="section">
        <div class="section-header">
            <h1>Tambah Program</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">Dashboard</a></div>
                <div class="breadcrumb-item active"><a href="{{ route('admin.program.index') }}">Data Program</a></div>
                <div class="breadcrumb-item">Tambah Program</div>
            </div>
        </div>
        <div class="section-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="{{ route('admin.program.store') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="name">Nama</label>
                                            <input type="text" class="form-control @error('name') is-invalid @enderror"
                                                name="name" value="{{ old('name') }}" id="name">
                                            @error('name')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label for="program_category_id">Kategori</label>
                                            <select name="program_category_id" id="program_category_id"
                                                class="form-control select2 @error('program_category_id') is-invalid @enderror">
                                                <option value="" selected disabled>Pilih Kategori</option>
                                                @foreach ($post_categories as $category)
                                                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                                                @endforeach
                                            </select>
                                            @error('program_category_id')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label for="meta_keyword">Meta Kata Kunci</label>
                                            <input type="text"
                                                class="form-control @error('meta_keyword') is-invalid @enderror"
                                                name="meta_keyword" value="{{ old('meta_keyword') }}" id="meta_keyword">
                                            @error('meta_keyword')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label for="meta_description">Meta Deskripsi</label>
                                            <textarea name="meta_description" id="meta_description"
                                                class="form-control @error('meta_description') is-invalid @enderror" cols="30" rows="5"
                                                style="min-height: 120px"></textarea>
                                            @error('meta_description')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>

                                        <div class="form-group">
                                            <label for="time_up">Lokasi</label>
                                            <textarea name="time_up" id="time_up" class="form-control @error('time_up') is-invalid @enderror" cols="30"
                                                rows="5" style="min-height: 120px"></textarea>
                                            @error('time_up')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label for="time_up">Masa Berlaku</label>
                                            <input type="date"
                                                class="form-control @error('time_up') is-invalid @enderror"
                                                name="time_up" value="{{ old('time_up') }}" id="time_up">
                                            @error('time_up')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label for="status">Status</label>
                                            <select name="status" id="status"
                                                class="form-control @error('status') is-invalid @enderror">
                                                <option value="" selected disabled>Pilih Status</option>
                                                <option @if (old('status') == 1) selected @endif value="1">
                                                    Aktif</option>
                                                <option @if (old('status') === '0') selected @endif value="0">
                                                    Tidak Aktif
                                                </option>
                                            </select>
                                            @error('status')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label for="image">Gambar</label>
                                            <input type="file" name="image"
                                                class="form-control @error('image') is-invalid @enderror" multiple>
                                            @error('image')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-block btn-primary"><i class="fas fa-plus"></i>
                                                Tambah</button>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="description">Deskripsi</label>
                                            <textarea name="description" id="description" class="form-control @error('description') is-invalid @enderror"
                                                cols="30" rows="5"></textarea>
                                            @error('description')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <h5>Tambah Rincian Anggaran Donasi</h5>
                                        <div class="form-group fieldGroup">
                                            <span class="input-group pl-0 ml-0">
                                                <div class="col-md-4">
                                                    <label for="name">Nama Anggaran</label>
                                                    <input type="text" class="form-control" name="budget_name[]"
                                                        id="budget_name" required>
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="nominal">Nominal</label>
                                                    <input type="number" class="form-control" name="budget_nominal[]"
                                                        id="budget_nominal" required>
                                                </div>
                                                <div class="col-md-3 align-self-end">
                                                    <a href="javascript:void(0)" class="btn btn-lg btn-success addMore"><i
                                                            class="fas fa-plus"></i></a>
                                                </div>
                                            </span>
                                        </div>
                                        <div class="form-group fieldGroupCopy" style="display: none;">
                                            <span class="input-group pl-0 ml-0">
                                                <div class="col-md-4">
                                                    <label for="name">Nama Anggaran</label>
                                                    <input type="text" class="form-control" name="budget_name[]"
                                                        id="budget_name">
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="nominal">Nominal</label>
                                                    <input type="number" class="form-control" name="budget_nominal[]"
                                                        id="budget_nominal">
                                                </div>
                                                <div class="col-md-3
                                                        align-self-end">
                                                    <a href="javascript:void(0)" class="btn btn-lg btn-danger remove"><i
                                                            class="fas fa-minus"></i></a>
                                                </div>
                                            </span>
                                        </div>
                                        @error('budget_name.*')
                                                <div class="text-danger small">
                                                    {{ $message }}
                                                </div>
                                        @enderror
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
    <script type="text/javascript">
        $(document).ready(function() {
            var maxGroup = 20;

            //melakukan proses multiple input
            $(".addMore").click(function() {
                if ($('body').find('.fieldGroup').length < maxGroup) {
                    var fieldHTML = '<div class="form-group fieldGroup">' + $(".fieldGroupCopy").html() +
                        '</div>';
                    $('body').find('.fieldGroup:last').after(fieldHTML);
                } else {
                    alert('Maximum ' + maxGroup + ' groups are allowed.');
                }
            });

            //remove fields group
            $("body").on("click", ".remove", function() {
                $(this).parents(".fieldGroup").remove();
            });
        });
    </script>
    <script>
        $(function() {
            $('.select2').select2({
                theme: 'bootstrap4'
            });
            var options = {
                filebrowserImageBrowseUrl: '/filemanager',
                filebrowserImageUploadUrl: '/filemanager/upload?type=Images&_token=',
                filebrowserBrowseUrl: '/filemanager?type=Files',
                filebrowserUploadUrl: '/filemanager/upload?type=Files&_token='
            };
            CKEDITOR.replace('description', options);
        })
    </script>
@endpush
