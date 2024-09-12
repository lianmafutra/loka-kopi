@extends('admin.layouts.master')
@push('css')
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('template/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }} ">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <style>
    </style>
@endpush
@section('header')
    <x-header title="Transaksi Loka"></x-header>
@endsection
@section('content')
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-md-3">
                        <x-select2 id="rentang_waktu" label="" required="false" placeholder="Pilih Rentang Waktu">
                            <option value="hari_ini">Hari Ini</option>
                            <option value="minggu_ini">Minggu Ini</option>
                            <option value="bulan_ini">Bulan Ini</option>
                            <option value="semua">Semua Transaksi</option>
                        </x-select2>
                    </div>
                    <div class="col-md-3">
                        <x-select2 id="select_produk" label=" " required="false" placeholder="Pilih Produk">
                            @foreach ($produk as $item)
                                <option value="{{ $item->id }}">{{ $item?->nama }}</option>
                            @endforeach
                        </x-select2>
                    </div>
                    <div class="col-md-3">
                        <div style="margin-top:22px; display: flex; gap: 10px;">
                            <button id="btn_filter" type="button" class="btn btn-primary">
                                <i class="mr-1 fas fa-filter nav-icon"></i> Filter
                            </button>
                            <button id="btn_reset" type="button" class="btn btn-secondary">
                                <i class="mr-1 fas fa-redo nav-icon"></i> Reset
                            </button>
                        </div>
                    </div>
                    <div class="col-md-3" >
                     <div style="margin-top:22px; display: flex; justify-content: flex-end; gap: 10px;">
                         <a href="{{ route('transaksi.create') }}" id="btn_input_transaksi" type="button" class="btn btn-primary">
                             <i class="mr-1 fas fa-plus nav-icon"></i> Input Transaksi
                         </a>
                     </div>
                 </div>

                </div>
            </div>
            <div class="card-body">
                <x-datatable id="datatable" :th="['No', 'Penginput', 'Produk', 'Jumlah', 'Transaksi', 'Lokasi', 'Created At', 'Aksi']" style="width: 100%"></x-datatable>
            </div>
        </div>
    </div>
@endsection
@push('js')
    <script src="{{ asset('template/admin/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('template/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('plugins/select2/js/select2.full.min.js') }}"></script>
    <script>
        $('.select2bs4').select2({
            theme: 'bootstrap4',
            allowClear: true
        })
        let datatable = $("#datatable").DataTable({
            serverSide: true,
            processing: true,
            searching: true,
            lengthChange: true,
            paging: true,
            info: true,
            ordering: true,
            aaSorting: [],
            order: [6, 'desc'],
            scrollX: true,
            ajax: {
                url: route('transaksi.index'),
                data: function(e) {
                    e.rentang_waktu = $('#rentang_waktu').val(),
                        e.select_produk = $('#select_produk').val()
                }
            },
            columns: [{
                    data: "DT_RowIndex",
                    orderable: false,
                    searchable: false,
                    width: '1%'
                },
                {
                    data: 'penginput',
                    name: 'penginput',
                    orderable: false,
                    searchable: false
                },
                {
                    data: 'produk_nama',
                    name: 'produk_nama',
                    orderable: true,
                    searchable: true
                },
                {
                    data: 'jumlah',
                    name: 'jumlah',
                    orderable: true,
                    searchable: true
                },
                {
                    data: 'tgl_transaksi',
                    name: 'tgl_transaksi',
                    orderable: true,
                    searchable: true
                },
                {
                    data: 'lokasi',
                    name: 'lokasi',
                    orderable: true,
                    searchable: true
                },
                {
                    data: 'created_at',
                    name: 'created_at',
                    orderable: true,
                    searchable: false
                },
                {
                    data: "action",
                    width: '15%',
                    orderable: false,
                    searchable: false,
                },
            ]
        })


        $('#btn_filter').click(function(e) {
            e.preventDefault();
            datatable.ajax.reload()
        });


      //   $('#btn_input_transaksi').click(function(e) {
      //       e.preventDefault();
           
      //   });


        $('#btn_reset').click(function(e) {
            e.preventDefault();
            $('#rentang_waktu').val(null).trigger('change');
            $('#select_produk').val(null).trigger('change');
            datatable.ajax.reload()
        });

        $('#datatable').on('click', '.btn_hapus', function(e) {
            let data = $(this).attr('data-hapus');
            Swal.fire({
                title: 'Apakah anda yakin ingin menghapus data ?',
                text: data,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ya, Hapus',
                cancelButtonText: 'Batal'
            }).then((result) => {
                if (result.isConfirmed) {
                    $(this).find('#form-delete').submit();
                }
            })
        })
        $('#datatable').on('click', '.btn_delete', function(e) {
            e.preventDefault()
            Swal.fire({
                title: 'Are you sure, you want to delete this data ?',
                text: $(this).attr('data-action'),
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#3085d6 ',
                confirmButtonText: 'Yes, Delete'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            _method: 'DELETE'
                        },
                        url: $(this).attr('data-url'),
                        beforeSend: function() {
                            _showLoading()
                        },
                        success: (response) => {
                            datatable.ajax.reload()
                            _alertSuccess(response.message)
                        },
                        error: function(response) {
                            _showError(response)
                        }
                    })
                }
            })
        })
    </script>
@endpush
