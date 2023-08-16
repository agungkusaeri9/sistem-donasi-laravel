<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>{{ $title ?? '-' }}</title>
    <link rel="stylesheet" href="{{ asset('assets/frontend/css/bootstrap.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/frontend/css/style.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/fontawesome-free/css/all.min.css') }}">
    <style>
        .code {
            font-size: 260px
        }

        @media only screen and (max-width: 500px) {
            .code {
                font-size: 160px
            }
        }
    </style>
</head>

<div class="container mt-5">
    <div class="row justify-content-center" style="margin-top: 2vh">
        <div class="col-md-5 mt-5">
            <div class="text-center ">
                <div class="code">
                    500
                </div>
                <p class="fs-3"> <span class="text-danger">Opps!</span> Something went wrong :().</p>
                <p class="lead">
                  Have you tried turning it off and on again?
                </p>
                <a href="{{ route('home') }}" class="btn btn-primary">Go Home</a>
            </div>

        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
</script>
<script src="{{ asset('assets/frontend/js/popper.min.js') }}"></script>
{{-- <script src="{{ asset('assets/frontend/js/bootstrap.bundle.min.js') }}"></script> --}}
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>
