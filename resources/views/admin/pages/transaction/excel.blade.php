<table class="tb-info">
    <tr></tr>
    <tr>
        <td style="text-align:left" colspan="2">Nama Program</td>
        <td>
            @if ($program_id)
                {{ $items->first()->program->name }}
            @else
                Semua
            @endif
        </td>
    </tr>
    <tr>
        <td style="text-align:left" colspan="2">Verifikasi</td>
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
        <td style="text-align:left" colspan="2">Jumlah Donatur</td>
        <td style="text-align:left">
            @if ($program_id)
                {{ $items->where('program_id', $program_id)->count() }}
            @else
                {{ $items->count() }}
            @endif
        </td>
    </tr>
    <tr>
        <td style="text-align:left" colspan="2">Terkumpul</td>
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
        <td style="text-align:left" colspan="2">Tanggal Cetak</td>
        <td>{{ Carbon\Carbon::now()->translatedFormat('l, d F Y') }}</td>
    </tr>
    <tr></tr>
</table>
<table>
    <tr>
        <th colspan="7" style="text-align: center;background-color:black;color:white">Laporan Transaksi Donasi</th>
    </tr>
    <tr>
        <th style="text-align:center;width:40px;">No.</th>
        <th style="text-align:center;width: 100px;">No. Invoice</th>
        <th style="text-align:center;width: 150px;">Nama Donatur</th>
        <th style="text-align:center;width: 100px;">Jenis Pembayaran</th>
        <th style="text-align:center;width: 80px;">Nominal</th>
        <th style="text-align:center;width: 80px;">Verifikasi</th>
        <th style="text-align:center;width: 150px;">Tanggal</th>
    </tr>
    @foreach ($items as $item)
    <tr>
        <td style="text-align: center">{{ $loop->iteration }}</td>
        <td style="text-align: left">#{{ $item->code }}</td>
        <td style="text-align: left">{{ $item->name }}</td>
        <td style="text-align: left">{{ $item->type }}</td>
        <td style="text-align: right">{{ number_format($item->nominal) }}</td>
        <td style="text-align: center">{{ $item->is_verified === 1 ? 'Ya' : 'Tidak' }}</td>
        <td style="text-align: left">{{ $item->created_at->translatedFormat('h:i:s d-m-Y') }}</td>
    </tr>
@endforeach
</table>

{{-- <table>
    <tr style="background-color:black">
        <td colspan="5" style="background-color:black;color:white;text-align:center">Rekap Metode Pembayaran</td>
    </tr>
    @foreach ($payments as $py)
        <tr>
            <td style="text-align:left" colspan="3">{{ $py->name . ' - ' . $py->number . '( ' . $py->description  . ' )'}}</td>

            <td colspan="2" style="text-align: right">
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
        <th style="text-align:center;font-weight:bold" colspan="3">
            <u>Total</u>
        </th>
        <td colspan="2" style="text-align: right;font-weight:bold">Rp.
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
