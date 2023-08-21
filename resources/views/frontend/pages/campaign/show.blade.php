@extends('frontend.layouts.app')
@section('content')
    <div class="services-area">
        <div class="container">
            <!-- Section-tittle -->
            <div class="row d-flex justify-content-center">
                <div class="col-lg-8">
                    <div class="section-tittle text-center mb-80">
                        <h2>
                            {{ $item->name }}
                        </h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-3">
        <div class="row">
            <div class="col-md-8 mb-2">
                <div class="detail-campaign">
                    <img src="{{ $item->image() }}" class="img-fluid" alt="{{ $item->name }}" />
                    <h5 class="mt-3 mb-4">
                        {{ $item->name }}
                    </h5>

                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link text-dark active" id="detail-tab" data-toggle="tab"
                                data-target="#detail" type="button" role="tab" aria-controls="detail"
                                aria-selected="true">Detail
                                Campaign</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link text-dark" id="profile-tab" data-toggle="tab" data-target="#profile"
                                type="button" role="tab" aria-controls="profile" aria-selected="false">Anggaran
                                Dana</button>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTab">
                        <div class="tab-pane fade show active" id="detail" role="tabpanel" aria-labelledby="detail-tab">
                            <p class="deskripsi">
                                {!! $item->description !!}
                            </p>
                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <ul class="list-inline mt-2">
                                @foreach ($item->budgets as $budget)
                                    <li class="list-inline-item mb-2 d-flex justify-content-between">
                                        <span class="text-info">{{ $budget->name }}</span>
                                        <span class="">Rp. {{ number_format($budget->nominal) }}</span>
                                    </li>
                                @endforeach
                                <li class="list-inline-item d-flex justify-content-between">
                                    <span class="text-info">Total</span>
                                    <span class="">Rp.
                                        {{ number_format($item->budgets->sum('nominal')) }}</span>
                                </li>
                                <li class="list-inline-item d-flex justify-content-between">
                                    <span class="text-info"></span>
                                    <span class="font-weight-bold"></span>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- donatur -->
                    <h6 class="mt-4 mb-3">Donatur ({{ $item->transactions_success_count }})</h6>
                    @foreach ($item->transactions_success as $transaction)
                        <div class="row">
                            <div class="col-md-2">
                                <img src="{{ $transaction->avatar() }}" class="img-fluid rounded-circle" alt=""
                                    style="height: 60px; width: 60px" />
                            </div>
                            <div class="col-md-10">
                                <p>
                                    <span class="text-dark">
                                        {{ $transaction->name() }}
                                    </span>
                                    <span class="small">{{ $transaction->created_at->diffForHumans() }}</span>
                                </p>
                                <h6>Rp. {{ number_format($transaction->nominal) }}</h6>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-12">
                                <p class="text-muted">
                                <blockquote class="blockquote">
                                    <p class="mb-0">"{{ $transaction->acceptance }}"</p>
                                </blockquote>
                                </p>
                            </div>
                        </div>
                        <hr class="py-0 my-0">
                    @endforeach
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h3 class="mb-4">Informasi</h3>
                        <div class="d-flex mb-3 justify-content-between">
                            <span>Kategori</span>
                            <span>{{ $item->category->name }}</span>
                        </div>
                        <div class="d-flex mb-3 justify-content-between">
                            <span>Alamat</span>
                            <span>{{ $item->location }}</span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span class="small">{{ $item->transactions_success_count }} Donatur</span>
                            <span class="small">
                                @if ($item->count_day() > 0)
                                    {{ $item->count_day() }} Hari Lagi
                                @else
                                    Waktu Habis
                                @endif
                            </span>
                        </div>
                        <div class="progress my-3">
                            <div class="progress-bar" style="width: {{ $item->percent() }}%" role="progressbar"
                                aria-label="Basic example" aria-valuenow="{{ $item->percent() }}" aria-valuemin="0"
                                aria-valuemax="100"></div>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span class="nominal small">Rp.
                                {{ number_format($item->transactions_success()->sum('nominal')) }}</span>
                            <span class="nominal small">Rp. {{ number_format($item->deficiency()) }}</span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span class="small">Terkumpul</span>
                            <span class="small">Kekurangan</span>
                        </div>
                        <div class="d-grid gap-2 mt-3">
                            <a href="{{ route('donate.payment', $item->slug) }}" class="btn btn-secondary btn-block"
                                type="submit">
                                Donasikan Sekarang
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('styles')
    <style>
        .active {}
    </style>
    <link rel="stylesheet" href="{{ asset('assets/sweetalert2/sweetalert2.all.min.js') }}">
    <link rel="stylesheet" href="{{ asset('assets/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css') }}">
@endpush
@push('scripts')
    <script src="{{ asset('assets/sweetalert2/sweetalert2.min.js') }}"></script>
    @include('admin.layouts.partials.sweetalert')
@endpush
