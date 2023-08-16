<!DOCTYPE HTML>
<html>

   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<body>
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <section class="section">

                        <div class="section-body">
                            <div class="invoice w-100">
                                <div class="invoice-print">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="invoice-title">
                                                <h2>Invoice</h2>
                                                <div class="invoice-number">Code #{{ $item->code }}</div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <address>
                                                        <strong>Pengirim :</strong><br>
                                                        {{ $item->name ?? '-' }}<br>
                                                        {{ $item->email ?? '-' }}<br>
                                                        {{ $item->phone_number ?? '-' }}<br>
                                                    </address>
                                                </div>
                                                <div class="col-md-6 text-md-right">
                                                    <address>
                                                        <strong>Penerima :</strong><br>
                                                        {{ $setting->site_name }}<br>
                                                        {{ $setting->email }}<br>
                                                        {{ $setting->phone }}<br>
                                                        {{ $setting->address }}
                                                    </address>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <address>
                                                        <strong>Metode Pembayaran:</strong><br>
                                                        {{ $item->payment->name . ' - ' . $item->payment->number }}<br>
                                                        {{ $item->payment->description }}
                                                    </address>
                                                </div>
                                                <div class="col-md-6 text-md-right">
                                                    <address>
                                                        <strong>Tanggal Donasi:</strong><br>
                                                        {{ $item->created_at->translatedFormat('l, d F Y H:i') }}<br><br>
                                                    </address>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-4">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-hover w-100">
                                                    <tr>
                                                        <th data-width="40">#</th>
                                                        <th>Nama Program</th>
                                                        <th class="text-center">Nominal</th>
                                                    </tr>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>{{ $item->program->name ?? '-' }}</td>
                                                        <td class="text-right">{{ number_format($item->nominal) }}</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="row mt-5">
                                                <div class="col-md-12">
                                                    <p class="fs-6 fw-light text-center">
                                                        Terima kasih kami ucapkan kepada donatur yang telah menginfakan
                                                        hartanya di jalan Allah untuk membantu
                                                        {{ $item->program->name }} yang bertempat di
                                                        {{ $item->program->location }}. Semoga Allah SWT menggantinya
                                                        dengan keberkahan yang berlipat ganda dalam segala urusan, dan
                                                        menjadi amal yang tiada putus di dunia dan akhirat. Aamiin
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-12">
                                        @auth
                                            <a href="{{ route('transaction.index') }}" class="btn btn-primary"><i
                                                    class="fas fa-arrow-left"></i> Kembali</a>
                                        @else
                                            <a href="{{ route('home') }}" class="btn btn-primary"><i
                                                    class="fas fa-arrow-left"></i> Kembali</a>
                                        @endauth
                                        <a href="{{ route('invoice.download',encrypt($item->code)) }}" class="btn btn-secondary"><i
                                            class="fas fa-print"></i> Cetak</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
</div>


</body>

</html>
