@extends('frontend.layouts.app')
@section('content')
    <!-- Slider Area Start-->
    <div class="services-area">
        <div class="container">
            <!-- Section-tittle -->
            <div class="row d-flex justify-content-center">
                <div class="col-lg-8">
                    <div class="section-tittle text-center mb-80">
                        <h2>
                            @if (request('keyword'))
                                Hasil pencarian "{{ request('keyword') }}"
                            @else
                                Blog
                            @endif
                        </h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Slider Area End-->

    <!--================Blog Area =================-->
    <section class="blog_area section-paddingr">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                        @forelse ($posts as $post)
                            <article class="blog_item">
                                <div class="blog_item_img">
                                    <img class="card-img rounded-0" src="{{ $post->image }}" alt="">
                                    <a href="#" class="blog_item_date">
                                        <h3>{{ $post->created_at->translatedFormat('d') }}</h3>
                                        <p>{{ $post->created_at->translatedFormat('M') }}</p>
                                    </a>
                                </div>

                                <div class="blog_details">
                                    <a class="d-inline-block" href="{{ route('artikel.show', $post->slug) }}">
                                        <h2>{{ $post->title }}</h2>

                                    </a>
                                    <p>{{ $post->meta_description }}</p>
                                    <ul class="blog-info-link">
                                        <li><a href="#"><i class="fa fa-user"></i> {{ $post->user->name }}</a></li>
                                    </ul>
                                </div>
                            </article>
                        @empty
                            <p class="text-center">Artikel tidak ditemukan!</p>
                        @endforelse

                        {{ $posts->appends(request()->all())->links('pagination::custom') }}
                    </div>
                </div>
                <div class="col-lg-4">
                    <x-Frontend.SidebarBlog />
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->
@endsection
