@extends('frontend.layouts.app')
@section('content')
    <div class="services-area">
        <div class="container">
            <!-- Section-tittle -->
            <div class="row d-flex justify-content-center">
                <div class="col-lg-8">
                    <div class="section-tittle text-center mb-80">
                        <h2>
                            Detail Invoice
                        </h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <section class="section">
                    <div class="section-body">
                        <div class="invoice">
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
                                                    @if ($item->payment_id)
                                                        {{ $item->payment->name . ' - ' . $item->payment->number }}<br>
                                                        {{ $item->payment->description }}
                                                    @else
                                                        Otomatis
                                                    @endif
                                                </address>
                                                <Address>
                                                    <strong>Transaksi Status</strong><br>
                                                    @if ($item->is_verified == 1)
                                                        <span class="badge bg-success">Terverifikasi</span>
                                                    @else
                                                        <span class="badge bg-danger">Tidak Terverifikasi</span>
                                                    @endif
                                                </Address>
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
                                            <table class="table table-striped table-hover table-md">
                                                <tr>
                                                    <th data-width="40">#</th>
                                                    <th>Campaign</th>
                                                    <th class="text-center">Nominal</th>
                                                </tr>
                                                <tr>
                                                    <td>1</td>
                                                    <td>{{ $item->program->name ?? '-' }}</td>
                                                    <td class="text-right">Rp. {{ number_format($item->nominal) }}
                                                    </td>
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
                            <div class="row mb-3">
                                <div class="col-12">
                                    @auth
                                        <a href="{{ route('transaction.index') }}" class="btn btn-warning"><i
                                                class="fas fa-arrow-left"></i> Kembali</a>
                                    @else
                                        <a href="{{ route('home') }}" class="btn btn-warning"><i class="fas fa-arrow-left"></i>
                                            Kembali</a>
                                    @endauth
                                    @if ($item->type !== 'manual')
                                        @if ($item->is_verified == 0)
                                            <a href="javascript:void(0)" id="pay-button"
                                                data-transaction_id="{{ $item->id }}"
                                                data-snaptoken="{{ $item->details->snap_token ?? '' }}"
                                                class="btn btn-primary">
                                                <i class="fas fa-credit-card"></i> Bayar Sekarang</a>
                                        @endif
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
    {{-- create payment --}}
    {{-- <form action="{{ route('createPayment') }}" method="get" id="form-payment">
        @csrf
        <input type="text" name="json" hidden id="json">
    </form> --}}
@endsection
@push('scripts')
    <script type="text/javascript" src="https://app.sandbox.midtrans.com/snap/snap.js"
        data-client-key="SB-Mid-client-qSu88XzrXXVjzxa2"></script>
    <script type="text/javascript">
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        // For example trigger on button clicked, or any time you need
        var payButton = document.getElementById('pay-button');
        payButton.addEventListener('click', function() {
            // Trigger snap popup. @TODO: Replace TRANSACTION_TOKEN_HERE with your transaction token
            var transaction_id = $(this).data('transaction_id');
            var snaptoken = $(this).data('snaptoken');
            if (snaptoken) {
                window.snap.pay(snaptoken, {
                    onSuccess: function(result) {
                        /* You may add your own implementation here */
                        location.reload();
                    },
                    onPending: function(result) {
                        alert('Silahkan bayar');
                        location.reload();
                    },
                    onError: function(result) {
                        /* You may add your own implementation here */
                        alert("payment failed!");
                        console.log(result);
                    },
                    onClose: function() {
                        location.reload();
                        // delete snaptoken
                        // deleteSnapToken(transaction_id);
                    }
                });
            } else {
                $.ajax({
                    url: '{{ route('create-payment') }}',
                    type: 'POST',
                    dataType: 'JSON',
                    data: {
                        transaction_id,
                        '_token': '{{ csrf_token() }}'
                    },
                    success: function(snapToken) {
                        window.snap.pay(snapToken, {
                            onSuccess: function(result) {
                                /* You may add your own implementation here */
                                location.reload();
                            },
                            onPending: function(result) {
                                alert('Silahkan bayar');
                                location.reload();
                            },
                            onError: function(result) {
                                /* You may add your own implementation here */
                                alert("payment failed!");
                                console.log(result);
                            },
                            onClose: function() {
                                alert("payment clode!");
                                // delete snaptoken
                                // deleteSnapToken(transaction_id);
                            }
                        });
                    }
                })
            }

        });
    </script>
@endpush
