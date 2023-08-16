@extends('frontend.layouts.app')
@section('content')
    <div class="services-area">
        <div class="container">
            <!-- Section-tittle -->
            <div class="row d-flex justify-content-center">
                <div class="col-lg-8">
                    <div class="section-tittle text-center mb-80">
                        <h2>
                            Pilih Pembayaran
                        </h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        <div class="row mb-2">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h6 class="mb-3">Nominal <span class="text-danger">*</span></h6>
                        <div class="row mb-2">
                            <div class="col-md-3">
                                <div class="btn w-100 mr-3 px-5 btn-outline-primary btnPrice" id="btnPrice10000"
                                    data-price="10000">
                                    10.000
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="btn w-100 mr-3 px-5 btn-outline-primary btnPrice" id="btnPrice20000"
                                    data-price="20000">
                                    20.000
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="btn w-100 mr-3 px-5 btn-outline-primary btnPrice" id="btnPrice30000"
                                    data-price="30000">
                                    30.000
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="btn w-100 mr-3 px-5 btn-outline-primary btnPrice" id="btnPrice40000"
                                    data-price="40000">
                                    40.000
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="btn w-100 mr-3 px-5 btn-outline-primary btnPrice" id="btnPrice50000"
                                    data-price="50000">
                                    50.000
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="btn w-100 mr-3 px-5 btn-outline-primary btnPrice" id="btnPrice100000"
                                    data-price="100000">
                                    100.000
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="btn w-100 mr-3 px-5 btn-outline-primary btnPrice" id="btnPrice200000"
                                    data-price="200000">
                                    200.000
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="btn w-100 mr-3 px-5 btn-outline-primary btnPrice" id="btnPricelainnya"
                                    data-price="lainnya">
                                    Lainnya
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2 d-none otherPrice">
                            <div class="col-12">
                                <div class="form-group mb-2">
                                    <label for="other_prive" class="mb-2">Lainnya</label>
                                    <input type="number" name="other_price" id="other_price" class="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <form action="{{ route('donate') }}" method="post">
            <div class="row mb-2">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="mb-3">Pilih Jenis Pembayaran <span class="text-danger">*</span></h6>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="type" id="type_manual"
                                    value="manual">
                                <label class="form-check-label" for="type_manual">
                                    Manual (Dicek Manual)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="type" id="type_otomatis"
                                    value="otomatis">
                                <label class="form-check-label" for="type_otomatis">
                                    Otomatis (Dicek Otomatis)
                                </label>
                            </div>
                            <div class="d-payment_manual d-none">
                                <h6 class="mb-3 mt-2">Pilih Metode Pembayaran <span class="text-danger">*</span></h6>
                                <div class="payment_manual">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h6>Dukungan untuk campaign <span class="fs-6 fw-lighter">(opsional)</span></h6>
                            <textarea name="acceptance" id="acceptance" cols="30" rows="5" class="form-control"
                                placeholder="Tulis Dukungan atau Doa untuk Campaign ini."></textarea>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="mb-2">Masukan Identitas Kamu</h6>

                            @csrf
                            <input type="hidden" name="nominal" id="nominal">
                            <input type="hidden" name="program_id" id="program_id" value="{{ $item->id }}">

                            <div class="form-group mb-3">
                                <label for="name" class="mb-2">Nama <span class="text-danger">*</span></label>
                                <input type="text" name="name" class="form-control"
                                    @if (Auth::check() == true) value="{{ auth()->user()->name }}" @endif>
                            </div>
                            <div class="form-group mb-3">
                                <label for="email" class="mb-2">Email</label>
                                <input type="text" name="email" class="form-control"
                                    @if (Auth::check() == true) value="{{ auth()->user()->email }}" @endif>
                            </div>
                            <div class="form-group mb-3">
                                <label for="phone_number" class="mb-2">No. Telepon <span
                                        class="text-danger">*</span></label>
                                <input type="text" name="phone_number" class="form-control" placeholder="628xxxxxxx">
                            </div>
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="checkbox" value="1" id="is_anonim"
                                    name="is_anonim">
                                <label class="form-check-label" for="is_anonim">
                                    Donasi Sebagai Hamba Allah
                                </label>
                            </div>
                            <div class="d-grid gap-2 mt-3">
                                <button class="btn btn-secondary" type="submit">Bayar</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>

    </div>
@endsection
@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/sweetalert2/sweetalert2.all.min.js') }}">
    <link rel="stylesheet" href="{{ asset('assets/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css') }}">
@endpush

@push('scripts')
    <script src="{{ asset('assets/sweetalert2/sweetalert2.min.js') }}"></script>
    @include('admin.layouts.partials.sweetalert')
    <script>
        $(function() {

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $('input[name="type"]').on('change', function() {
                let type = $(this).val();
                if (type === 'manual') {
                    // get Pembayaran manual
                    $.ajax({
                        url: '{{ route('payments.get') }}',
                        type: 'POST',
                        dataType: 'JSON',
                        data: {
                            '_token': '{{ csrf_token() }}'
                        },
                        success: function(response) {
                            $('.d-payment_manual').removeClass('d-none');
                            $('.payment_manual').empty();
                            if (response.code == 200) {
                                response.data.forEach(payment => {
                                    console.log(payment.name);
                                    $('.payment_manual').append(`<div class="form-check mb-2">
                                    <input class="form-check-input payment_id" type="radio" name="payment_id"
                                        id="payment${payment.id}" value="${payment.id}" />
                                    <label class="form-check-label" for="payment${payment.id}">
                                       ${payment.name}
                                    </label>
                                </div>`);
                                });
                            }
                        }
                    })
                } else {
                    $('.d-payment_manual').addClass('d-none');
                }
            })

            $('.btnPrice').on('click', function() {
                $('#other_price').val(0);
                $('#nominal').val(0);
                $('.btnPrice').removeClass('active');
                $('.otherPrice').addClass('d-none');
                let price = 10000;
                price = $(this).data('price');
                if (price === 'lainnya') {
                    $('.otherPrice').removeClass('d-none');
                    $('.otherPrice').on('keyup', function() {
                        nominal = $('#other_price').val();
                        console.log(nominal);
                        $('#nominal').val(nominal);
                    })
                } else {
                    nominal = price;
                    $('#nominal').val(nominal);
                }
                let btnPrice = '#btnPrice' + price;
                $(btnPrice).addClass('active');

                $('.payment_id').on('change', function() {
                    let payment_id = $(this).val();
                    $('#payment_id').val(payment_id);
                })
                // add to form

            })
        })
    </script>
@endpush
