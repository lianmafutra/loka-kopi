@extends('admin.layouts.master')
@push('css')
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }} ">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('template/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <style>
    </style>
@endpush
@section('header')
    <x-header title="Edit Data Gerobak" back-button="true"></x-header>
@endsection
@section('content')
    <div class="col-lg-8 col-sm-12">
        <form id="form_sample" method="post">
            @csrf
            <div class="card">
                <div class="card-header">
                    Data Gerobak
                </div>
                <div class="card-body">
                    <x-input label="Nama Gerobak" id="nama" required />

                    <x-select2 required id="barista_id" label="Barista" placeholder="Pilih Barista">
                        @foreach ($barista as $item)
                            <option value="{{ $item->id }}">{{ $item?->user?->name }}</option>
                        @endforeach
                    </x-select2>


                </div>
                <div class="card-footer">
                    <div style="gap:8px;" class="d-flex">
                        <a href="{{ route('master-data.gerobak.index') }}" type="button"
                            class="btn btn-secondary">Kembali</a>
                        <button type="submit" class="btn_submit btn btn-primary">Update</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="col-lg-8 col-sm-12">

        <div class="card">
            <div class="card-header">
                Data Stok Produk
            </div>
            <div class="card-body">

                <x-datatable id="datatable" :th="['No', 'Foto', 'Nama', 'Harga', 'Jumlah Stok', 'Aksi']" style="width: 100%"></x-datatable>

            </div>

        </div>

    </div>
    @include('app.master.gerobak.modal-edit-stok')
@endsection
@push('js')
    <script src="{{ asset('plugins/jquery.mask.min.js') }}"></script>
    <script src="{{ asset('plugins/select2/js/select2.full.min.js') }}"></script>

    <script src="{{ asset('plugins/flatpicker/flatpickr.min.js') }}"></script>
    <script src="{{ asset('plugins/flatpicker/id.min.js') }}"></script>

    <script src="{{ asset('template/admin/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('template/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script>
        $(function() {

            let datatable = $("#datatable").DataTable({
                serverSide: true,
                processing: true,
                searching: false,
                lengthChange: false,
                paging: false,
                info: false,
                ordering: true,
                aaSorting: [],
                order: [3, 'desc'],
                scrollX: true,

                ajax: route('master-data.gerobak.edit', @json($gerobak->id)),
                columns: [{
                        data: "DT_RowIndex",
                        orderable: false,
                        searchable: false,
                        width: '1%'
                    },
                    {
                        data: 'foto',
                        name: 'foto',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'nama',
                        name: 'nama',
                        orderable: true,
                        searchable: true
                    },


                    {
                        data: 'harga_format',
                        name: 'harga_format',
                        orderable: true,
                        searchable: true
                    },

                    {
                        data: 'stok',
                        name: 'stok',
                        orderable: true,
                        searchable: true
                    },

                    {
                        data: 'action',
                        name: 'action',
                        orderable: true,
                        searchable: true
                    },

                ]
            })

            $('#datatable').on('click', '.btn-edit', function(e) {

                e.preventDefault()
                $('.teks_info_update_stok').text('Keterangan stok : ');
                let data = $(this).attr('data-url');
                let produk_id = $(this).attr('data-id');
               
                $('#modal_edit_stok').modal('show');
                _clearInput()
                $.ajax({
                    type: "GET",
                    url: route('produk.gerobak.detail'),
                    data: {
                        gerobak_id: @json($gerobak?->id),
                        produk_id: produk_id
                    },
                    dataType: "json",
                    success: function(response) {
                        console.log(response)
                        $('#nama_produk').val(response.data.nama)
                        $('#gerobak_stok_id').val(response.data.gerobak_stoks.id)
                        $('#nama_gerobak').val(response.data.gerobak_stoks.gerobak.nama)
                        $('#stok_sekarang').val(response.data.gerobak_stoks.jumlah_stok)
                    }
                });
            })
            function updateInfo() {
                // Ambil nilai dari input
                var stokSekarangValue = parseInt($('#stok_sekarang').val()) || 0;
                var stokUpdateValue = parseInt($('#stok_update').val()) || 0;
                
                // Hitung selisih
                var selisih = stokUpdateValue + stokSekarangValue;
                
                // Format selisih untuk tampilan
                var formattedSelisih = selisih >= 0 ? `${selisih}` : `${selisih}`;
                
                // Update teks info
                $('.teks_info_update_stok').text('Keterangan stok : ' + formattedSelisih);
            }

            // Event listener untuk input perubahan stok
            $('#stok_update').on('input', function() {
                updateInfo(); // Panggil fungsi updateInfo saat input berubah
            });

            // Panggil updateInfo saat halaman dimuat, jika diperlukan
            updateInfo();

            $('.select2bs4').select2({
                theme: 'bootstrap4',
            })


            $('#form_edit_stok').submit(function(e) {
                e.preventDefault();
                const formData = new FormData(this);
          
                formData.append('_method', 'PUT');
                $.ajax({
                    type: 'POST',
                    url: route('produk.gerobak.update.stok'),
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
                              $('#modal_edit_stok').modal('hide');
                              datatable.ajax.reload()
                            })
                        }
                    },
                    error: function(response) {
                        _showError(response)
                    }
                })
            })


            $('#form_sample').submit(function(e) {
                e.preventDefault();
                const formData = new FormData(this);
                formData.append('_method', 'PUT');
                $.ajax({
                    type: 'POST',
                    url: route('master-data.gerobak.update', @json($gerobak->id)),
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
                                    'master-data.gerobak.index'))
                            })
                        }
                    },
                    error: function(response) {
                        _showError(response)
                    }
                })
            })


            $('#nama').val(@json($gerobak?->nama))
            $('#barista_id').val(@json($gerobak?->barista?->id)).change()

        })
    </script>
@endpush
