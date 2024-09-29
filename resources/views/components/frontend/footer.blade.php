<footer>

    <!-- Footer Start-->
    <div class="footer-main bg-dark py-5">
        <div class="footer-area">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-3 col-md-4 col-sm-8">
                        <div class="single-footer-caption mb-30">
                            <!-- logo -->
                            <div class="footer-logo">
                                <a href="{{ route('home') }}">
                                    <img src="{{ $setting->image() }}" alt="" class="img-fluid"
                                        style="max-height: 60px"></a>
                            </div>
                            <div class="footer-tittle">
                                <div class="footer-pera">
                                    <p class="info1">
                                        {{ $setting->meta_description }}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-5">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4 class="text-light">Tautan Navigasi</h4>
                                <ul>
                                    <li><a href="{{ route('home') }}">Home</a></li>
                                    <li><a href="{{ route('about') }}">About</a></li>
                                    <li><a href="{{ route('campaign.index') }}">Campaign</a></li>
                                    <li><a href="{{ route('artikel.index') }}">Blog</a></li>
                                    <li><a href="{{ route('invoice.check') }}">Cek Invoice</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-7">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4 class="text-light">Metode Pembayaran</h4>
                                <div class="row">
                                    <div class="col-12 mx-0 mb-1">
                                        <div class="d-flex justify-content-between">
                                            <img src="{{ asset('assets/frontend/img/bni.png') }}" alt=""
                                                class="img-fluid">
                                            <img src="{{ asset('assets/frontend/img/bca.png') }}" alt=""
                                                class="img-fluid">
                                            <img src="{{ asset('assets/frontend/img/mandiri.png') }}" alt=""
                                                class="img-fluid">
                                            <img src="{{ asset('assets/frontend/img/alfamart.png') }}" alt=""
                                                class="img-fluid">
                                            <img src="{{ asset('assets/frontend/img/indomaret.png') }}" alt=""
                                                class="img-fluid">
                                            <img src="{{ asset('assets/frontend/img/shopepay.png') }}" alt=""
                                                class="img-fluid">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-8">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4 class="text-light">Sosial Media</h4>
                                <ul class="list-inline">
                                    @foreach ($socmeds as $socmed)
                                        <li class="list-inline-item pr-2">
                                            <a href="{{ $socmed->link }}">
                                                <img src="{{ $socmed->icon() }}" class="img-fluid imgSocmed"
                                                    alt="{{ $socmed->name }}" style="height: 30px">
                                            </a>
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Copy-Right -->
                <div class="row align-items-center">
                    <div class="col-xl-12 ">
                        <div class="text-center mt-3">
                            <p>
                                Copyright &copy;
                                <script>
                                    document.write(new Date().getFullYear());
                                </script> All rights reserved {{ $setting->author }}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End-->

</footer>
<!-- All JS Custom Plugins Link Here here -->
<script src="{{ asset('assets/frontend/js/vendor/modernizr-3.5.0.min.js') }}"></script>

<!-- Jquery, Popper, Bootstrap -->
<script src="{{ asset('assets/frontend/js/vendor/jquery-1.12.4.min.js') }}"></script>
<script src="{{ asset('assets/frontend/js/popper.min.js') }}"></script>
<script src="{{ asset('assets/frontend/js/bootstrap.min.js') }}"></script>
<!-- Jquery Mobile Menu -->
<script src="{{ asset('assets/frontend/js/jquery.slicknav.min.js') }}"></script>

<!-- Jquery Slick , Owl-Carousel Plugins -->
<script src="{{ asset('assets/frontend/js/owl.carousel.min.js') }}"></script>
<script src="{{ asset('assets/frontend/js/slick.min.js') }}"></script>
<!-- Date Picker -->
<script src="{{ asset('assets/frontend/js/gijgo.min.js') }}"></script>
<!-- One Page, Animated-HeadLin -->
<script src="{{ asset('assets/frontend/js/wow.min.js') }}"></script>
<script src="{{ asset('assets/frontend/js/animated.headline.js') }}"></script>
<script src="{{ asset('assets/frontend/js/jquery.magnific-popup.js') }}"></script>

<!-- Scrollup, nice-select, sticky -->
<script src="{{ asset('assets/frontend/js/jquery.scrollUp.min.js') }}"></script>
<script src="{{ asset('assets/frontend/js/jquery.nice-select.min.js') }}"></script>
<script src="{{ asset('assets/frontend/js/jquery.sticky.js') }}"></script>

<!-- contact js -->
<script src="{{ asset('assets/frontend/js/contact.js') }}"></script>
<script src="{{ asset('assets/frontend/js/jquery.form.js') }}"></script>
<script src="{{ asset('assets/frontend/js/jquery.validate.min.js') }}"></script>
<script src="{{ asset('assets/frontend/js/mail-script.js') }}"></script>
<script src="{{ asset('assets/frontend/js/jquery.ajaxchimp.min.js') }}"></script>

<!-- Jquery Plugins, main Jquery -->
<script src="{{ asset('assets/frontend/js/plugins.js') }}"></script>
<script src="{{ asset('assets/frontend/js/main.js') }}"></script>
@stack('scripts')
