@extends('frontend.layouts.app')
@section('content')
    <div class="services-area">
        <div class="container">

            <!-- Section-tittle -->
            <div class="row d-flex justify-content-center">
                <div class="col-lg-8">
                    <div class="section-tittle text-center mb-80">
                        <h2>Detail Berita</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Slider Area End-->
    <!--================Blog Area =================-->
    <section class="blog_area single-post-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 posts-list">
                    <div class="single-post">
                        <div class="feature-img">
                            <img class="img-fluid" src="{{ $post->image }}" alt="">
                        </div>
                        <div class="blog_details">
                            <h2>{{ $post->title }}
                            </h2>
                            <ul class="blog-info-link mt-3 mb-4">
                                <li><a href="#"><i class="fa fa-user"></i>{{ $post->user->name }}</a></li>
                            </ul>
                            {!! $post->description !!}
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <x-Frontend.SidebarBlog />
                </div>
            </div>
        </div>
    </section>
    <!--================ Blog Area end =================-->
@endsection
