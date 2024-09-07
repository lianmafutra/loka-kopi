@extends('admin.layouts.master')
@push('css')
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }} ">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/flatpicker/flatpickr.min.css') }}">
    <link rel="stylesheet" href="{{ asset('template/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('template/admin/plugins/summernote/summernote-bs4.min.css') }}">
    <style>
    </style>
@endpush
@section('header')
    <x-header title="Edit Data Barista" back-button="true"></x-header>
@endsection
@section('content')
    <div class="col-lg-8 col-sm-12">
      <form id="form_sample">
         @csrf
         <div class="card">
             <div class="card-body">
               <x-input label="Username Login" id="username" required />
                 <x-input label="Nama Lengkap" id="nama" required />
              
                 <x-select2 required id="jenkel" label="Jenis Kelamin" placeholder="Pilih Jenis Kelamin">
                     <option value="L">Laki-Laki</option>
                     <option value="P">Perempuan</option>
                 </x-select2>
                 <x-datepicker id="tgl_lahir" label="Tgl Lahir" required />
                 <x-datepicker id="tgl_registrasi" label="Tanggal Registrasi" required />
                 <x-textarea id="alamat" label="Alamat" placeholder="Alamat Tempat Tinggal" />
                 <x-input-phone id="kontak" required label="Nomor HP/ WhatsApp" placeholder="Nomor Telepon Aktif" />
               
             </div>
             <div class="card-footer">
                 <div style="gap:8px;" class="d-flex">
                     <a href="{{ route('master-data.barista.index') }}" type="button"
                         class="btn btn-secondary">Kembali</a>
                     <button type="submit" class="btn_submit btn btn-primary">Update</button>
                 </div>
             </div>
         </div>
     </form>
    </div>
@endsection
@push('js')
    {{-- filepond --}}
    {{-- masking input currency,date input --}}
    <script src="{{ asset('plugins/jquery.mask.min.js') }}"></script>
    <script src="{{ asset('plugins/select2/js/select2.full.min.js') }}"></script>
    {{-- flatcpiker format date input --}}
    <script src="{{ asset('plugins/flatpicker/flatpickr.min.js') }}"></script>
    <script src="{{ asset('plugins/flatpicker/id.min.js') }}"></script>

    {{-- password toggle show/hide --}}
    <script src="{{ asset('plugins/toggle-password.js') }}"></script>
    <script>
        $(function() {
            $('.select2bs4').select2({
                theme: 'bootstrap4',
            })

            const tgl_lahir = flatpickr("#tgl_lahir", {
                allowInput: true,
                locale: "id",
                dateFormat: "d/m/Y",
                defaultDate: ''
            });

            const tgl_registrasi = flatpickr("#tgl_registrasi", {
                allowInput: true,
                locale: "id",
                dateFormat: "d/m/Y",
                defaultDate: ''
            });
 
            $('#form_sample').submit(function(e) {
                e.preventDefault();
                const formData = new FormData(this);
                formData.append('_method', 'PUT');
                $.ajax({
                    type: 'POST',
                    url: route('master-data.barista.update', @json($barista->id)),
                   
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
                                window.location.replace(route('master-data.barista.index'))
                            })
                        }
                    },
                    error: function(response) {
                        _showError(response)
                    }
                })
            })

            $("#username").val(@json($barista?->user?->username))
            $("#nama").val(@json($barista?->user?->name))
            $("#jenkel").val(@json($barista?->user?->jenkel)).change()
            tgl_lahir.setDate(@json($barista?->tgl_lahir))
            tgl_registrasi.setDate(@json($barista?->tgl_registrasi))
            $("#alamat").val(@json($barista?->alamat))
            $("#kontak").val(@json($barista?->user?->kontak))

        })
    </script>
@endpush
