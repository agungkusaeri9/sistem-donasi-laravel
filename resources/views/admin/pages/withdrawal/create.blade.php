@extends('admin.layouts.app')
@section('content')
    <section class="section">
        <div class="section-header">
            <h1>Buat Penarikan Dana</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">Dashboard</a></div>
                <div class="breadcrumb-item active"><a href="{{ route('admin.withdrawals.index') }}">Data Penarikan Dana</a>
                </div>
                <div class="breadcrumb-item">Buat Penarikan Dana</div>
            </div>
        </div>
        <div class="section-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="{{ route('admin.withdrawals.store') }}" method="post"
                                enctype="multipart/form-data" id="myForm">
                                @csrf
                                <div class="form-group">
                                    <label for="program_id">Program</label>
                                    <select name="program_id" id="program_id"
                                        class="form-control select2 @error('program_id') is-invalid @enderror">
                                        <option value="" selected disabled>Pilih Program</option>
                                        @foreach ($programs as $program)
                                            <option @selected($program->id == old('program_id')) value="{{ $program->id }}">
                                                {{ $program->name }}</option>
                                        @endforeach
                                    </select>
                                    @error('program_id')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <div class='form-group mb-3'>
                                    <label for='manual_payment_amount' class='mb-2'>Nominal Pembayaran Manual</label>
                                    <input type="text" name="manual_payment_amount" id="manual_payment_amount" hidden>
                                    <input type='text'
                                        class='form-control @error('manual_payment_amount') is-invalid @enderror'
                                        value='{{ old('manual_payment_amount') }}' id="manual_payment_amount2" readonly>
                                    @error('manual_payment_amount')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <div class='form-group mb-3'>
                                    <label for='automatic_payment_amount' class='mb-2'>Nominal Pembayaran Otomatis
                                        (Midtrans)</label>
                                    <input type="text" name="automatic_payment_amount" id="automatic_payment_amount"
                                        hidden>
                                    <input type='text'
                                        class='form-control @error('automatic_payment_amount') is-invalid @enderror'
                                        value='{{ old('automatic_payment_amount') }}' readonly
                                        id="automatic_payment_amount2">
                                    @error('automatic_payment_amount')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <div class='form-group mb-3'>
                                    <label for='amount_total' class='mb-2'>Total Nominal</label>
                                    <input type="text" name="amount_total" id="amount_total" hidden>
                                    <input type='text' class='form-control @error('amount_total') is-invalid @enderror'
                                        value='{{ old('amount_total') }}' id="amount_total2" readonly>

                                    @error('amount_total')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <div class='form-group mb-3'>
                                    <label for='admin_fee' class='mb-2'>Biaya Admin</label>
                                    <input type='text' class='form-control @error('admin_fee') is-invalid @enderror'
                                        value='{{ old('admin_fee') }}' id="admin_fee" readonly>

                                    @error('admin_fee')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <div class='form-group mb-3'>
                                    <label for='dicairkan' class='mb-2'>Total Dicairkan</label>
                                    <input type='text' class='form-control @error('dicairkan') is-invalid @enderror'
                                        value='{{ old('dicairkan') }}' id="dicairkan" readonly>

                                    @error('dicairkan')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <div class='form-group mb-3'>
                                    <label for='bank_name' class='mb-2'>Nama Bank <span
                                            class='text-danger'>*</span></label>
                                    <input type='text' name='bank_name' id='bank_name'
                                        class='form-control @error('bank_name') is-invalid @enderror'
                                        value='{{ old('bank_name') }}'>
                                    @error('bank_name')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <div class='form-group mb-3'>
                                    <label for='bank_number' class='mb-2'>Nomor Rekening <span
                                            class='text-danger'>*</span></label>
                                    <input type='number' name='bank_number' id='bank_number'
                                        class='form-control @error('bank_number') is-invalid @enderror'
                                        value='{{ old('bank_number') }}'>
                                    @error('bank_number')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <div class='form-group mb-3'>
                                    <label for='bank_owner' class='mb-2'>Pemilik <span
                                            class='text-danger'>*</span></label>
                                    <input type='text' name='bank_owner' id='bank_owner'
                                        class='form-control @error('bank_owner') is-invalid @enderror'
                                        value='{{ old('bank_owner') }}'>
                                    @error('bank_owner')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <div class='form-group mb-3'>
                                    <label for='proof' class='mb-2'>Bukti Transfer <span
                                            class='text-danger'>*</span></label>
                                    <input type='file' name='proof' id='proof'
                                        class='form-control @error('proof') is-invalid @enderror'
                                        value='{{ old('proof') }}'>
                                    @error('proof')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <button type="button" class="btn btn-block btn-primary btnSubmit"><i
                                            class="fas fa-plus"></i>
                                        Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/plugin/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/plugin/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/sweetalert2/sweetalert2.all.min.js') }}">
    <link rel="stylesheet" href="{{ asset('assets/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css') }}">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
@endpush
@push('scripts')
    <script src="{{ asset('assets/plugin/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('assets/sweetalert2/sweetalert2.min.js') }}"></script>
    <script>
        $(function() {

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            function formatRupiah(angka) {
                return new Intl.NumberFormat('id-ID', {
                    style: 'currency',
                    currency: 'IDR',
                    minimumFractionDigits: 0
                }).format(angka);
            }

            $('.select2').select2({
                theme: 'bootstrap4'
            });

            $('#program_id').on('change', function() {
                let program_id = $(this).val();

                $.ajax({
                    url: '{{ route('admin.program.show-json') }}',
                    data: {
                        program_id
                    },
                    type: 'POST',
                    dataType: 'JSON',
                    success: function(response) {
                        console.log(response);
                        $('#manual_payment_amount').val(response.manual_payment_amount);
                        $('#automatic_payment_amount').val(response.automatic_payment_amount);
                        $('#amount_total').val(response.amount_total);
                        $('#admin_fee').val(formatRupiah(response.admin_fee));
                        $('#dicairkan').val(formatRupiah(response.dicairkan));

                        $('#manual_payment_amount2').val(formatRupiah(response
                            .manual_payment_amount));
                        $('#automatic_payment_amount2').val(formatRupiah(response
                            .automatic_payment_amount));
                        $('#amount_total2').val(formatRupiah(response.amount_total));
                    },
                    error: function(err) {
                        console.log(err);
                    }
                })
            })

            $('.btnSubmit').on('click', function() {
                Swal.fire({
                    title: 'Perhatian!',
                    text: `Penarikan dana yang telah dibuat tidak bisa diedit atau dihapus dan program tersebut dinyatakan selesai.`,
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Submit'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $('#myForm').submit();
                    }
                })
            })
        })
    </script>
@endpush
