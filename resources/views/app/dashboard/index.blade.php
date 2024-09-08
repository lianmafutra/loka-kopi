@extends('admin.layouts.master')
@section('header')
    <x-header title="Dashboard"></x-header>
@endsection
@push('css')
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('template/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }} ">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <style>


    </style>
@endpush
@section('content')
    <div class="row">
        <div class="col-12 col-sm-6 col-md-4">
            <div class="info-box">
                <span class="info-box-icon bg-info elevation-1"><i class="fas fa-cog"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Barista</span>
                    <span style="font-size: 20px" class="info-box-number">
                        <span style="font-size: 20px" class="info-box-number">{{ $total_barista }} Orang</span>
                        {{-- <small>%</small> --}}
                    </span>
                </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-4">
            <div class="info-box mb-3">
                <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-users"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Konsumen</span>
                    <span style="font-size: 20px" class="info-box-number">{{ $total_konsumen }} Orang</span>
                </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-4">
            <div class="info-box mb-3">
                <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-thumbs-up"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Transaksi Hari ini</span>
                    <span style="font-size: 20px" class="info-box-number"></span>
                    <span style="font-size: 20px" class="info-box-number"> 200 </span>
                </div>
            </div>
        </div>
        <div class="clearfix hidden-md-up"></div>
        {{-- <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
                <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Total Obat</span>
                    <span style="font-size: 20px" class="info-box-number">100</span>

                </div>
            </div>
        </div> --}}

    </div>


  
@endsection
@push('js')
    <script src="{{ asset('template/admin/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('template/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('plugins/select2/js/select2.full.min.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2"></script> <!-- Import plugin chartjs-plugin-datalabels -->
    <script>
        $('.select2bs4').select2({
            theme: 'bootstrap4',
        })


     
    </script>
@endpush
