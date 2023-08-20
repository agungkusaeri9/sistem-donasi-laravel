@extends('admin.layouts.app')
@section('content')
    <section class="section">
        <div class="section-header">
            <h1>{{ $item->name }}</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">Dashboard</a></div>
                <div class="breadcrumb-item active"><a href="{{ route('admin.program.index') }}">Data Program</a></div>
                <div class="breadcrumb-item">{{ $item->name }}</div>
            </div>
        </div>
        <div class="section-body">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <ul class="list-unstyled">
                                <li class="list-item d-flex justify-content-between">
                                    <span class="font-weight-bold">Judul</span>
                                    <span class="ml-5 text-right">{{ $item->name }}</span>
                                </li>
                                <hr>
                                <li class="list-item d-flex justify-content-between">
                                    <span class="font-weight-bold">Kategori</span>
                                    <span class="ml-5 text-right">{{ $item->category->name ?? '-' }}</span>
                                </li>
                                <hr>
                                <li class="list-item d-flex justify-content-between">
                                    <span class="font-weight-bold">Meta Kata Kunci</span>
                                    <span class="ml-5 text-right">{{ $item->meta_keyword }}</span>
                                </li>
                                <hr>
                                <li class="list-item d-flex justify-content-between">
                                    <span class="font-weight-bold">Meta Deskripsi</span>
                                    <span class="ml-5 text-right">{{ $item->meta_description }}</span>
                                </li>
                                <hr>
                                <li class="list-item d-flex justify-content-between">
                                    <span class="font-weight-bold">Donasi Terkumpul</span>
                                    <span class="ml-5 text-right">Rp. {{ $item->donation_collacted() ?? '0' }}</span>
                                </li>
                                <hr>
                                <li class="list-item d-flex justify-content-between">
                                    <span class="font-weight-bold">Donasi Target</span>
                                    <span class="ml-5 text-right">Rp. {{ number_format($item->donation_target) }}</span>
                                </li>
                                <hr>
                                <li class="list-item d-flex justify-content-between">
                                    <span class="font-weight-bold">Status</span>
                                    <span class="ml-5 text-right">
                                        @if ($item->status == 0)
                                            <span class="badge badge-secondary">Belum Selesai</span>
                                        @elseif($item->status == 1)
                                            <span class="badge badge-warning">Sedang Berjalan</span>
                                        @else
                                            <span class="badge badge-success">Selesai</span>
                                        @endif
                                    </span>
                                </li>
                                <hr>
                                <li class="list-item d-flex justify-content-between">
                                    <span class="font-weight-bold">Pembuat</span>
                                    <span class="ml-5 text-right">{{ $item->user->name ?? '-' }}</span>
                                </li>
                                <hr>
                                <li class="list-item d-flex justify-content-between">
                                    <span class="font-weight-bold">Dibuat</span>
                                    <span
                                        class="ml-5 text-right">{{ $item->created_at->translatedFormat('l, d F Y') }}</span>
                                </li>
                                <hr>
                                <li class="list-item d-flex justify-content-between">
                                    <span class="font-weight-bold">Diubah</span>
                                    <span class="ml-5 text-right">
                                        @if ($item->updated_at)
                                            {{ $item->updated_at->translatedFormat('l, d F Y') }}
                                        @endif
                                    </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h6>Anggaran Donasi</h6>
                        </div>
                        <div class="card-body">
                            <ul class="list-unstyled">
                                @foreach ($item->budgets as $budget)
                                    <li class="list-item d-flex justify-content-between">
                                        <span class="">{{ $budget->name }}</span>
                                        <span class="ml-5 text-right">{{ number_format($budget->nominal) }}</span>
                                    </li>
                                    <hr>
                                @endforeach
                                <li class="list-item d-flex justify-content-between">
                                    <span class="font-weight-bold">Total</span>
                                    <span class="ml-5 text-right font-weight-bold">Rp.
                                        {{ number_format($item->budgets->sum('nominal')) }}</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body">
                            <img src="{{ $item->image() }}" class="img-fluid w-100 postImage" alt="{{ $item->title }}">
                            <div class="description mt-3">
                                {!! $item->description !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@push('styles')
    <style>
        .postImage {
            max-height: 560px
        }
    </style>
@endpush
