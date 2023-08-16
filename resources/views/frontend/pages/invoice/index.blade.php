@extends('frontend.layouts.app')
@section('content')
    <div class="services-area">
        <div class="container">

            <!-- Section-tittle -->
            <div class="row d-flex justify-content-center">
                <div class="col-lg-8">
                    <div class="section-tittle text-center mb-80">
                        <h2>Cek Invoice</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <form action="{{ route('invoice.check') }}" method="post">
            <div class="row justify-content-center">
                @csrf
                <div class="col-md-8">
                    <div class="form-group input-group-lg">
                        <input type="number" name="code" class="form-control @error('code') is-invalid @enderror fs-6"
                            placeholder="Masukan Kode Invoice..." value="{{ $code }}" style="font-size: 16px" />
                    </div>
                    @error('code')
                        <div class="invalid-feedback d-inline">
                            {{ $message }}
                        </div>
                    @enderror
                </div>
                <div class="col-md-8">
                    <div class="form-group mt-4">
                        <div class="text-center">
                            <button class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    @if ($status == true)
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    @if ($item)
                        <div class="alert alert-success">
                            <h5 class="mb-4 mt-4">Informasi Invoice</h5>
                            <ul class="list-inline">
                                <li class="list-inline-item d-flex justify-content-between mb-3">
                                    <span class="">No.Invoice</span>
                                    <span>#{{ $item->code }}</span>
                                </li>
                                <li class="list-inline-item d-flex justify-content-between mb-3">
                                    <span class="">Campaign</span>
                                    <span>{{ $item->program->name }}</span>
                                </li>
                                <li class="list-inline-item d-flex justify-content-between mb-3">
                                    <span class="">Nominal</span>
                                    <span>Rp {{ number_format($item->nominal, 0, '.', '.') }} </span>
                                </li>
                                <li class="list-inline-item d-flex justify-content-between mb-3">
                                    <span class="">Jenis Pembayaran</span>
                                    <span>{{ $item->type }}</span>
                                </li>
                                @if ($item->type === 'manual')
                                    <li class="list-inline-item d-flex justify-content-between mb-3">
                                        <span class="">Metode Pembayaran</span>
                                        <span>{{ $item->payment->name ?? '-' }} - {{ $item->payment->number ?? '-' }}
                                            ({{ $item->payment->description ?? '-' }})</span>
                                    </li>
                                @endif
                                <li class="list-inline-item d-flex justify-content-between mb-3">
                                    <span class="">Status</span>
                                    <span>
                                        {!! $item->isVerified() !!}
                                    </span>
                                </li>
                                <li class="list-inline-item d-flex justify-content-between mb-3">
                                    <span class=""></span>
                                    <span></span>
                                </li>
                            </ul>
                        </div>
                    @else
                        <div class="alert alert-danger">
                            <div class="text-center">
                                <h6 class="text-center mt-4">No. Invoice #{{ $code }} Tidak Ditemukan!</h6>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    @endif
@endsection
