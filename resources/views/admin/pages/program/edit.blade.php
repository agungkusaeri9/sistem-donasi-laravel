@extends('admin.layouts.app')
@section('content')
    <section class="section">
        <div class="section-header">
            <h1>Edit Program</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">Dashboard</a></div>
                <div class="breadcrumb-item active"><a href="{{ route('admin.program.index') }}">Data Program</a></div>
                <div class="breadcrumb-item">Edit Program</div>
            </div>
        </div>
        <div class="section-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="{{ route('admin.program.update', $item->id) }}" method="post"
                                enctype="multipart/form-data">
                                @csrf
                                @method('patch')
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="name">Nama</label>
                                            <input type="text" class="form-control @error('name') is-invalid @enderror"
                                                name="name" value="{{ $item->name ?? old('name') }}" id="name">
                                            @error('name')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label for="program_category_id">Kategori</label>
                                            <select name="program_category_id" id="program_category_id"
                                                class="form-control @error('program_category_id') is-invalid @enderror">
                                                <option value="" selected disabled>Pilih Kategori</option>
                                                @foreach ($program_categories as $category)
                                                    <option @if ($category->id == $item->program_category_id) selected @endif
                                                        value="{{ $category->id }}">{{ $category->name }}</option>
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
                                                name="meta_keyword" value="{{ $item->meta_keyword ?? old('meta_keyword') }}"
                                                id="meta_keyword">
                                            @error('meta_keyword')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label for="meta_description">Meta Deskripsi</label>
                                            <textarea name="meta_description" id="meta_description"
                                                class="form-control @error('meta_description') is-invalid @enderror" cols="30" rows="5">{{ $item->meta_description ?? old('meta_description') }}</textarea>
                                            @error('meta_description')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label for="location">Lokasi</label>
                                            <input type="text"
                                                class="form-control @error('location') is-invalid @enderror" name="location"
                                                value="{{ $item->location ?? old('location') }}" id="location">
                                            @error('location')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label for="time_up">Masa Berlaku</label>
                                            <input type="date"
                                                class="form-control @error('time_up') is-invalid @enderror" name="time_up"
                                                @if ($item->time_up) value="{{ $item->time_up->translatedFormat('Y-m-d') ?? old('time_up') }}" @else value="{{ old('time_up') }}" @endif
                                                id="time_up">
                                            @error('time_up')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label for="status">Status</label>
                                            <select name="status" id="status"
                                                class="form-control  @error('status') is-invalid @enderror"
                                                @readonly($item->status == 2)>
                                                @if ($item->status != 2)
                                                    <option value="" selected disabled>Pilih Status</option>
                                                    <option @if ($item->status == 1) selected @endif
                                                        value="1">
                                                        Sedang Berjalan</option>
                                                    <option @if ($item->status == 0) selected @endif
                                                        value="0">
                                                        Belum Selesai
                                                    </option>
                                                    <option @if ($item->status == 2) selected @endif
                                                        value="2">Selesai</option>
                                                @else
                                                    <option value="2">Selesai</option>
                                                @endif
                                            </select>
                                            @error('status')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-2">
                                                <label for="image">Gambar</label>
                                                <b></b>
                                                <img src="{{ $item->image() }}" class="img-fluid" style="max-height: 60px"
                                                    alt="">
                                            </div>
                                            <div class="col-md-10 align-self-center">
                                                <input type="file" name="image"
                                                    class="form-control @error('image') is-invalid @enderror">
                                                @error('image')
                                                    <div class="invalid-feedback">
                                                        {{ $message }}
                                                    </div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-block btn-primary"><i class="fas fa-save"></i>
                                                Simpan</button>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="description">Deskripsi</label>
                                            <textarea name="description" id="description" class="form-control @error('description') is-invalid @enderror"
                                                cols="30" rows="5">{{ $item->description ?? old('description') }}</textarea>
                                            @error('description')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <h5>Rincian Anggaran Donasi</h5>
                                        <div class="dbudget">

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
                                                <div class="col-md-4 align-self-end">
                                                    <a href="javascript:void(0)" class="btn btn-lg btn-danger remove"><i
                                                            class="fas fa-minus"></i></a>
                                                </div>
                                            </span>
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
        $(function() {
            $('#post_tag_id').select2({
                theme: 'bootstrap4'
            });
            var options = {
                filebrowserImageBrowseUrl: '/filemanager',
                filebrowserImageUploadUrl: '/filemanager/upload?type=Images&_token=',
                filebrowserBrowseUrl: '/filemanager?type=Files',
                filebrowserUploadUrl: '/filemanager/upload?type=Files&_token='
            };
            CKEDITOR.replace('description', options);

            let program_id = '{{ $item->id }}';
            $.ajax({
                url: '{{ route('admin.program.budgets') }}',
                type: 'POST',
                dataType: 'JSON',
                data: {
                    program_id: program_id,
                    '_token': '{{ csrf_token() }}'
                },
                success: function(res) {
                    let i = 0;
                    console.log(res);
                    if (res.length > 0) {
                        res.forEach(dt => {
                            let y = i++;
                            let ahr;
                            let readonly;
                            if (y == 0) {
                                ahr = `<a href="javascript:void(0)" class="btn btn-lg btn-success addMore"><i
                                            class="fas fa-plus"></i></a>`;
                            } else {
                                if (dt.name === 'Biaya Admin') {
                                    ahr = `<a href="javascript:void(0)" class="btn btn-lg btn-danger" disabled><i
                                            class="fas fa-minus"></i></a>`;
                                    readonly = "readonly";
                                } else {
                                    ahr = `<a href="javascript:void(0)" class="btn btn-lg btn-danger remove"><i
                                            class="fas fa-minus"></i></a>`;
                                    readonly = "";
                                }
                            }
                            let xhtml = `
                        <div class="form-group fieldGroup">
                            <span class="input-group pl-0 ml-0">
                                <div class="col-md-4">
                                    <label for="name">Nama Anggaran</label>
                                    <input type="text" class="form-control" name="budget_name[]"
                                        id="budget_name" value="${dt.name}" ${readonly} required>
                                </div>
                                <div class="col-md-4">
                                    <label for="nominal">Nominal</label>
                                    <input type="number" class="form-control" name="budget_nominal[]"
                                        id="budget_nominal" value="${dt.nominal}" ${readonly} required>
                                </div>
                                <div class="col-md-4 align-self-end">
                                    ${ahr}
                                </div>
                            </span>
                        </div>
                        `;
                            $('.dbudget').append(xhtml);
                        });
                    } else {
                        let xhtml = `
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
                                            `;
                        $('.dbudget').append(xhtml);
                    }
                },
                error: function(err) {
                    console.log(err);
                }
            })
            let maxGroup = 20;

            //melakukan proses multiple input
            $("body").on('click', '.addMore', function() {
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

        })
    </script>
@endpush
