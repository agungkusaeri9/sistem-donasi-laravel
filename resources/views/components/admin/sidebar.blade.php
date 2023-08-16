<div>
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand">
            <a href="{{ route('home') }}">{{ $setting->site_name }}</a>
        </div>
        <div class="sidebar-brand sidebar-brand-sm">
            <a href="{{ route('admin.dashboard') }}">{{ $alias }}</a>
        </div>
        <ul class="sidebar-menu">
            @can('Dashboard')
                <li class="nav-item"><a class="nav-link" href="{{ route('admin.dashboard') }}"><i class="fas fa-fire"></i>
                        <span>Dashboard</span></a>
                </li>
            @endcan
            @canany([
                'Post Category View',
                'Post Category Create',
                'Post Category Edit',
                'Post Tag View',
                'Post Tag
                Create',
                'Post Tag Edit',
                'Post Tag Delete',
                'Post View',
                'Post Create',
                'Post Edit',
                'Post Delete',
                'Post
                Detail',
                ])
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link has-dropdown"><i class="fas fa-fw fa-blog"></i>
                        <span>Artikel</span></a>
                    <ul class="dropdown-menu">
                        @can('Post Category View')
                            <li><a href="{{ route('admin.post-categories.index') }}">Kategori</a></li>
                        @endcan
                        @can('Post Tag View')
                            <li><a href="{{ route('admin.post-tags.index') }}">Tag</a></li>
                        @endcan
                        @can('Post View')
                            <li><a href="{{ route('admin.posts.index') }}">Artikel</a></li>
                        @endcan
                    </ul>
                </li>
            @endcanany



            @canany([
                'Program Category View',
                'Program Category Create',
                'Program Category Edit',
                'Program Category
                Delete',
                'Program View',
                'Program Create',
                'Program Edit',
                'Program Delete',
                'Program Detail',
                ])
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link has-dropdown"><i class="fas fa-fw fa-database"></i>
                        <span>Program</span></a>
                    <ul class="dropdown-menu">
                        @can('Program Category View')
                            <li><a href="{{ route('admin.programs-categories.index') }}">Kategori</a></li>
                        @endcan
                        @can('Program View')
                            <li><a href="{{ route('admin.program.index') }}">Program</a></li>
                        @endcan
                    </ul>
                </li>
            @endcanany

            @can('Transaction View')
                <li>
                    <a class="nav-link" href="{{ route('admin.transactions.index') }}"><i class="fas fa-tags"></i>
                        <span>Transaksi</span></a>
                </li>
            @endcan

            @can('Withdrawal View')
                <li>
                    <a class="nav-link" href="{{ route('admin.withdrawals.index') }}"><i class="fas fa-tags"></i>
                        <span>Penarikan Dana</span></a>
                </li>
            @endcan

            @canany(['Payment View', 'Slider View', 'Social Media View'])
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link has-dropdown"><i class="fas fa-fw fa-database"></i>
                        <span>Master Data</span></a>
                    <ul class="dropdown-menu">
                        @can('Payment View')
                            <li><a href="{{ route('admin.payments.index') }}">Metode Pembayaran</a></li>
                        @endcan
                        @can('Slider View')
                            <li><a href="{{ route('admin.sliders.index') }}">Slider</a></li>
                        @endcan
                        @can('Social Media View')
                            <li><a href="{{ route('admin.socmeds.index') }}">Sosial Media</a></li>
                        @endcan
                    </ul>
                </li>
            @endcanany

            @canany(['Permission View', 'User View', 'Role View'])
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link has-dropdown"><i class="fas fa-fw fa-database"></i>
                        <span>Manajemen User</span></a>
                    <ul class="dropdown-menu">
                        @can('Role View')
                            <li><a href="{{ route('admin.roles.index') }}">Role</a></li>
                        @endcan
                        @can('Permission View')
                            <li><a href="{{ route('admin.permissions.index') }}">Hak Akses</a></li>
                        @endcan
                        @can('User View')
                            <li><a href="{{ route('admin.users.index') }}">User</a></li>
                        @endcan
                    </ul>
                </li>
            @endcanany
            @can('Trash View')
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link has-dropdown"><i class="fas fa-fw fa-trash"></i>
                        <span>Keranjang Sampah</span></a>
                    <ul class="dropdown-menu">
                        <li><a href="{{ route('admin.posts.trash') }}">Artikel</a></li>
                        <li><a href="{{ route('admin.program.trash') }}">Program</a></li>
                        <li><a href="{{ route('admin.transactions.trash') }}">Transaksi</a></li>
                        <li><a href="{{ route('admin.users.trash') }}">User</a></li>
                    </ul>
                </li>
            @endcan
            @can('Setting View')
                <li>
                    <a class="nav-link" href="{{ route('admin.settings.index') }}"><i class="fas fa-cog"></i>
                        <span>Pengaturan Web</span></a>
                </li>
            @endcan
            {{--
            @can('Sitemap View')
                <li>
                    <a class="nav-link" href=""><i class="fas fa-sitemap"></i>
                        <span>Perbaharui Sitemap</span></a>
                </li>
            @endcan --}}
        </ul>

    </aside>
</div>
