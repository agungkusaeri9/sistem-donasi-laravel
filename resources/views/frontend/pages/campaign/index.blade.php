@extends('frontend.layouts.app')
@section('content')
    <div class="services-area">
        <div class="container">
            <!-- Section-tittle -->
            <div class="row d-flex justify-content-center">
                <div class="col-lg-8">
                    <div class="section-tittle text-center mb-80">
                        <h2>
                            @if ($category)
                                Campaign Kategori "{{ $category->name }}"
                            @else
                                Semua Campaign
                            @endif
                        </h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section class="campaign">
        <div class="container">
            <div class="row mb-2 mt-4">
                <div class="col-md-8">
                    <a href="{{ route('campaign.index') }}" class="text-decoration-none">
                        <span
                            class="btn btn-sm py-4 btn-outline-dark @if (!$category) active @endif p-2 ">Semua</span>
                    </a>
                    @foreach ($categories as $cat)
                        <a href="{{ route('campaign.category', $cat->slug) }}" class="text-decoration-none">
                            <span
                                class="btn py-4 btn-sm btn-outline-dark p-2 @if ($category && $category->id == $cat->id) active @endif">{{ $cat->name }}</span>
                        </a>
                    @endforeach
                </div>
                <div class="col-md-4">
                    <form action="{{ route('campaign.search') }}" method="get">
                        <div class="input-group input-group-lg mb-3">
                            <input type="text" class="form-control small rounded- input-group-lg" name="keyword"
                                value="{{ $keyword }}" placeholder="Cari Keyword..." style="font-size: 16px">
                            <span class="" id="basic-addon2">
                                <button class="btn btn-sm py-4">Cari</button>
                            </span>
                        </div>

                    </form>
                </div>
            </div>
            <div class="row">
                @forelse ($items as $item)
                    <div class="col-md-4 col-6 mb-4">
                        <a href="{{ route('campaign.show', $item->slug) }}" class="text-decoration-none text-dark">
                            <div class="card card-campaign border-0">
                                <div class="card-body">
                                    <img src="{{ $item->image() }}" alt="" class="img-fluid" />
                                    <h6 class="title mt-2">
                                        {{ $item->name }}
                                    </h6>
                                    <div class="progress mb-2">
                                        <div class="progress-bar" style="width: {{ $item->percent() }}%" role="progressbar"
                                            aria-label="Basic example" aria-valuenow="{{ $item->percent() }}"
                                            aria-valuemin="0" aria-valuemax="100">

                                        </div>
                                    </div>
                                    <span class="nominal">Rp. {{ number_format($item->donation_target) }}</span>
                                    <div class="d-flex justify-content-between">
                                        <span class="small">{{ $item->transactions_success_count }} Donatur</span>
                                        <span class="small">{{ $item->count_day() }} Hari Lagi</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                @empty
                    <div class="col-md-12">
                        <p class="text-center">Campain tidak ditemukan!</p>
                    </div>
                @endforelse
            </div>

            {{ $items->appends(request()->all())->links('pagination::custom') }}
        </div>
    </section>
@endsection
