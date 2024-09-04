@extends('admin.layouts.master')
@push('css')
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }} ">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">

    <link rel="stylesheet" href="{{ asset('plugins/flatpicker/flatpickr.min.css') }}">

    <link rel="stylesheet" href="{{ asset('template/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">

    <link rel="stylesheet" href="{{ asset('template/admin/plugins/summernote/summernote-bs4.min.css') }}">

    {{-- filepond --}}
    <link rel="stylesheet" href="{{ asset('plugins/filepond/filepond.css') }}" />
    <link rel="stylesheet" href="{{ asset('plugins/filepond/filepond-plugin-image-preview.css') }}" />
    <link rel="stylesheet" href="{{ asset('plugins/filepond/filepond-plugin-get-file.css') }}">
    {{-- <link rel="stylesheet" href="{{ asset('plugins/filepond/filepond-plugin-image-overlay.css') }}"> --}}
    <link rel="stylesheet" href="{{ asset('plugins/filepond/filepond-plugin-file-poster.css') }}" />
    {{-- filepond --}}




    <style>
  

        @media (min-width: 576px) {
            #file_cover_multi .filepond--item {
                width: calc(32% - 0.5em);
            }

          
        }

    </style>
@endpush
@section('header')
    <x-header title="Sample Crud"></x-header>
@endsection
@section('content')
    <div class="col-lg-8 col-md-8 col-sm-12">
        <form id="form_sample" action="{{ route('sample-crud.store') }}">
            @csrf
            @method('PUT')
            <div class="card">
                <div class="card-header">
                    Data
                </div>
                <div class="card-body">
                    <input hidden id="sample_id" name="sample_id">
                    <x-input label="Book Titte" id="title" info="Info : Sample Data Description Info"
                        placeholder="Book Name" />
                    <x-textarea id="desc" label="Short Description" placeholder="Description" />
                    <x-select2 id="category_id" label="Category" placeholder="Select Category">
                        <option value="fiction">Fiction</option>
                        <option value="biography">Biography</option>
                    </x-select2>
                    <x-select2 id="category_multi_id" name="category_multi_id[]" label="Category Multiple"
                        placeholder="Select Category" multiple>
                        <option value="fiction">Fiction</option>
                        <option value="biography">Biography</option>
                    </x-select2>

                    <x-select-days id="days" label="Select Days" placeholder="Select Days" />
                    <x-select-month id="month" label="Select Month" placeholder="Select Month" />
                    <x-date-picker-column label="Date Range Column">
                        <x-slot:date_start>
                            <x-datepicker id='start_date' label='Start Date' />
                        </x-slot:date_start>
                        <x-slot:date_end>
                            <x-datepicker id='end_date' label='End Date' />
                        </x-slot:date_end>
                    </x-date-picker-column>
                    <x-datepicker id="date_publisher" label="Date Publisher" />
                    <x-datepicker id='date_range' label='Deadline Range' />
                    <x-timepicker id="time" label="Time Publisher" placeholder="Time" />
                    <x-input-rupiah id="price" label="Price" />
                    <x-input-password id="password" placeholder="Password" label="Password" value="123456" />
                    <x-input-phone id="contact" label="Contact Number" placeholder="Nomor Telepon Aktif" />

                    <x-check-box label="Checkbox Select">
                        <x-checkbox.item id="check_ya" name="check" text="Option 1" type="checkbox"
                            checked></x-checkbox.item>
                        <x-checkbox.item id="check_tidak" name="check" text="Option 2" type="checkbox"></x-checkbox.item>
                    </x-check-box>

                    <x-check-box label="Radio Button Select">
                        <x-checkbox.item id="radio_1" name="radio" text="Ya" type="radio" color="primary">
                        </x-checkbox.item>
                        <x-checkbox.item id="radio_2" name="radio" text="Tidak" type="radio" color="primary"
                            checked>
                        </x-checkbox.item>
                    </x-check-box>

                    <x-filepond id="file_cover" label='File Cover' info='( Format File JPG/PNG , Maks 5 MB)'
                        accept="image/jpeg, image/png" />

                    <x-filepond id="file_cover_multi" name="file_cover_multi[]" label='File Cover multiple'
                        info='( Format File JPG/PNG , Maks 5 MB)' accept="image/jpeg, image/png" multiple />

                    <x-filepond id="file_pdf" name="file_pdf[]" label='File PDF'
                        info='( Format File : pdf, word, excel Maks 5 MB )' multiple />

                    <x-summernote id="summernote" label="Summenote Editor" />

                </div>
                <div class="card-footer">
                    <button type="submit" class="btn_submit btn btn-primary">Save</button>
                </div>
            </div>
        </form>
    </div>
@endsection


@push('js')
    <script src="{{ asset('plugins/select2/js/select2.full.min.js') }}"></script>
    <script src="{{ asset('template/admin/plugins/summernote/summernote-bs4.min.js') }}"></script>
    <script src="{{ asset('template/admin/plugins/summernote/summernote-bs4.min.js') }}"></script>

    {{-- currency format input --}}
    <script src="{{ asset('plugins/autoNumeric.min.js') }}"></script>

    {{-- flatcpiker format date input --}}
    <script src="{{ asset('plugins/flatpicker/flatpickr.min.js') }}"></script>
    <script src="{{ asset('plugins/flatpicker/id.min.js') }}"></script>

    {{-- filepond --}}
    <script src="{{ asset('plugins/filepond/filepond-plugin-file-poster.js') }}"></script>
    <script src="{{ asset('plugins/filepond/filepond.js') }}"></script>
    <script src="{{ asset('plugins/filepond/filepond-plugin-file-metadata.js') }}"></script>
    <script src="{{ asset('plugins/filepond/filepond-plugin-file-encode.js') }}"></script>
    <script src="{{ asset('plugins/filepond/filepond-plugin-file-validate-type.js') }}"></script>
    <script src="{{ asset('plugins/filepond/filepond-plugin-file-validate-size.js') }} "></script>
    <script src="{{ asset('plugins/filepond/filepond-plugin-image-preview.js') }}"></script>
    {{-- <script src="{{ asset('plugins/filepond/filepond-plugin-image-overlay.js') }}"></script> --}}
    <script src="{{ asset('plugins/filepond/filepond-get-files.js') }}"></script>
    <script src="https://unpkg.com/filepond-plugin-file-metadata/dist/filepond-plugin-file-metadata.js"></script>

    {{-- password toggle show/hide --}}
    <script src="{{ asset('plugins/toggle-password.js') }}"></script>

    {{-- masking input currency,date input --}}
    <script src="{{ asset('plugins/jquery.mask.min.js') }}"></script>
    
    <script>
        $(function() {
            $('.select2bs4').select2({
                theme: 'bootstrap4',
            })

            AutoNumeric.multiple('.rupiah', {
                digitGroupSeparator: '.',
                decimalPlaces: 0,
                minimumValue: 0,
                decimalCharacter: ',',
                formatOnPageLoad: true,
                allowDecimalPadding: false,
                alwaysAllowDecimalCharacter: false
            });

            const date_publisher = flatpickr("#date_publisher", {
                allowInput: true,
                dateFormat: "d/m/Y",
            });

            const start_date = flatpickr("#start_date", {
                allowInput: true,
                dateFormat: "d/m/Y",
            });

            const end_date = flatpickr("#end_date", {
                allowInput: true,
                dateFormat: "d/m/Y",
            });

            const time = flatpickr("#time", {
                enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
                time_24hr: true
            });

            const date_range = $("#date_range").flatpickr({
                allowInput: true,
                mode: "range",
                dateFormat: "d/m/Y",
                onChange: function(dates, dateStr, instance) {
                    if (dates.length == 2) {
                        let dateStart = instance.formatDate(dates[0], "Y-m-d");
                        let dateEnd = instance.formatDate(dates[1], "Y-m-d");
                    }
                }
            })

            $('#date_publisher').mask('00/00/0000');
            $('#contact').mask('0000-0000-000000');

            $('#summernote').summernote({
                height: 200,
                imageTitle: {
                    specificAltField: true,
                },
                imageAttributes: {
                    icon: '<i class="note-icon-pencil"/>',
                    figureClass: 'figureClass',
                    figcaptionClass: 'captionClass',
                    captionText: 'Caption Goes Here.',
                    manageAspectRatio: true
                },
                popover: {
                    image: [
                        ['imagesize', ['imageSize100', 'imageSize50', 'imageSize25']],
                        ['float', ['floatLeft', 'floatRight', 'floatNone']],
                        ['remove', ['removeMedia']],
                        ['custom', ['imageAttributes']],
                    ],
                },
            })

            $('#form_sample').submit(function(e) {
                e.preventDefault();
                const formData = new FormData(this);
                $.ajax({
                    type: 'POST',
                    url: route('sample-crud.update', @json($sampleCrud->id)),
                    data: formData,
                    contentType: false,
                    processData: false,
                    dataType: 'json',
                    beforeSend: function() {
                        _showLoading()
                    },
                    success: (response) => {
                        if (response) {
                            // this.reset()
                            _alertSuccess(response.message)
                        }
                    },
                    error: function(response) {
                        // console.log(response.responseJSON.errors)
                        _showError(response)
                    }
                })
            })


            //   setValue
            $('#title').val(@json($sampleCrud->title))
            $('#desc').val(@json($sampleCrud->desc))
            $('#category_id').val(@json($sampleCrud->category_id)).change()
            $("#category_multi_id").val(@json($sampleCrud->category_multi_id)).change()
            $('#days').val(@json($sampleCrud->days)).change()
            $('#month').val(@json($sampleCrud->month)).change()
            $('#contact').val(@json($sampleCrud->contact))
            $('#sample_id').val(@json($sampleCrud->id))

            AutoNumeric.getAutoNumericElement('#price').set(@json($sampleCrud->price))
            start_date.setDate(@json($sampleCrud->start_date))
            end_date.setDate(@json($sampleCrud->end_date))
            date_publisher.setDate(@json($sampleCrud->date_publisher))
            time.setDate(@json($sampleCrud->time));
            date_range.setDate([@json($sampleCrud->end_date), @json($sampleCrud->start_date)]);

            $("#summernote").summernote('code', @json($sampleCrud->summernote));



            // fileponds Setup 

            FilePond.registerPlugin(
                FilePondPluginGetFile,
                FilePondPluginFileEncode,
                FilePondPluginImagePreview,
                FilePondPluginFilePoster,
               //  FilePondPluginImageOverlay,
                FilePondPluginFileMetadata,
                FilePondPluginFileValidateType,
                FilePondPluginFileValidateSize)

            const file_pdf = FilePond.create(document.querySelector('#file_pdf'));
            file_pdf.setOptions({
               beforeRemoveFile: (file) => {
                    return confirm("Are You Sure Delete This File ?");
                },
                allowImagePreview: true,
                allowMultiple: true,
                allowReorder: true,
                labelButtonDownloadItem: 'custom label', // by default 'Download file'
                allowDownloadByUrl: true, // by default downloading by URL disabled
                server: {
                    url: "{{ config('filepond.server.url') }}",
                    headers: {
                        'X-CSRF-TOKEN': "{{ @csrf_token() }}",
                    },
                    load: (source, load, error, progress, abort, headers) => {
                        _getFilepond(source, load)
                    }
                },
                files: @json($sampleCrud->field('file_pdf')->getFileponds())
            });



            const file_cover = FilePond.create(document.querySelector('#file_cover'));
            file_cover.setOptions({
                server: {
                    url: "{{ config('filepond.server.url') }}",
                    headers: {
                        'X-CSRF-TOKEN': "{{ @csrf_token() }}",
                    },
                    load: (source, load, error, progress, abort, headers) => {
                        _getFilepond(source, load)
                    }
                },
                beforeRemoveFile: (file) => {
                    return confirm("Are You Sure Delete This File ?");
                },
                files: @json($sampleCrud->field('file_cover')->getFilepond()),
                allowImagePreview: true,
                imagePreviewHeight: 200,
                imagePreviewWidth: 200,
          
                allowDownloadByUrl: true, // by default downloading by URL disabled
                allowFileTypeValidation: true,
                acceptedFileTypes: ['image/*'],
                labelFileTypeNotAllowed: 'File of invalid type',
            })

            const file_cover_multi = FilePond.create(document.querySelector('#file_cover_multi'));

            file_cover_multi.setOptions({
                server: {
                    url: "{{ config('filepond.server.url') }}",
                    headers: {
                        'X-CSRF-TOKEN': "{{ @csrf_token() }}",
                    },
                    load: (source, load, error, progress, abort, headers) => {
                        _getFilepond(source, load)
                    }
                },
                beforeRemoveFile: (file) => {
                    return confirm("Are You Sure Delete This File ?");
                },
                files: @json($sampleCrud->field('file_cover_multi')->getFileponds()),
                styleItemPanelAspectRatio: 1,
                
                imageCropAspectRatio: '1:1',
                allowImagePreview: true,
                allowMultiple: true,
                labelButtonDownloadItem: 'custom label', // by default 'Download file'
                allowDownloadByUrl: true, // by default downloading by URL disabled
                allowReorder: false,
                imagePreviewHeight: 300,
                imagePreviewWidth: 300,
                acceptedFileTypes: ['image/*'],
                labelFileTypeNotAllowed: 'File of invalid type',
            });
        })
    </script>
@endpush
