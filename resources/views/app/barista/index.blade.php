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
    <x-header title="Info Barista"></x-header>
@endsection
@section('content')
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header">
               <div class="col-2">
                  <x-select2 id="select_barista"  label="" required="false" placeholder="Filter Barista">
                     @foreach ($barista as $item)
                     <option value="{{ $item->id }}">{{ $item?->user?->name }}</option>
                 @endforeach
                  </x-select2>
              </div>
            </div>
            <div class="card-body">
               <x-datatable id="datatable" :th="['No', 'Foto', 'Barista','Lokasi Sebelum', 'Lokasi Terkini', 'Waktu Update']" style="width: 100%">
               </x-datatable>
               
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
            order: [3, 'desc'],
            scrollX: true,
            ajax: {
                url: route('info.barista.index'),
                data: function(e) {
                    e.select_barista = $('#select_barista').val()
                }
            },
            columns: [{
                    data: "DT_RowIndex",
                    orderable: false,
                    searchable: false,
                    width: '1%'
                },
                {
                data: "foto", // Assuming you have a 'foto' field
                name: 'foto',
                  width: '5%'
            },
            {
                data: "barista",
                name: 'barista'
            },
            {
                data: "lokasi_terkini_before",
                name: 'lokasi_terkini_before'
            },
            {
                data: "lokasi_terkini",
                name: 'lokasi_terkini'
            },
            {
                data: "created_at",
                name: 'created_at'
            }
            ]
        })


        $('#select_barista').on('change', function() {
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
