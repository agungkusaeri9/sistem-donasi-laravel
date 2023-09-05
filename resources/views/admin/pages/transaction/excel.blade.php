<table class="tb-info">
    <tr></tr>
    @if ($program_id)
        <tr>
            <td style="text-align:left" colspan="2">Nama Program</td>
            <td>
                {{ $items->first()->program->name }}
            </td>
        </tr>
    @endif
    @if ($month)
        <tr>
            <td style="text-align:left" colspan="2">Bulan</td>
            <td>
                {{ $month }}
            </td>
        </tr>
    @endif
    @if ($year)
        <tr>
            <td style="text-align:left" colspan="2">Tahun</td>
            <td>
                {{ $year }}
            </td>
        </tr>
    @endif
    @if ($is_verified || $is_verified === 0)
        <tr>
            <td style="text-align:left" colspan="2">Verifikasi</td>
            <td>
                @if ($is_verified === 0)
                    Tidak
                @else
                    Ya
                @endif
            </td>
        </tr>
    @endif
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
        <td style="text-align:left" colspan="2">Total</td>
        <td>Rp.
            {{-- @if ($is_verified !== 0)
                @if ($program_id)
                    {{ number_format($count['sum_total_program']) }}
                @else
                    {{ number_format($count['sum_total_without_program']) }}
                @endif
            @else
                -
            @endif --}}
            {{ number_format($count['sum_total_program']) }}
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
