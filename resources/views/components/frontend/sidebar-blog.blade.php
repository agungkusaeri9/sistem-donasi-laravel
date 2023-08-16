<div class="blog_right_sidebar">
    <aside class="single_sidebar_widget search_widget">
        <form action="{{ route('artikel.search') }}" method="GET">
            <div class="form-group">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder='Search Keyword' onfocus="this.placeholder = ''"
                        onblur="this.placeholder = 'Search Keyword'" name="keyword" value="{{ request('keyword') }}">
                    <div class="input-group-append">
                        <button class="btns" type="button"><i class="ti-search"></i></button>
                    </div>
                </div>
            </div>
            <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" type="submit">Search</button>
        </form>
    </aside>

    <aside class="single_sidebar_widget popular_post_widget">
        <h3 class="widget_title">Berita Terbaru</h3>
        @foreach ($posts_latest as $latest)
            <div class="media post_item">
                <img src="{{ $latest->image }}" alt="post" class="img-fluid" style="max-width:120px">
                <div class="media-body">
                    <a href="{{ route('artikel.show', $latest->slug) }}">
                        <h3>{{ \Str::limit($latest->title, 60) }}</h3>
                    </a>
                    <p>{{ $latest->created_at->translatedFormat('d F Y') }}</p>
                </div>
            </div>
        @endforeach
    </aside>

</div>
