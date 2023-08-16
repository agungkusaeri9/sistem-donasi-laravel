@extends('frontend.layouts.app')
@section('content')
    <div class="services-area">
        <div class="container">

            <!-- Section-tittle -->
            <div class="row d-flex justify-content-center">
                <div class="col-lg-8">
                    <div class="section-tittle text-center mb-80">
                        <h2>Riwayat Donasi</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            @include('frontend.layouts.partials.sidebar')
            <div class="col-md-9">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped dTable nowrap">
                                <thead>
                                    <tr>
                                        <td>#</td>
                                        <td>No. Invoice</td>
                                        <td>Program</td>
                                        <td>Pembayaran</td>
                                        <td>Nominal</td>
                                        <td>Status</td>
                                        <td>Tanggal</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($items as $item)
                                        <tr>
                                            <td class="">{{ $loop->iteration }}</td>
                                            <td class="">#{{ $item->code }}</td>
                                            <td class="">{{ $item->program->name ?? '-' }}</td>
                                            <td>
                                                @if ($item->type === 'otomatis')
                                                    <a href="{{ route('success', encrypt($item->code)) }}"
                                                        class="btn-sm btn-link">Lihat Detail</a>
                                                @else
                                                    {{ $item->payment->name . ' - ' . $item->payment->number }}
                                                @endif
                                            </td>
                                            <td class="">Rp. {{ number_format($item->nominal) }}</td>
                                            <td class="fs-7 text-center">
                                                @if ($item->is_verified == 1)
                                                    <span class="badge bg-success">Terverivikasi</span>
                                                @else
                                                    <span class="badge bg-danger">Tidak Terverivikasi</span>
                                                @endif
                                            </td>
                                            <td>
                                                {{ $item->created_at->translatedFormat('d-m-Y') }}
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
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
    <style>
        table td {
            font-size: 14px;
        }
    </style>
@endpush
@push('scripts')
    <script src="{{ asset('assets/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/sweetalert2/sweetalert2.min.js') }}"></script>
    <script>
        $('.dTable').DataTable();
    </script>
    @include('admin.layouts.partials.sweetalert')
@endpush
