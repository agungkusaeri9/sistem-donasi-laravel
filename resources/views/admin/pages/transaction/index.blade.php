@extends('admin.layouts.app')
@section('content')
    <section class="section">
        <div class="section-header">
            <h1>Data Transaksi</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">Dashboard</a></div>
                <div class="breadcrumb-item">Data Transaksi</div>
            </div>
        </div>
        <div class="section-body">
            @canany(['Transaction Filter', 'Transaction Print', 'Transaction Export'])
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
                                                <select name="program_id" id="program_id" class="form-control select2">
                                                    <option value="" selected>Pilih Program</option>
                                                    @foreach ($programs as $program)
                                                        <option value="{{ $program->id }}">{{ $program->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <select name="is_verified" id="is_verified" class="form-control ">
                                                    <option value="" selected>Pilih Status</option>
                                                    <option value="1">Terverifikasi</option>
                                                    <option value="2">Tidak Terverifikasi</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <select name="month" id="month" class="form-control ">
                                                    <option value="" selected>Pilih Bulan</option>
                                                    <option value="1">Januari</option>
                                                    <option value="2">Februari</option>
                                                    <option value="3">Maret</option>
                                                    <option value="4">April</option>
                                                    <option value="5">Mei</option>
                                                    <option value="6">Juni</option>
                                                    <option value="7">Juli</option>
                                                    <option value="8">Agustus</option>
                                                    <option value="9">September</option>
                                                    <option value="10">Oktober</option>
                                                    <option value="11">November</option>
                                                    <option value="12">Desember</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <select name="year" id="year" class="form-control ">
                                                    <option value="" selected>Pilih Tahun</option>
                                                    <option value="2022">2022</option>
                                                    <option value="2023">2023</option>
                                                    <option value="2024">2024</option>
                                                    <option value="2025">2025</option>
                                                    <option value="2026">2026</option>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md col-12">
                                            <div class="text-center">
                                                @can('Transaction Filter')
                                                    <button class="btn mb-1 btn-info btnFilter" type="button"><i
                                                            class="fas fa-filter"></i> Filter</button>
                                                @endcan
                                                @can('Transaction Print')
                                                    <button class="btn mb-1 btn-danger btnAction" type="button"
                                                        data-name="print"><i class="fas fa-file-pdf"></i>
                                                        Print</button>
                                                @endcan

                                                @can('Transaction Export')
                                                    <button class="btn mb-1 btn-primary btnAction" type="button"
                                                        data-name="export"><i class="fas fa-file-excel"></i>
                                                        Export</button>
                                                @endcan
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            @endcanany
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover" id="dTable">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>No. Invoice</th>
                                            <th>Program</th>
                                            <th>Jenis Pembayaran</th>
                                            <th>Nominal</th>
                                            <th>Verifikasi</th>
                                            <th>Waktu</th>
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
        </div>
    </section>
    <div class="modal fade" id="modalDetail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Detail Transaksi</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ul class="list-inline list-detail">

                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalEvidence" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Bukti</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <img src="" class="img-fluid imgEvidence" alt="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/datatables-responsive/css/responsive.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/sweetalert2/sweetalert2.all.min.js') }}">
    <link rel="stylesheet" href="{{ asset('assets/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/plugin/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/plugin/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
@endpush
@push('scripts')
    <script src="{{ asset('assets/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/sweetalert2/sweetalert2.min.js') }}"></script>
    <script src="{{ asset('assets/plugin/select2/js/select2.min.js') }}"></script>
    <script type="text/javascript">
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
    </script>
    <script>
        $(function() {
            $('.select2').select2({
                theme: 'bootstrap4'
            });
            let otable = $('#dTable').DataTable({
                processing: true,
                serverSide: true,
                searching: false,
                ajax: {
                    url: '{{ route('admin.transactions.data') }}',
                    data: function(d) {
                        d.program_id = $('#program_id').val();
                        d.is_verified = $('#is_verified').val();
                        d.month = $('#month').val();
                        d.year = $('#year').val();
                    }
                },
                columns: [{
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },

                    {
                        data: 'invoice',
                        name: 'invoice'
                    },
                    {
                        data: 'program_name',
                        name: 'program_name'
                    },
                    {
                        data: 'type',
                        name: 'type'
                    },
                    {
                        data: 'nominal',
                        name: 'nominal',
                        searchable: false
                    },
                    {
                        data: 'verification',
                        name: 'verification',
                        searchable: false
                    },
                    {
                        data: 'created',
                        name: 'created'
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

            $('.btnAction').on('click', function() {
                $('#formPrint').remove();
                let url = '';

                let btnName = $(this).data('name');
                let program_id = $('#program_id').val();
                let is_verified = $('#is_verified').val();
                let month = $('#month').val();
                let year = $('#year').val();
                if (btnName === 'print')
                    url = "{{ route('admin.transactions.print') }}";
                else
                    url = "{{ route('admin.transactions.export') }}";
                var form = document.createElement("form");
                form.setAttribute("method", "POST");
                form.setAttribute("action", url);
                form.setAttribute("id", "formPrint");
                var FN = document.createElement("input");
                FN.setAttribute("type", "hidden");
                FN.setAttribute("name", "program_id");
                FN.setAttribute("id", "program_id2");
                var FN2 = document.createElement("input");
                FN2.setAttribute("type", "hidden");
                FN2.setAttribute("name", "is_verified");
                FN2.setAttribute("id", "is_verified2");
                var FN3 = document.createElement("input");
                FN3.setAttribute("type", "hidden");
                FN3.setAttribute("name", "month");
                FN3.setAttribute("id", "month2");
                var FN4 = document.createElement("input");
                FN4.setAttribute("type", "hidden");
                FN4.setAttribute("name", "year");
                FN4.setAttribute("id", "year2");
                form.appendChild(FN);
                form.appendChild(FN2);
                form.appendChild(FN3);
                form.appendChild(FN4);
                document.getElementsByTagName("body")[0]
                    .appendChild(form);
                let p2 = $('#program_id2').val(program_id);
                let iv2 = $('#is_verified2').val(is_verified);
                let mnth = $('#month2').val(month);
                let yr = $('#year2').val(year);
                let token = '{{ csrf_field() }}';
                $('#formPrint').append('{{ csrf_field() }}');
                $('#formPrint').submit();
            })

            $('body').on('click', '.btnDelete', function(e) {
                e.preventDefault();
                let id = $(this).data('id');
                let title = $(this).data('title');
                Swal.fire({
                    title: 'Apakah Yakin?',
                    text: `Transaksi akan dihapus dan tidak bisa dikembalikan!`,
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yakin'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ url('admin/transactions/') }}' + '/' + id,
                            type: 'DELETE',
                            dataType: 'JSON',
                            success: function(response) {
                                Swal.fire({
                                    position: 'center',
                                    icon: response.status,
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

            $('body').on('click', '.btnDetail', function() {
                let id = $(this).data('id');
                $.ajax({
                    url: '{{ route('admin.transactions.getById') }}',
                    type: 'POST',
                    data: {
                        id: id
                    },
                    dataType: 'JSON',
                    success: function(res) {
                        $('#modalDetail .list-detail').html('');
                        let payment_name, payment_number, payment_description, program_name;
                        payment_name = res.payment != null ? res.payment.name : '-';
                        payment_number = res.payment != null ? res.payment.number : '-';
                        payment_description = res.payment != null ? res.payment.description :
                            '-';
                        program_name = res.program != null ? res.program.name : '-';
                        let status = res.is_verified == 0 ?
                            `<span class="badge badge-danger">Tidak Terverifikasi</span>` :
                            `<span class="badge badge-success">Terverifikasi</span>`;
                        let evidence = res.evidence === null ?
                            `<span class="badge badge-danger">Tidak Ada</span>` :
                            `<button  class="badge badge-warning btnEvidence" data-evidence="${res.evidence}">Lihat</button>`;
                        let anonim = res.is_anonim == 1 ? 'Ya' : 'Tidak';
                        let xhtml = `<li class="list-inline-item d-flex justify-content-between">
                                    <span>Nomor Invoice</span>
                                    <span>#${res.code}</span>
                                </li>
                                <hr style="margin: 10px 0">
                                <li class="list-inline-item d-flex justify-content-between">
                                    <span>Nama Program</span>
                                    <span>${program_name}</span>
                                </li>
                                <hr style="margin: 10px 0">
                                <li class="list-inline-item d-flex justify-content-between">
                                    <span>Nama Donatur</span>
                                    <span>${res.name}</span>
                                </li>
                                <hr style="margin: 10px 0">
                                <li class="list-inline-item d-flex justify-content-between">
                                    <span>Email</span>
                                    <span>${res.email ?? '-'}</span>
                                </li>
                                <hr style="margin: 10px 0">
                                <li class="list-inline-item d-flex justify-content-between">
                                    <span>No. Telepon</span>
                                    <span>${res.phone_number}</span>
                                </li>
                                <hr style="margin: 10px 0">
                                <li class="list-inline-item d-flex justify-content-between">
                                    <span>Nominal</span>
                                    <span>Rp. ${res.nominal}</span>
                                </li>
                                <hr style="margin: 10px 0">
                                <li class="list-inline-item d-flex justify-content-between">
                                    <span>Ucapan</span>
                                    <span>${res.acceptance}</span>
                                </li>
                                <hr style="margin: 10px 0">
                                <li class="list-inline-item d-flex justify-content-between">
                                    <span>Metode Pembayaran</span>
                                    <span>
                                        <span>${payment_name}</span><br>
                                        <span>${payment_number}</span><br>
                                        <span>a.n ${payment_description}</span>
                                    </span>
                                </li>
                                <hr style="margin: 10px 0">
                                <li class="list-inline-item d-flex justify-content-between">
                                    <span>Status</span>
                                    ${status}
                                </li>
                                <hr style="margin: 10px 0">
                                <li class="list-inline-item d-flex justify-content-between">
                                    <span>Identitas Ditampilkan</span>
                                    <span>
                                        ${anonim}
                                    </span>
                                </li>
                                <hr style="margin: 10px 0">
                                <li class="list-inline-item d-flex justify-content-between">
                                    <span>Waktu</span>
                                    <span>
                                    ${res.created}
                                    </span>
                                </li>
                                <hr style="margin: 10px 0">`;
                        $('#modalDetail .list-detail').html(xhtml);
                    },
                    error: function(error) {
                        console.log(error);
                    }
                })
                $('#modalDetail').modal('show');
            })

            $('body').on('click', '.btnEvidence', function() {
                let evidence = $(this).data('evidence');
                $('#modalEvidence .imgEvidence ').attr('src', evidence);
                $('#modalEvidence').modal('show');
            })

            $('body').on('change', '.btnStatus', function() {
                let id = $(this).data('id');
                let status = $(this).val();
                $.ajax({
                    url: '{{ route('admin.transactions.change-status') }}',
                    type: 'POST',
                    dataType: 'JSON',
                    data: {
                        id: id,
                        status: status
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
            $('body').on('click', '.btnDisabled', function() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    text: 'Pembayaran secara otomatis tidak bisa di edit.',
                    showConfirmButton: true,
                    timer: 1500
                })
            })
        })
    </script>
    @include('admin.layouts.partials.sweetalert')
@endpush
