<div>
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand">
            <a href="{{ route('home') }}">{{ $setting->site_name }}</a>
        </div>
        <div class="sidebar-brand sidebar-brand-sm">
            <a href="{{ route('admin.dashboard') }}">{{ $alias }}</a>
        </div>
        <ul class="sidebar-menu">
            <li class="nav-item"><a class="nav-link" href="{{ route('admin.dashboard') }}"><i class="fas fa-fire"></i>
                    <span>Dashboard</span></a>
            </li>
            <li>
                <a class="nav-link" href="{{ route('admin.transactions.index') }}"><i class="fas fa-tags"></i>
                    <span>Transaksi</span></a>
            </li>
            <li class="nav-item dropdown">
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-fw fa-bullhorn"></i>
                    <span>Program</span></a>
                <ul class="dropdown-menu">
                    <li><a href="{{ route('admin.programs-categories.index') }}">Kategori</a></li>
                    <li><a href="{{ route('admin.program.index') }}">Program</a></li>
                </ul>
            </li>
            <li>
                <a class="nav-link" href="{{ route('admin.withdrawals.index') }}"><i class="fas fa-money-bill-wave"></i>
                    <span>Penarikan Dana</span></a>
            </li>
            <li class="nav-item dropdown">
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-fw fa-blog"></i>
                    <span>Artikel</span></a>
                <ul class="dropdown-menu">
                    <li><a href="{{ route('admin.post-categories.index') }}">Kategori</a></li>
                    <li><a href="{{ route('admin.post-tags.index') }}">Tag</a></li>
                    <li><a href="{{ route('admin.posts.index') }}">Artikel</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-fw fa-database"></i>
                    <span>Master Data</span></a>
                <ul class="dropdown-menu">
                    <li><a href="{{ route('admin.payments.index') }}">Metode Pembayaran</a></li>
                    <li><a href="{{ route('admin.sliders.index') }}">Slider</a></li>
                    <li><a href="{{ route('admin.socmeds.index') }}">Sosial Media</a></li>
                    <li><a href="{{ route('admin.users.index') }}">User</a></li>
                </ul>
            </li>
            <li>
                <a class="nav-link" href="{{ route('admin.settings.index') }}"><i class="fas fa-cog"></i>
                    <span>Pengaturan Web</span></a>
            </li>
        </ul>
    </aside>
</div>
