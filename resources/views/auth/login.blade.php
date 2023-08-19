@extends('auth.app')
@section('title', 'Login | Donasiinaja')
@section('content')
    <section class="section">
        <div class="container mt-5">
            <div class="row">
                <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
                    <div class="login-brand">
                        <a href="{{ route('home') }}">
                            <img src="{{ $setting->image() }}" alt="logo" class="img-fluid shadow-light"
                                style="max-height: 140px">
                        </a>
                    </div>

                    <div class="card card-primary">
                        <div class="card-header">
                            <h4>Login</h4>
                        </div>
                        <div class="card-body">
                            <form method="POST" action="{{ route('login') }}" class="needs-validation" novalidate="">
                                @csrf
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input id="email" type="email"
                                        class="form-control @error('email') is-invalid @enderror" name="email"
                                        value="{{ old('email') }}" tabindex="1" required autofocus>
                                    @error('email')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <div class="d-block">
                                        <label for="password" class="control-label">Password</label>
                                    </div>
                                    <input id="password" type="password"
                                        class="form-control @error('password') is-invalid @enderror" name="password"
                                        tabindex="2" required>
                                    @error('password')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" name="remember" class="custom-control-input" tabindex="3"
                                            id="remember-me">
                                        <label class="custom-control-label" for="remember-me">Remember Me</label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-lg btn-block" tabindex="4">
                                        Login
                                    </button>
                                </div>
                            </form>
                            <div class="mt-5 text-muted text-center">
                                <p> Belum Punya Akun? <a href="{{ route('register') }}">Buat Akun</a></p>
                                <p>Lupa Password? <a href="{{ route('password.request') }}">Reset Password</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    {{-- <section class="section">
        <div class="container-fluid">
            <div class="row justify-content-center" style="height: 100vh">
                <div class="col-md-5 align-self-center" style="padding-right: 80px;padding-left: 80px">
                    <div class="login-brand text-center mb-5">
                        <a href="{{ route('home') }}">
                            <img src="{{ $setting->image() }}" alt="logo" width="100"
                                class="shadow-light rounded-circle">
                        </a>
                    </div>

                    <div class="card card-primary">
                        <div class="card-header text-center">
                            <h5 class="font-weight-normal">Login</h5>
                        </div>
                        <div class="card-body">
                            <form method="POST" action="{{ route('login') }}" class="needs-validation" novalidate="">
                                @csrf
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input id="email" type="email"
                                        class="form-control @error('email') is-invalid @enderror" name="email"
                                        value="{{ old('email') }}" tabindex="1" required autofocus>
                                    @error('email')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <div class="d-block">
                                        <label for="password" class="control-label">Password</label>
                                    </div>
                                    <input id="password" type="password"
                                        class="form-control @error('password') is-invalid @enderror" name="password"
                                        tabindex="2" required>
                                    @error('password')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" name="remember" class="custom-control-input" tabindex="3"
                                            id="remember-me">
                                        <label class="custom-control-label" for="remember-me">Remember Me</label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-block">
                                        Login
                                    </button>
                                </div>
                            </form>
                            <p class="my-1">Belum punya akun? Silahkan <a href="{{ route('register') }}"
                                    class="">Register</a></p>
                            <p class="my-1">Lupa password? <a href="{{ route('password.request') }}" class="">Reset
                                    Password</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> --}}
@endsection
