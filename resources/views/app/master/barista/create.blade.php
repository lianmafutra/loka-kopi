@extends('admin.layouts.master')
@push('css')
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }} ">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/flatpicker/flatpickr.min.css') }}">
    <link rel="stylesheet" href="{{ asset('template/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('template/admin/plugins/summernote/summernote-bs4.min.css') }}">
    <link rel="stylesheet" type="text/css" href="https://unpkg.com/file-upload-with-preview/dist/style.css" />
    <style>
          #foto {
            opacity: 0;
        }

        #upload-label {
            position: absolute;
            top: 50%;
            left: 1rem;
            transform: translateY(-50%);
        }

        .image-area {
            border: 2px dashed rgba(255, 255, 255, 0.7);
            padding: 1rem;
            position: relative;
        }

        .image-area::before {
            content: 'Uploaded image result';
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 0.8rem;
            z-index: 1;
        }

        .image-area img {
            z-index: 2;
            position: relative;
        }

        #imageResult {
            width: 300px;
            height: 300px;
            object-fit: cover;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2) !important;
        }

    </style>
@endpush
@section('header')
    <x-header title="Input Data Barista" back-button="true"></x-header>
@endsection
@section('content')
<div class="row">
   <div class="col-lg-8 col-sm-12">
      <form id="form_sample" method="post" enctype="multipart/form-data">
          @csrf
          <div class="card">
              <div class="card-body">
                <x-input label="Username Login" id="username" required />
                  <x-input label="Nama Lengkap" id="nama" required />
                  <x-input-password id="password" placeholder="Password" label="Password" info="" required />
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
                      <button type="submit" class="btn_submit btn btn-primary">Simpan</button>
                  </div>
              </div>
          </div>
     
  </div>
  <div class="col-4">
    <div class="card">
        <div class="card-body">
            <div class="form-group">
                <label>Foto Profile
                </label>
                <!-- Upload image input-->
                <div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm">
                    <input id="foto" name="foto" type="file" onchange="readURL(this);"
                        class="form-control border-0">
                    <label id="upload-label" for="foto" class="font-weight-light text-muted">Choose
                        file</label>
                    <div class="input-group-append">
                        <label for="foto" class="btn btn-light m-0 rounded-pill px-4"> <i
                                class="fa fa-cloud-upload mr-2 text-muted"></i><small
                                class="text-uppercase font-weight-bold text-muted">Choose file</small></label>
                    </div>
                </div>
                <!-- Uploaded image area-->
                <div class="image-area mt-4">
                    <img id="imageResult" src="{{ asset('img/placeholder_produk.png') }}" alt=""
                        class="img-fluid rounded shadow-sm mx-auto d-block">
                </div>
                <span class="text-danger error error-text foto_err"></span>
            </div>
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
                $.ajax({
                    type: 'POST',
                    url: route('master-data.barista.store'),
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
                                    'master-data.barista.index'))
                            })
                        }
                    },
                    error: function(response) {
                        _showError(response)
                    }
                })
            })
        })

          /*  ==========================================
            SHOW UPLOADED IMAGE
        * ========================================== */
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#imageResult')
                        .attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        $(function() {
            $('#foto').on('change', function() {
                readURL(input);
            });
        });
        /*  ==========================================
            SHOW UPLOADED IMAGE NAME
        * ========================================== */
        var input = document.getElementById('foto');
        var infoArea = document.getElementById('upload-label');
        input.addEventListener('change', showFileName);

        function showFileName(event) {
            var input = event.srcElement;
            var fileName = input.files[0].name;
            infoArea.textContent = 'File name: ' + fileName;
        }
    </script>
@endpush
