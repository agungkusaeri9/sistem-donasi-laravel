<!DOCTYPE HTML>
<html>

<x-Frontend.Head :title="$title ?? '-'"></x-Frontend.Head>

<body>
    <!-- Preloader Start -->
    <x-Frontend.Preloader />
    <!-- Preloader Start -->
    <x-Frontend.Navbar></x-Frontend.Navbar>

    <div style="margin-top: 80px;min-height:500px;">
        @yield('content')
    </div>

    <!-- ======= Footer ======= -->

    <x-Frontend.Footer></x-Frontend.Footer>


</body>

</html>
