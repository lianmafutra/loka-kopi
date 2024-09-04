@extends('admin.layouts.master')
@section('header')
    <x-header title="Dashboard"></x-header>
@endsection
@push('css')
    <style>
        body {}

        .table td,
        .table th {
            word-break: break-word;
        }

        table.dataTable thead tr {
            background-color: green;
        }

        /* .table thead th {
                        vertical-align: bottom;
                        border-bottom: none !important;
                        background-image: rgba(255, 255, 255, 0.2) !important;
                        backdrop-filter: blur(5px);
                        -webkit-backdrop-filter: blur(5px);
                        border: 1px solid rgba(255, 255, 255, 0.3) !important;
                    } */
    </style>
@endpush
@section('content')
    <div class="row">
        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
                <span class="info-box-icon bg-info elevation-1"><i class="fas fa-cog"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">All User</span>
                    <span style="font-size: 20px" class="info-box-number">
                        {{ $totalUser }}
                        {{-- <small>%</small> --}}
                    </span>
                </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
                <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-thumbs-up"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Roles</span>
                    <span style="font-size: 20px" class="info-box-number">{{ $totalRole }}</span>
                </div>
            </div>
        </div>
        <div class="clearfix hidden-md-up"></div>
        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
                <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Permissions</span>
                    <span style="font-size: 20px" class="info-box-number">{{ $totalPermission }}</span>
                </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
                <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-users"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">New Members</span>
                    <span style="font-size: 20px" class="info-box-number">2,000</span>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header border-transparent">
                    <h3 class="card-title">User Log Activity </h3>
                    <div class="card-tools">
                        <btton type="button" class="btn btn-tool" data-card-widget="collapse">
                            <i class="fas fa-minus"></i>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <div class="card-body table-responsive p-0" style="height: 300px;">
                                <table class="table table-head-fixed">
                                    <thead>
                                        <tr>
                                            <th>User</th>
                                            <th>Action</th>
                                            <th>Model</th>
                                            <th width="30%">Url</th>
                                            <th>Date</th>
                                        </tr>
                                    </thead>
                                    <tbody id="log_audit_body">
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="card-footer clearfix">
                    <a href="javascript:void(0)" class="btn btn-sm btn-secondary float-right">View All</a>
                </div>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header border-transparent">
                    <h3 class="card-title">Log Error </h3>
                    <div class="card-tools">
                        <btton type="button" class="btn btn-tool" data-card-widget="collapse">
                            <i class="fas fa-minus"></i>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <div class="card-body table-responsive p-0" style="height: 300px;">
                                <table class="table table-head-fixed" style="width: 100%">
                                    <thead>
                                        <tr>
                                            <th style="width: 15%">User</th>
                                          
                                            <th>Message</th>
                                            <th style="width: 30%">Akses</th>
                                            <th style="width: 15%">Time</th>
                                        </tr>
                                    </thead>
                                    <tbody id="log_error_body">
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="card-footer clearfix">
                    <a href="javascript:void(0)" class="btn btn-sm btn-secondary float-right">View All</a>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('js')
    <script>
      //   $.get(route('audit-log'), function(response) {
      //       // console.log(response)
      //       response.data.forEach(element => {
      //           $('#log_audit_body').append(`<tr>
      //                      <td>${element.username}</td>
      //                      <td>${ element.event}</td>
      //                      <td>${ element.auditable_type}</td>
      //                      <td ">${element.url}</td>
      //                      <td>${element.created_at}
      //                      </td></tr>`);
      //       });

      //   });
// 
      //   $.get("https://sirelaku.site/log-viewer/api/logs?direction=desc&exclude_levels[]=EMERGENCY&exclude_levels[]=INFO&exclude_file_types=&shorter_st", {
      //          "file": "laravel.log",
      //           "levels": ["warning", "error"],
      //       })
      //       .done(function(response) {
      //          console.log(response)
      //           response.logs.forEach(element => {
      //               $('#log_error_body').append(`<tr>
      //                      <td>${element.context[1]?.nama_lengkap}</td>
      //                      <td>${element.context[0]?.exception}</td>
      //                      <td>- ${element.context[1]?.url} <br> - ${element.context[1]?.controller}</td>
      //                      <td>${ element?.datetime}</td></tr>`);
      //           });
      //       });
    </script>
@endpush
