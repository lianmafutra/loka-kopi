@extends('admin.layouts.master')
@push('css')
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }} ">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/flatpicker/flatpickr.min.css') }}">
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
            width: 600px;
            height: 300px;
            object-fit: cover;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2) !important;
        }

  
    </style>
@endpush
@section('header')
    <x-header title="Input Data Slider" back-button="true"></x-header>
@endsection
@section('content')
<form id="form_sample" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-lg-8 col-sm-12">
                @csrf
                <div class="card">
                    <div class="card-body">
                     <div class="form-group">
                        <label>Slider Image
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
                
                    <x-input-number label="Order" id="new_order" required />

                        <x-input label="Judul" id="nama" required />
                        <x-select2 required id="isDetail" label="Klik Detail Konten" placeholder="Detail Konten">

                      
                           <option value="true">Ya</option>
                           <option selected value="false">Tidak</option>
                    
                   </x-select2>
                        <x-tiny-editor id="konten" label="Deskripsi Konten" name="konten"></x-tiny-editor>
                    </div>
                    <div class="card-footer">
                        <div style="gap:8px;" class="d-flex">
                            <a href="{{ route('master-data.slider.index') }}" type="button"
                                class="btn btn-secondary">Kembali</a>
                            <button type="submit" class="btn_submit btn btn-primary">Simpan</button>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    </form>
@endsection
@push('js')
    <script src="{{ asset('plugins/tinymce/tinymce.min.js') }}" referrerpolicy="origin"></script>
    <script src="{{ asset('js/tinyEditorConfig.js') }}" referrerpolicy="origin"></script>

    <script src="{{ asset('plugins/select2/js/select2.full.min.js') }}"></script>
 
  
    <script>
        $(function() {
            $('.select2bs4').select2({
                theme: 'bootstrap4',
            })
          
            $('#form_sample').submit(function(e) {
                e.preventDefault();
                const formData = new FormData(this);
                formData.append('_method', 'PUT');
                $.ajax({
                    type: 'POST',
                    url: route('master-data.slider.update', @json($slider->id)),
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
                                    'master-data.slider.index'))
                            })
                        }
                    },
                    error: function(response) {
                        _showError(response)
                    }
                })
            })
        })
        tinymce.init({
            selector: '#konten',
            plugins: 'image code table lists',
            menubar: 'favs file edit view insert format  table help',
            promotion: false,
            toolbar: 'undo redo | formatselect| bold italic | alignleft aligncenter alignright | indent outdent | bullist numlist | image | table',
            image_title: true,
            height: "300px",
            convert_urls: false,
            automatic_uploads: true,
            images_upload_url: route('tiny-editor.upload'),
            // file_picker_types: 'image',
            file_picker_callback: function(cv, value, meta) {
                var input = document.createElement('input');
                input.setAttribute('type', 'file');
                input.setAttribute('accept', 'image/*');
                input.onchange = function() {
                    var file = this.files[0];
                    var reader = new FileReader();
                    reader.readAsDataURL(file);
                    render.onload = function() {
                        var id = 'blobid' + (new Date()).getTime();
                        var blobCache = tinymce.activeEditor.editorUpload.blobCache;
                        var base64 = reader.result.split(',')[1];
                        var blobInfo = blobCache.create(id, file, base64);
                        blobCache.add(blobInfo);
                        cb(blobInfo.blobUri(), {
                            title: file.name
                        });
                    };
                };
                input.click();
            },
            content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
        });

       
        $('#nama').val(@json($slider?->nama))
        $('#new_order').val(@json($slider?->order))
        $('#isDetail').val(@json($slider?->isDetail)).change()
            $('#konten').html(@json($slider?->konten))
            document.getElementById('imageResult').src = @json($slider?->foto_url);

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




   

         
