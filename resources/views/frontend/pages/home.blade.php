@extends('frontend.layouts.app')
@section('content')
    <!-- Slider Area Start-->
    <div class="slider-area ">
        <div class="slider-active">
            @foreach ($sliders as $slider)
                <div class="single-slider slider-height slider-padding sky-blue d-flex align-items-center">
                    <div class="container">
                        <div class="row d-flex align-items-center">
                            <div class="col-lg-6 col-md-9 ">
                                <div class="hero__caption">
                                    <span data-animation="fadeInUp" data-delay=".4s"></span>
                                    <h1 data-animation="fadeInUp" data-delay=".6s" style="font-size:32px">
                                        {{ $slider->title }}</h1>
                                    <p data-animation="fadeInUp" data-delay=".8s">{{ $slider->description }}
                                    </p>
                                    <!-- Slider btn -->
                                    <div class="slider-btns">
                                        <!-- Hero-btn -->
                                        <a data-animation="fadeInLeft" data-delay="1.0s"
                                            href="{{ route('donate.payment', $slider->program->slug) }}"
                                            class="btn radius-btn">Donasi Sekarang</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 align-self-start">
                                <div class="hero__img d-none d-lg-block f-left" data-animation="fadeInRight"
                                    data-delay="1s">
                                    <img src="{{ $slider->image() }}" alt="" class="img-fluid"
                                        style="max-height:220px">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
    <!-- Slider Area End -->

    <div class="container">
        @foreach ($campaign_categories as $campaign_category)
            <div class="row">
                <div class="col-12">
                    <h5>{{ $campaign_category->name }}</h5>
                </div>
            </div>
            <div class="row">
                @forelse ($campaign_category->programs->take(3) as $program)
                    <div class="col-md-3 col-6 mb-4">
                        <a href="{{ route('campaign.show', $program->slug) }}" class="text-decoration-none text-dark">
                            <div class="card card-campaign border-0">
                                <div class="card-body">
                                    <img src="{{ $program->image() }}" alt="" class="img-fluid" />
                                    <h6 class="title mt-2">
                                        {{ $program->name }}
                                    </h6>
                                    <div class="progress mb-2">
                                        <div class="progress-bar" style="width: {{ $program->percent() }}%"
                                            role="progressbar" aria-label="Basic example"
                                            aria-valuenow="{{ $program->percent() }}" aria-valuemin="0" aria-valuemax="100">

                                        </div>
                                    </div>
                                    <span class="nominal">Rp. {{ number_format($program->donation_target) }}</span>
                                    <div class="d-flex justify-content-between">
                                        <span class="small">{{ $program->transactions_success_count }} Donatur</span>
                                        <span class="small">{{ $program->count_day() }} Hari Lagi</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                @empty
                    <div class="col-md-12">
                        <p class="text-center">Tidak Ada Data</p>
                    </div>
                @endforelse
            </div>
        @endforeach
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h5>Berita Terbaru</h5>
            </div>
            @foreach ($posts as $post)
                <div class="col-md-3 col-6 mb-4">
                    <a href="{{ route('artikel.show', $post->slug) }}" class="text-decoration-none text-dark">
                        <div class="card card-campaign border-0">
                            <div class="card-body">
                                <img src="{{ $post->image }}" alt="" class="img-fluid"
                                    style="max-height: 160px" />
                                <h6 class="title mt-2">
                                    {{ $post->title }}
                                </h6>
                            </div>
                        </div>
                    </a>
                </div>
            @endforeach
        </div>
    </div>
@endsection
