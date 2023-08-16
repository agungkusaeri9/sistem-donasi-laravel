@extends('admin.layouts.app')
@section('content')
    <section class="section">
        <div class="section-header">
            <h1>Data Program</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">Dashboard</a></div>
                <div class="breadcrumb-item">Data Program</div>
            </div>
        </div>
        <div class="section-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="mb-3">Filter</h6>
                            <form action="" method="post">
                                @csrf
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <select name="is_withdrawal" id="is_withdrawal" class="form-control ">
                                                <option value="" selected>Semua Penarikan Dana</option>
                                                <option value="0">Belum</option>
                                                <option value="1">Sudah</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <select name="status" id="status" class="form-control ">
                                                <option value="" selected>Semua Status</option>
                                                <option value="0">Belum Selesai</option>
                                                <option value="1">Sedang Berjalan</option>
                                                <option value="2">Selesai</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div class="float-left">
                                            <button class="btn py-2 mb-1 btn-info btnFilter" type="button"><i
                                                    class="fas fa-filter"></i> Filter</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            @can('Program Create')
                                <a href="{{ route('admin.program.create') }}" class="btn btn-sm btn-primary mb-3 btnAdd"><i
                                        class="fas fa-plus"></i> Tambah Data</a>
                            @endcan
                            <div class="table-responsive">
                                <table class="table table-striped table-hover" id="dTable">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Nama</th>
                                            <th>Donasi Terkumpul</th>
                                            <th>Donasi Target</th>
                                            <th>Penarikan Dana</th>
                                            <th>Status</th>
                                            <th>Pulikasi</th>
                                            <th style="min-width: 220px">Aksi</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/datatables-responsive/css/responsive.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/sweetalert2/sweetalert2.all.min.js') }}">
    <link rel="stylesheet" href="{{ asset('assets/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css') }}">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
@endpush
@push('scripts')
    <script src="{{ asset('assets/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/sweetalert2/sweetalert2.min.js') }}"></script>
    <script type="text/javascript">
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
    </script>
    <script>
        $(function() {
            let otable = $('#dTable').DataTable({
                processing: true,
                responsive: true,
                serverSide: true,
                ajax: {
                    url: '{{ route('admin.program.data') }}',
                    data: function(d) {
                        d.is_withdrawal = $('#is_withdrawal').val();
                        d.status = $('#status').val();
                    }
                },
                columns: [{
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'name',
                        name: 'name'
                    },
                    {
                        data: 'donation_collacted',
                        name: 'donation_collacted'
                    },
                    {
                        data: 'donation_target',
                        name: 'donation_target'
                    },
                    {
                        data: 'status_penarikan',
                        name: 'status_penarikan'
                    },
                    {
                        data: 'status',
                        name: 'status'
                    },
                    {
                        data: 'publish',
                        name: 'publish'
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false
                    }
                ]
            });
            $('.btnFilter').on('click', function() {
                otable.draw();
            });
            $('.btnAdd').on('click', function() {
                $('#myModal .modal-title').text('Tambah Data');
                $('#myModal').modal('show');
            })
            $('#myModal #myForm').on('submit', function(e) {
                e.preventDefault();
                let form = $('#myModal #myForm');
                $.ajax({
                    url: '{{ route('admin.program.store') }}',
                    type: 'POST',
                    dataType: 'JSON',
                    data: form.serialize(),
                    success: function(response) {
                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            text: response.message,
                            showConfirmButton: true,
                            timer: 1500
                        })
                        otable.ajax.reload();
                        $('#myModal').modal('hide');
                    },
                    error: function(response) {
                        Swal.fire({
                            position: 'center',
                            icon: 'error',
                            text: response.responseJSON.errors.name,
                            showConfirmButton: true,
                            timer: 1500
                        })
                    }
                })
            })

            $('body').on('click', '.btnEdit', function() {
                let id = $(this).data('id');
                let name = $(this).data('name');
                $('#myForm #id').val(id);
                $('#myForm #name').val(name);
                $('#myModal .modal-title').text('Edit Data');
                $('#myModal').modal('show');
            })
            $('body').on('click', '.btnDelete', function(e) {
                e.preventDefault();
                let id = $(this).data('id');
                let title = $(this).data('title');
                Swal.fire({
                    title: 'Apakah Yakin?',
                    text: `${title} akan dihapus dan tidak bisa dikembalikan!`,
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yakin'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ url('admin/program/') }}' + '/' + id,
                            type: 'DELETE',
                            dataType: 'JSON',
                            success: function(response) {
                                Swal.fire({
                                    position: 'center',
                                    icon: 'success',
                                    text: response.message,
                                    showConfirmButton: true,
                                    timer: 1500
                                })
                                otable.ajax.reload();
                                $('#myModal').modal('hide');

                            },
                            error: function(response) {
                                Swal.fire({
                                    position: 'center',
                                    icon: 'error',
                                    text: response.responseJSON.errors.name,
                                    showConfirmButton: true,
                                    timer: 1500
                                })
                            }
                        })
                    }
                })
            })

            $('body').on('change', '.btnIsPublished', function() {
                let id = $(this).data('id');
                let is_published = $(this).val();
                $.ajax({
                    url: '{{ route('admin.program.change-isPublished') }}',
                    type: 'POST',
                    dataType: 'JSON',
                    data: {
                        id: id,
                        is_published: is_published
                    },
                    success: function(response) {
                        Swal.fire({
                            position: 'center',
                            icon: response.status,
                            text: response.message,
                            showConfirmButton: true,
                            timer: 1500
                        })
                        otable.ajax.reload();
                    },
                    error: function(response) {
                        let errors = [];
                        $.each(response.responseJSON.errors, function(key, value) {
                            errors += `${value}<br>`;
                        });
                        Swal.fire({
                            position: 'center',
                            icon: 'error',
                            html: errors,
                            showConfirmButton: true,
                            timer: 1500
                        })
                    }
                })
            })

            $('#myModal').on('hidden.bs.modal', function() {
                let form = $('#myModal #myForm');
                form.trigger('reset');
            })
        })
    </script>
    @include('admin.layouts.partials.sweetalert')
@endpush
