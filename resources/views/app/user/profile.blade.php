@extends('admin.layouts.master')
@push('css')
@endpush
<style>
</style>
@section('header')
    <x-header title="Profile"></x-header>
@endsection
@section('content')
    <div class="col-lg-6">
        <div class="card card-widget widget-user-2">
            <div class="widget-user-header ">
                <div class="widget-user-image">
                    <img onerror="this.onerror=null; this.src='{{ asset('img/logo_laravel.jpeg') }}'" style="height: 120px; width: 120px; " class="mr-4 brand-image img-circle elevation-3"
                        src="{{ $user->field('foto')->getFile() }}" alt="User Avatar">
                </div>
                <h2 class="widget-user-username">{{ $user->nama_lengkap }}</h2>
                <h5 class="widget-user-desc">{{ $user->getRoleName() }}</h5>
            </div>
            <div class="card-footer ">
                <div class="card-body">
                    <table class="table">
                        <thead>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Kontak</td>
                                <td>{{ $user->kontak }}</td>
                            </tr>
                            <tr>
                              <td>Email</td>
                              <td>{{ $user->email }}</td>
                          </tr>
                            <tr>
                                <td>Alamat</td>
                                <td>{{ $user->alamat }}</td>
                            </tr>
                            <tr>
                                <td>Jenis Kelamin</td>
                                <td>{{ $user->jenis_kelamin }}</td>
                            </tr>
                            <tr>
                              <td>Status</td>
                              <td>{{ $user->status }}</td>
                          </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    </div>
@endsection
@push('js')
@endpush
