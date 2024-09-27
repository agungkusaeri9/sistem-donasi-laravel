<header>
    <!-- Header Start -->
    <div class="header-area header-transparrent ">
        <div class="main-header header-sticky">
            <div class="container">
                <div class="row align-items-center">
                    <!-- Logo -->
                    <div class="col-xl-2 col-lg-2 col-md-2">
                        <div class="logo py-2">
                            <a href="{{ route('home') }}">
                                <img src="{{ $setting->image() }}" alt="" style="max-height: 60px !important">
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-10 col-lg-10 col-md-10">
                        <!-- Main-menu -->
                        <div class="main-menu f-right d-none d-lg-block">
                            <nav>
                                <ul id="navigation">
                                    <li class="{{ request()->is('/') ? 'active' : '' }}"><a href="{{ route('home') }}">
                                            Home</a></li>
                                    <li class="{{ request()->is('campaign', 'campaign/*') ? 'active' : '' }}"><a
                                            href="{{ route('campaign.index') }}">Donasikan</a>
                                        <ul class="submenu">
                                            @foreach ($categories as $category)
                                                <li><a
                                                        href="{{ route('campaign.category', $category->slug) }}">{{ $category->name }}</a>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </li>

                                    <li class="{{ request()->is('artikel', 'artikel/*') ? 'active' : '' }}"><a
                                            href="{{ route('artikel.index') }}">Blog</a></li>
                                    <li class="{{ request()->is('cek-invoice') ? 'active' : '' }}"><a
                                            href="{{ route('invoice.index') }}">Cek Invoice</a></li>
                                    <li class="{{ request()->is('about') ? 'active' : '' }}"><a
                                            href="{{ route('about') }}">Tentang</a></li>
                                    @auth
                                        <li class="nav-item dropdown">
                                            <a href="#" class="nav-link dropdown-toggle" href="#" role="button"
                                                data-toggle="dropdown" aria-expanded="false">
                                                {{ auth()->user()->name }}
                                            </a>
                                            <ul class="submenu">
                                                @if (auth()->user()->getRoleNames()->first() !== 'Donatur')
                                                    <li><a href="{{ route('admin.dashboard') }}">Dashboard</a></li>
                                                @endif
                                                <li><a href="{{ route('profile.index') }}">Profile</a></li>
                                                <li><a href="{{ route('donate') }}">Riwayat Donasi</a></li>
                                                <li> <a href="javascript:void()"
                                                        onclick="document.getElementById('formLogout').submit()">Logout</a>
                                                </li>
                                                <form action="{{ route('logout') }}" method="post" id="formLogout">
                                                    @csrf
                                                </form>
                                            </ul>
                                        </li>
                                    @else
                                        <li><a href="{{ route('login') }}">Login</a></li>
                                        <li><a href="{{ route('register') }}">Register</a></li>
                                    @endauth
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <!-- Mobile Menu -->
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->
</header>
