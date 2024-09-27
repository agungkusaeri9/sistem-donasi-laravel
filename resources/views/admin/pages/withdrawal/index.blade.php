@extends('admin.layouts.app')
@section('content')
    <section class="section">
        <div class="section-header">
            <h1>Data Penarikan Dana</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">Dashboard</a></div>
                <div class="breadcrumb-item">Data Penarikan Dana</div>
            </div>
        </div>
        <div class="section-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            @can('Withdrawal Create')
                                <a href="{{ route('admin.withdrawals.create') }}" class="btn btn-sm btn-primary mb-3 btnAdd"><i
                                        class="fas fa-plus"></i> Tambah Data</a>
                            @endcan
                            <div class="table-responsive">
                                <table class="table table-striped table-hover" id="dTable">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Tanggal Penarikan</th>
                                            <th>Nama Program</th>
                                            <th>Nominal Biaya Manual</th>
                                            <th>Nominal Biaya Otomatis (Midtrans)</th>
                                            <th>Total Nominal</th>
                                            <th>Biaya Admin</th>
                                            <th>Nominal Dicairkan</th>
                                            <th>Bank Tujuan</th>
                                            <th>Bukti Pembayaran</th>
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

    <!-- Modal -->
    <div class="modal fade" id="modalBukti" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Bukti Transfer</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <img src="" class="img-fluid imgModalBukti" alt="">
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
    <script src="{{ asset('assets/plugin/select2/js/select2.full.min.js') }}"></script>
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
                serverSide: true,
                ajax: '{{ route('admin.withdrawals.data') }}',
                columns: [{
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'created',
                        name: 'created'
                    },
                    {
                        data: 'program_name',
                        name: 'program_name'
                    },
                    {
                        data: 'manual_payment_amount',
                        name: 'manual_payment_amount'
                    },
                    {
                        data: 'automatic_payment_amount',
                        name: 'automatic_payment_amount'
                    },
                    {
                        data: 'amount_total',
                        name: 'amount_total'
                    },
                    {
                        data: 'admin_fee',
                        name: 'admin_fee'
                    },
                    {
                        data: 'dicairkan',
                        name: 'dicairkan'
                    },
                    {
                        data: 'bank_tujuan',
                        name: 'bank_tujuan'
                    },
                    {
                        data: 'proof',
                        name: 'proof'
                    }
                ]
            });

            $('body').on('click', '.btnBukti', function() {
                let url = $(this).data('url');
                $('.imgModalBukti').attr('src', url);
                $('#modalBukti').modal('show');
            })

        })
    </script>
    @include('admin.layouts.partials.sweetalert')
@endpush
