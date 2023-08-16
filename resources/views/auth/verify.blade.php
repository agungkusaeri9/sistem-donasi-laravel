@extends('auth.app')
@section('title', 'Verifikasi Akun')
<section class="section">
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
                    <div class="card-header">
                        <h5 class="font-weight-normal">Verifikasi Email</h5>
                    </div>
                    <div class="card-body">
                        @if (session('resent'))
                            <div class="alert alert-success" role="alert">
                                <p> Kami telah mengirimkan link verifikasi baru ke email anda.</p>
                            </div>
                        @endif

                        <p>Silahkan cek email anda untuk proses verifikasi dan klik link yang kami berikan. Jika tidak
                            menerima email, silahkan klik kirim ulang.</p>

                        <form class="d-inline" method="POST" action="{{ route('verification.resend') }}">
                            @csrf
                            <button type="submit" class="btn btn-link p-0 m-0 align-baseline">Kirim Ulang</button>.
                        </form>

                        <form action="{{ route('logout') }}" method="post">
                            @csrf
                            <button class="btn text-area btn-link px-0 mt-3">Logout</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
