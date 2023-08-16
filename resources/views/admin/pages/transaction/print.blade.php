<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Laporan Transaksi</title>
    <style>
        body {
            font-size: 12px;
        }

        table {
            width: 100%;
        }

        .styled-table {
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            font-family: sans-serif;
            min-width: 400px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }

        .styled-table thead tr {
            background-color: #009879;
            color: #ffffff;
            text-align: left;
        }

        .styled-table th,
        .styled-table td {
            padding: 12px 15px;
        }

        .styled-table tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        .styled-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }

        .styled-table tbody tr:last-of-type {
            border-bottom: 2px solid #009879;
        }

        .styled-table tbody tr.active-row,
        tr.active-row {
            font-weight: bold;
            color: #009879;
        }
    </style>
</head>

<body>
    <h2 style="text-align: center">Laporan Transaksi</h2>
    <table class="tb-info">
        <tr>
            <td style="text-align:left">Nama Program</td>
            <td> : </td>
            <td>
                @if ($program_id)
                    {{ $items->first()->program->name }}
                @else
                    Semua
                @endif
            </td>
        </tr>
        <tr>
            <td style="text-align:left">Verifikasi</td>
            <td> : </td>
            <td>
                @if ($is_verified || $is_verified === 0)
                    @if ($is_verified === 0)
                        Tidak
                    @else
                        Ya
                    @endif
                @else
                    Semua
                @endif
            </td>
        </tr>
        <tr>
            <td style="text-align:left">Jumlah Donatur</td>
            <td> : </td>
            <td>
                @if ($program_id)
                    {{ $items->where('program_id', $program_id)->count() }}
                @else
                    {{ $items->count() }}
                @endif
            </td>
        </tr>
        <tr>
            <td style="text-align:left">Terkumpul</td>
            <td> : </td>
            <td>Rp.
                @if ($is_verified !== 0)
                    @if ($program_id)
                        {{ number_format($count['sum_total_program']) }}
                    @else
                        {{ number_format($count['sum_total_without_program']) }}
                    @endif
                @else
                    -
                @endif
            </td>
        </tr>
        <tr>
            <td style="text-align:left">Tanggal Cetak</td>
            <td> : </td>
            <td>{{ Carbon\Carbon::now()->translatedFormat('l, d F Y') }}</td>
        </tr>
    </table>
    <table class="styled-table">
        <thead>
            <tr>
                <th>No.</th>
                <th>No. Invoice</th>
                <th>Nama Donatur</th>
                <th>Jenis Pembayaran</th>
                <th>Nominal</th>
                <th>Verifikasi</th>
                <th>Tanggal</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($items as $item)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $item->code }}</td>
                    <td>{{ $item->name }}</td>
                    <td>{{ $item->type }}</td>
                    <td>{{ number_format($item->nominal) }}</td>
                    <td>
                        @if ($item->is_verified == 1)
                        Ya
                        @else
                        Tidak
                    @endif
                    </td>
                    <td>{{ $item->created_at->translatedFormat('h:i:s d-m-Y') }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>

    {{-- <h3>Rekap Metode Pembayaran</h3>
    <table class="tb-info">
        @foreach ($payments as $py)
            <tr>
                <td style="text-align:left">{{ $py->name . ' - ' . $py->number . '( ' . $py->description  . ' )'}}</td>
                <td> : </td>
                <td>Rp.
                    @if ($program_id)
                        @if ($is_verified !== null)
                            @if ($items->where('is_verified', $is_verified)->sum('nominal') > 0)
                                {{ number_format($py->transactions->where('is_verified', $is_verified)->where('program_id', $program_id)->sum('nominal')) }}
                            @else
                                0
                            @endif
                        @else
                            {{ number_format($py->transactions->where('is_verified', 1)->where('program_id', $program_id)->sum('nominal')) }}
                        @endif
                    @else
                        @if ($is_verified !== null)
                            @if ($items->where('is_verified', $is_verified)->sum('nominal') > 0)
                                {{ number_format($py->transactions->where('is_verified', $is_verified)->sum('nominal')) }}
                            @else
                                0
                            @endif
                        @else
                            {{ number_format($py->transactions->where('is_verified', 1)->sum('nominal')) }}
                        @endif
                    @endif
                </td>
            </tr>
        @endforeach

        <tr class="active-row">
            <th style="text-align:left">
                <u>Total</u>
            </th>
            <td></td>
            <td>Rp.
                @if ($is_verified !== 0)
                    @if ($program_id)
                        {{ number_format($count['sum_total_program']) }}
                    @else
                        {{ number_format($count['sum_total_without_program']) }}
                    @endif
                @else
                    -
                @endif
            </td>
        </tr>
    </table> --}}
</body>

</html>
