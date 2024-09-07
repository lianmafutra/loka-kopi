@extends('admin.layouts.master')
@push('css')
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }} ">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">

    <link rel="stylesheet" href="{{ asset('plugins/flatpicker/flatpickr.min.css') }}">

    <link rel="stylesheet" href="{{ asset('template/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">

    <link rel="stylesheet" href="{{ asset('template/admin/plugins/summernote/summernote-bs4.min.css') }}">

    <link rel="stylesheet" href="{{ asset('plugins/filepond/filepond.css') }}" />
    <link rel="stylesheet" href="{{ asset('plugins/filepond/filepond-plugin-image-preview.css') }}" />
    <link rel="stylesheet" href="{{ asset('plugins/filepond/filepond-plugin-get-file.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/filepond/filepond-plugin-image-overlay.css') }}">

    <link rel="stylesheet" href="{{ asset('plugins/magnific/magnific-popup.min.css') }}" />

    <link rel="stylesheet" href="{{ asset('plugins/filepond/filepond-plugin-file-poster.css') }}" />

    <style>
        #file_laporan .filepond--item {
            cursor: pointer;
        }

        .filepond--list-scroller {
            cursor: default;
        }

        .filepond--root {
            height: auto;
        }
    </style>
@endpush
@section('header')
<x-header title="Edit Tinjuk CHR"></x-header>
@endsection
@section('content')
    <div class="col-lg-8 col-sm-12">
        <form id="form_sample" method="POST">
            @csrf
            @method('PUT')
            <div class="card">
                <div class="card-body">
                  <x-input label="Deskripsi" id="deskripsi" />
                  <x-filepond id="file_laporan" label='File' info='( Format File : pdf, word, excel Maks 5 MB )'
                    />
                </div>
                <div class="card-footer">
                    <div style="gap:8px;" class="d-flex">
                        <a href="{{ route('tinjuk-chr.index') }}" type="button"
                            class="btn btn-secondary">Kembali</a>
                        <button type="submit" class="btn_submit btn btn-primary">Simpan</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
@endsection

@push('js')
    {{-- filepond --}}
    <script src="{{ asset('plugins/filepond/filepond-plugin-file-poster.js') }}"></script>
    <script src="{{ asset('plugins/filepond/filepond.js') }}"></script>
    <script src="{{ asset('plugins/filepond/filepond-plugin-file-metadata.js') }}"></script>
    <script src="{{ asset('plugins/filepond/filepond-plugin-file-encode.js') }}"></script>
    <script src="{{ asset('plugins/filepond/filepond-plugin-file-validate-type.js') }}"></script>
    <script src="{{ asset('plugins/filepond/filepond-plugin-file-validate-size.js') }} "></script>
    <script src="{{ asset('plugins/filepond/filepond-plugin-image-preview.js') }}"></script>
    <script src="{{ asset('plugins/filepond/filepond-get-files.js') }}"></script>
    <script src="{{ asset('plugins/filepond/filepond-plugin-image-overlay.js') }}"></script>

    {{-- masking input currency,date input --}}
    <script src="{{ asset('plugins/jquery.mask.min.js') }}"></script>


    <script>
        $(function() {

            FilePond.registerPlugin(
                //  FilePondPluginGetFile,
                FilePondPluginFileEncode,
                FilePondPluginImagePreview,
                FilePondPluginFilePoster,

                FilePondPluginFileValidateType,
                FilePondPluginFileValidateSize)
            $('#form_sample').submit(function(e) {
                e.preventDefault();
                const formData = new FormData(this);
                $.ajax({
                    type: 'POST',
                    url: route('tinjuk-chr.update', @json($tinjukChr->hashId)),
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
                                    'tinjuk-chr.index'))
                            })
                        }
                    },
                    error: function(response) {
                        _showError(response)
                    }
                })
            })

            const file_laporan = FilePond.create(document.querySelector('#file_laporan'));
            file_laporan.setOptions({
                onactivatefile: (item) => {
                    array = ['docx','doc','xlsx','xls'];
                    let ext = item.fileExtension.toLowerCase().trim();
                    if (array.includes(ext)) {
                     window.open(item.serverId, '_blank');
                    } else {
                     window.open(@json(url('viewpdf/web/viewer.html?url=')) + item.serverId, '_blank');
                    }
                },
                beforeRemoveFile: (item) => {
                    const confirmed = window.confirm("Are you sure you want to remove the file?");
                    return confirmed;
                },
                server: {
                    allowImagePreview: true,
                    url: "{{ config('filepond.server.url') }}",
                    headers: {
                        'X-CSRF-TOKEN': "{{ @csrf_token() }}",
                    },
                    load: (source, load, error, progress, abort, headers) => {
                        _getFilepond(source, load)
                    }
                },
                files: @json($tinjukChr->field('file_laporan')->getFilepond())
            });
            $('#deskripsi').val(@json($tinjukChr->deskripsi))
        })
    </script>
@endpush
