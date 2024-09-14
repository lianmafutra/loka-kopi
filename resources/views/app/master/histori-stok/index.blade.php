@extends('admin.layouts.master')
@push('css')
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('template/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
@endpush
<style>
</style>
@section('header')
    <x-header title="Data Histori Penyesuaian/Perubahan Stok"></x-header>
@endsection
@section('content')
    <div class="col-lg-12">
        <div class="card">
            {{-- <div class="card-header">
                <a href="{{ route('master-data.gerobak.create') }}" id="btn_input_data" class="btn btn-sm btn-primary"><i
                        class="fas fa-plus"></i> Input
                    Data</a>
            </div> --}}
            <div class="card-body">
                <x-datatable id="datatable" :th="['No', 'produk', 'Catatan', 'Jumlah', 'Gerobak', 'Tanggal', 'Created By']" style="width: 100%"></x-datatable>
            </div>
        </div>
    </div>
@endsection
@push('js')
    <script src="{{ asset('template/admin/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('template/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script>
        let datatable = $("#datatable").DataTable({
            serverSide: true,
            processing: true,
            searching: true,
            lengthChange: true,
            paging: true,
            info: true,
            ordering: true,
            aaSorting: [],
            order: [1, 'asc'],
            scrollX: true,
            ajax: route('histori-stok.index'),
            columns: [{
                    data: "DT_RowIndex",
                    orderable: false,
                    searchable: false,
                    width: '1%'
                },
                {
                    data: 'produk_nama',
                    name: 'produk_nama',
                    orderable: true,
                    searchable: true
                },
                {
                    data: 'catatan',
                    name: 'catatan',
                    orderable: true,
                    searchable: true
                },
                {
                    data: 'jumlah',
                    name: 'jumlah',
                    orderable: true,
                    searchable: true,
                    render: function(data, type, row) {
                        // Check if data is a number
                        if (typeof data === 'number') {
                            if (data > 0) {
                                // If positive, add a "+" prefix and make it green
                                return '<span style="color: #329b32; font-size:16px !important; font-weight: bold">+' + data + '</span>';
                            } else if (data < 0) {
                                // If negative, leave "-" and make it red
                                return '<span style="color: red; font-size:16px !important; font-weight: bold">' + data + '</span>';
                            } else {
                                // If zero, return the number as is
                                return data;
                            }
                        }
                        return data; // Return original data for other types
                    }
                },
                {
                    data: 'gerobak_nama',
                    name: 'gerobak_nama',
                    orderable: true,
                    searchable: true
                },
                {
                    data: 'created_at',
                    name: 'created_at',
                    orderable: true,
                    searchable: true
                },
                {
                    data: 'user_nama',
                    name: 'user_nama',
                    orderable: true,
                    searchable: true
                },
            ]
        })
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
