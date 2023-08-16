@extends('frontend.layouts.app')
@section('content')
    <div class="services-area">
        <div class="container">

            <!-- Section-tittle -->
            <div class="row d-flex justify-content-center">
                <div class="col-lg-8">
                    <div class="section-tittle text-center mb-80">
                        <h2>Profile</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            @include('frontend.layouts.partials.sidebar')
            <div class="col-md-9">
                <div class="card">
                    <div class="card-body">
                        <div class="text-center">
                            <h5 class="mb-4">Profile Saya</h5>
                            <img src="{{ auth()->user()->avatar() }}" alt="{{ auth()->user()->name }}"
                                class="img-fluid rounded-circle mb-3" style="max-height: 90px;max-width:90px;">
                        </div>
                        <form action="{{ route('profile.update') }}" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group mb-3">
                                <label for="name" class="mb-2">Nama Lengkap</label>
                                <input type="text" class="form-control  @error('name') is-invalid @enderror"
                                    value="{{ auth()->user()->name ?? '-' }}" required="" name="name">
                                @error('name')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group mb-3">
                                <label for="username" class="mb-2">Username</label>
                                <input type="text" class="form-control  @error('username') is-invalid @enderror"
                                    value="{{ auth()->user()->username ?? '-' }}" name="username" readonly disabled>
                                @error('username')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group mb-3">
                                <label for="email" class="mb-2">Email</label>
                                <input type="text" class="form-control  @error('email') is-invalid @enderror"
                                    value="{{ auth()->user()->email ?? '-' }}" name="email" readonly disabled>
                                @error('email')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group mb-3">
                                <label for="avatar" class="mb-2">Foto</label>
                                <input type="file" class="form-control  @error('avatar') is-invalid @enderror"
                                    name="avatar">
                                @error('avatar')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group mb-3 float-right">
                                <button class="btn text-right btn-primary">Simpan</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/sweetalert2/sweetalert2.all.min.js') }}">
    <link rel="stylesheet" href="{{ asset('assets/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css') }}">
@endpush
@push('scripts')
    <script src="{{ asset('assets/sweetalert2/sweetalert2.min.js') }}"></script>
    @include('admin.layouts.partials.sweetalert')
@endpush
