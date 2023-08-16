@extends('admin.layouts.app')
@section('content')
    <section class="section">
        <div class="section-header">
            <h1>Dashboard</h1>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                    <div class="card-icon bg-warning">
                        <i class="far fa-file"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>Transaksi</h4>
                        </div>
                        <div class="card-body">
                            {{ $count['transactions'] }}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                    <div class="card-icon bg-primary">
                        <i class="far fa-user"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>Total User</h4>
                        </div>
                        <div class="card-body">
                            {{ $count['users'] }}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                    <div class="card-icon bg-danger">
                        <i class="far fa-newspaper"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>Kategori Artikel</h4>
                        </div>
                        <div class="card-body">
                            {{ $count['post_categories'] }}
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                    <div class="card-icon bg-success">
                        <i class="far fa-newspaper"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>Artikel</h4>
                        </div>
                        <div class="card-body">
                            {{ $count['posts'] }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-8 col-lg-8">
                <div class="card">
                    <div class="card-header">
                        <h4>Laporan Transaksi Tahun {{ Carbon\Carbon::now()->format('Y') }}</h4>
                    </div>
                    <div class="card-body">
                        <canvas id="myChart"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-4 col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h4>Laporan Jumlah Program Berdasarkan Kategori</h4>
                    </div>
                    <div class="card-body">
                        <canvas id="myPie" style="w-100"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Transaksi Terakhir</h4>
                        <div class="card-header-action">
                            <a href="{{ route('admin.transactions.index') }}" class="btn btn-primary">View All</a>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <div class="table-responsive">
                                <table class="table table-striped mb-0">
                                    <thead>
                                        <tr>
                                            <th>No. Invoice</th>
                                            <th>Program</th>
                                            <th>Nama Donatur</th>
                                            <th>Nominal</th>
                                            <th>Tanggal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($transactions as $transaction)
                                            <tr>
                                                <td>
                                                    #{{ $transaction->code }}
                                                </td>
                                                <td>
                                                    {{ $transaction->program->name ?? '-' }}
                                                </td>
                                                <td>
                                                    {{ $transaction->name }}
                                                </td>
                                                <td>Rp. {{ number_format($transaction->nominal, 0, '', '.') }}
                                                </td>
                                                <td>
                                                    {{ $transaction->created_at->translatedFormat('H:i:s d M Y') }}
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

    </section>
@endsection
@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/chart.js/Chart.min.css') }}">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
@endpush
@push('scripts')
    <script src="{{ asset('assets/chart.js/Chart.min.js') }}"></script>
    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        let ajaxTransaction = function() {
            let dataTransaction;
            $.ajax({
                url: '{{ route('admin.ajaxTransaction') }}',
                type: 'POST',
                async: false,
                dateType: 'JSON',
                success: function(response) {
                    dataTransaction = response;
                },
                error: function(error) {
                    console.log(error);
                }
            })

            return dataTransaction;
        }

        let ajaxKategoriProgram = function() {
            let dataKategori;
            $.ajax({
                url: '{{ route('admin.ajaxKategoriProgram') }}',
                type: 'POST',
                async: false,
                dateType: 'JSON',
                success: function(response) {
                    dataKategori = response;
                },
                error: function(error) {
                    console.log(error);
                }
            })

            return dataKategori;
        }

        let chartTransaction = ajaxTransaction();
        let chartkategoriProgram = ajaxKategoriProgram();
        const ctx = document.getElementById('myChart');
        const myPie = document.getElementById('myPie');
        myPie.width = 1000;
        myPie.height = 1000;
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: chartTransaction[0],
                datasets: [{
                    data: chartTransaction[1],
                    backgroundColor: chartTransaction[3],
                    borderColor: chartTransaction[4],
                    borderWidth: 1
                }],
            },
            options: {
                legend: {
                    display: false
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            callback: function(value, index, ticks) {
                                return "Rp. " + Number(value).toFixed(0).replace(/./g,
                                    function(c, i, a) {
                                        return i > 0 && c !== "." && (a.length - i) % 3 === 0 ?
                                            "," + c : c;
                                    });
                            }
                        },

                    }],
                },
                tooltips: {
                    callbacks: {
                        label: function(tooltipItem, data) {
                            return "Rp. " + Number(tooltipItem.yLabel).toFixed(0).replace(/./g, function(c, i,
                                a) {
                                return i > 0 && c !== "." && (a.length - i) % 3 === 0 ? "," + c : c;
                            });
                        }
                    }
                }
            }
        });

        new Chart(myPie, {
            type: 'pie',
            data: {
                labels: chartkategoriProgram[0],
                datasets: [{
                    label: '# of Votes',
                    data: chartkategoriProgram[1],
                    backgroundColor: [
                        'rgba(255, 92, 112, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 05, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(201, 203, 207, 0.2)'
                    ],
                    borderColor: [
                        'rgb(255, 99, 132)',
                        'rgb(255, 159, 64)',
                        'rgb(255, 205, 86)',
                        'rgb(75, 192, 192)',
                        'rgb(54, 162, 235)',
                        'rgb(153, 102, 255)',
                        'rgb(201, 203, 207)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    </script>
@endpush
