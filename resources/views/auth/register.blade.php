@extends('auth.app')
@section('title')
    Register - pelayanan Inkubator
@endsection
@section('content')
    <section class="section">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="login-brand">
                        <a href="{{ route('home') }}">
                            <img src="{{ $setting->image() }}" alt="logo" width="100"
                                class="shadow-light rounded-circle">
                        </a>
                    </div>

                    <div class="card card-primary">
                        <div class="card-header">
                            <h4>Register</h4>
                        </div>

                        <div class="card-body">
                            <form method="POST" action="{{ route('register') }}" enctype="multipart/form-data">
                                @csrf
                                <div class='form-group mb-3'>
                                    <label for='name' class='mb-2'>Nama</label>
                                    <input type='text' name='name'
                                        class='form-control @error('name') is-invalid @enderror'
                                        value='{{ old('name') }}'>
                                    @error('name')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>



                                <div class='form-group mb-3'>
                                    <label for='email' class='mb-2'>Email</label>
                                    <input type='text' name='email'
                                        class='form-control @error('email') is-invalid @enderror'
                                        value='{{ old('email') }}'>
                                    @error('email')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                                <div class="row">
                                    <div class="form-group col-6">
                                        <label for="password" class="d-block">Password</label>
                                        <input id="password" type="password"
                                            class="form-control  @error('password') is-invalid @enderror pwstrength"
                                            data-indicator="pwindicator" name="password">
                                        <div id="pwindicator" class="pwindicator">
                                            <div class="bar"></div>
                                            <div class="label"></div>
                                        </div>
                                        @error('password')
                                            <div class='invalid-feedback'>
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                    <div class="form-group col-6">
                                        <label for="password2" class="d-block">Password Confirmation</label>
                                        <input id="password2" type="password"
                                            class="form-control  @error('password_confirmation') is-invalid @enderror"
                                            name="password_confirmation">
                                        @error('password_confirmation')
                                            <div class='invalid-feedback'>
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                </div>

                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-lg btn-block">
                                        Register
                                    </button>
                                </div>
                            </form>
                            <div class="mt-5 text-muted text-center">
                                <p> Sudah Punya Akun? <a href="{{ route('login') }}">Login</a></p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
@endsection
