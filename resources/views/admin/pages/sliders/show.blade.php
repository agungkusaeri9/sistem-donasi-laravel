@extends('admin.layouts.app')
@section('content')
    <section class="section">
        <div class="section-header">
            <h1>{{ $item->name }}</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">Dashboard</a></div>
                <div class="breadcrumb-item active"><a href="{{ route('admin.sliders.index') }}">Data Slider</a></div>
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
                                    <span class="ml-5 text-right">{{ $item->title }}</span>
                                </li>
                                <hr>
                                <li class="list-item d-flex justify-content-between">
                                    <span class="font-weight-bold">Program Donasi</span>
                                    <span class="ml-5 text-right">{{ $item->program->name ?? '-' }}</span>
                                </li>
                                <hr>
                                <li class="list-item d-flex justify-content-between">
                                    <span class="font-weight-bold">Status</span>
                                    <span class="ml-5 text-right">
                                        @if ($item->is_active == 1)
                                            <span class="badge badge-success">Aktf</span>
                                        @else
                                        <span class="badge badge-danger">Tidak Aktf</span>
                                        @endif
                                    </span>
                                </li>
                                <hr>
                                <li class="list-item d-flex justify-content-between">
                                    <span class="font-weight-bold">Dibuat</span>
                                    <span class="ml-5 text-right">{{ $item->created_at->translatedFormat('l, d F Y') }}</span>
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
        .postImage{
            max-height: 560px
        }
    </style>
@endpush
