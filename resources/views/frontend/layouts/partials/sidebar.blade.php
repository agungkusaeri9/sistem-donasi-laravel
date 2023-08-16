<div class="col-md-3 mb-2">
    <div class="card" style="min-height: 150px">
        <div class="card-body">
            <nav class="nav flex-column bg-transparent shadow-none  nav-pills">
                <a class="nav-link text-dark mb-2 {{ request()->route()->getName() === 'profile.index' ? 'nv-active' : '' }} " href="{{ route('profile.index') }}">Profile</a>
                <a class="nav-link text-dark mb-2 {{ request()->route()->getName() === 'transaction.index' ? 'nv-active' : '' }}" href="{{ route('transaction.index') }}">Donasi Saya</a>
                <a class="nav-link text-dark mb-2 {{ request()->route()->getName() === 'change-password.index' ? 'nv-active' : '' }}" href="{{ route('change-password.index') }}">Ubah Password</a>
                <a class="nav-link text-dark mb-2" href="javascript:void()" onclick="document.getElementById('formLogout').submit()">Keluar</a>
                <form action="{{ route('logout') }}" id="formLogout">
                @csrf
            </form>
            </nav>
        </div>
    </div>
</div>
