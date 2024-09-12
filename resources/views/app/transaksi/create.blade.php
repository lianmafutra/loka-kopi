@extends('admin.layouts.master')
@push('css')
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }} ">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/flatpicker/flatpickr.min.css') }}">

    <style>



    </style>
@endpush
@section('header')
    <x-header title="Input Data Transaksi" back-button="true"></x-header>
@endsection
@section('content')
    <form id="form_sample" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-lg-8 col-sm-12">
                @csrf
                @method('POST')
                <div class="card">
                    <div class="card-body">

                        {{--
               <x-input label="Judul" id="nama" required /> --}}
                        <table class="table table-bordered"id="products-table">
                            <thead>
                                <tr>
                                    <th>Produk</th>
                                    <th>Jumlah</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td >
                                        <select data-placeholder="Pilih Produk"  style="width: 100%" name="products[0][id]" class="product-select" required>
                                            <option value="">Pilih Produk</option>
                                            @foreach ($products as $product)
                                                <option value="{{ $product->id }}">{{ $product->nama }}</option>
                                            @endforeach
                                        </select>
                                    </td>
                               

                                    <td><input type="number" name="products[0][quantity]" class="form-control" required /></td>
                                    <td><button type="button" class="btn btn-danger remove-row remove-tr">Hapus</button></td>
                                </tr>
                            </tbody>
                        </table>


                    </div>

                    <div class="card-footer">
                        <div style="gap:8px;" class="d-flex">
                            <a href="{{ route('master-data.slider.index') }}" type="button"
                                class="btn btn-secondary">Kembali</a>

                            <button type="button" class="btn btn-warning" id="add-row">Add Row</button>
                            <button type="submit" class="btn btn-primary">Simpan</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
@endsection
@push('js')
    <script src="{{ asset('plugins/select2/js/select2.full.min.js') }}"></script>


    <script>
        $(function() {




          

            $('#form_sample').submit(function(e) {
                e.preventDefault();
                const formData = new FormData(this);
                $.ajax({
                    type: 'POST',
                    url: route('transaksi.store'),
                    data: formData,
                    contentType: false,
                    processData: false,
                    dataType: 'json',
                    beforeSend: function() {
                        _showLoading()
                    },
                    success: (response) => {
                        if (response) {
                            Swal.fire({
                                icon: 'success',
                                title: response.message,
                                showCancelButton: true,
                                allowEscapeKey: false,
                                showCancelButton: false,
                                allowOutsideClick: false,
                            }).then((result) => {
                                window.location.replace(route(
                                    'transaksi.index'))
                            })
                        }
                    },
                    error: function(response) {
                        _showError(response)
                    }
                })
            })



            $('.product-select').select2({
               theme: 'bootstrap4',
            });
     
            $('#add-row').click(function() {
                var rowCount = $('#products-table tbody tr').length;
                var newRow = `
        <tr>
            <td>
                <select data-placeholder="Pilih Produk" style="width: 100%" name="products[${rowCount}][id]" class="product-select" required>
                    <option value="">Pilih Produk</option>
                    @foreach ($products as $product)
                        <option value="{{ $product->id }}">{{ $product->nama }}</option>
                    @endforeach
                </select>
            </td>
            <td><input type="number"  class="form-control" name="products[${rowCount}][quantity]" required></td>


            <td><button type="button" class="btn btn-danger remove-row">Hapus</button></td>
        </tr>`;
                $('#products-table tbody').append(newRow);
                $('.product-select').select2(); // Reinitialize select2 for new rows
            });

            $(document).on('click', '.remove-row', function() {
                $(this).closest('tr').remove();
            });
        })
    </script>
@endpush
