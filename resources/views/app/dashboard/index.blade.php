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
    </div>
    <div class="row">
        <div class="col-4">
            <div class="card">
                <div class="card-header">
                    Statistik Transaksi
                </div>
                <div class="card-body">
                    <div class="table-container">
                        <table class="table table-bordered custom-datatable">
                            <thead>
                                <tr>
                                    <th>Periode</th>
                                    <th style="text-align: center;">Transaksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Transaksi Hari Ini</td>
                                    <td style="text-align: center;" id="today-transactions">{{ $transaksi_hari_ini }}</td>
                                </tr>
                                <tr>
                                    <td>Transaksi Kemarin</td>
                                    <td style="text-align: center;" id="yesterday-transactions">{{ $transaksi_kemarin }}
                                    </td>
                                </tr>
                                <tr>
                                    <td>Transaksi Bulan Ini</td>
                                    <td style="text-align: center;" id="month-transactions">{{ $transaksi_bulan_ini }}</td>
                                </tr>
                                <tr>
                                    <td>Transaksi Minggu Ini</td>
                                    <td style="text-align: center;" id="week-transactions">{{ $transaksi_minggu_ini }}</td>
                                </tr>
                                <tr>
                                    <td>Transaksi Tahun Ini ({{ date('Y') }})</td>
                                    <td style="text-align: center;" style="text-align: center; id="year-transactions">
                                        {{ $transaksi_tahun_ini }}</td>
                                </tr>
                                <tr>
                                    <td>Seluruh Transaksi</td>
                                    <td style="text-align: center;" id="year-transactions">{{ $transaksi_seluruh }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-4">
            <div class="card">
                <div class="card-header">
                    Barista Terlaris Hari Ini
                </div>
                <div class="card-body">
                    <div class="table-container">
                        <table class="table table-bordered custom-datatable">
                            <thead>
                                <tr>
                                    <th>Barista</th>
                                    <th>Gerobak</th>
                                    <th>Transaksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($gerobaks as $gerobak)
                                    <tr>
                                        <td>
                                            @if ($gerobak->barista && $gerobak->barista->user)
                                                <div class="d-flex align-items-center">
                                                    <!-- Avatar Badge -->
                                                    <img class="foto img-circle elevation-3 foto p-0" height="40px"
                                                        width="40px"; style="object-fit: cover; padding: 0px !important;"
                                                        src="{{ url('storage/uploads/barista/' . $gerobak?->barista?->user?->foto) }}"
                                                        class="avatar">
                                                    <!-- Barista Name -->
                                                    <span class="ml-2">{{ $gerobak->barista->user->name }}</span>
                                                </div>
                                            @else
                                                Tidak ada
                                            @endif
                                        </td>
                                        <td>{{ $gerobak->nama }}</td>
                                        <td style="text-align: center;">{{ $gerobak->transaksi_count }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-4">
         <div class="card">
                <div class="card-header">
                    Kopi Terlaris Hari Ini
                </div>
                <div class="card-body">
                    <div class="table-container">
                        <table class="table table-bordered custom-datatable">
                            <thead>
                                <tr>
                                    <th> Nama Kopi</th>
                                    <th>Terjual</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($produk as $item)
                                    <tr>
                                        <td>
                                            @if ($item->nama)
                                                <div class="d-flex align-items-center">
                                                    <!-- Avatar Badge -->
                                                    <img class="foto img-circle elevation-3 foto p-0" height="40px"
                                                        width="40px"; style="object-fit: cover; padding: 0px !important;"
                                                        src="{{ $item->foto_url }}" class="avatar">
                                                    <!-- Barista Name -->
                                                    <span class="ml-2">{{ $item->nama }}</span>
                                                </div>
                                            @else
                                                Tidak ada
                                            @endif
                                        </td>
                                        <td style="text-align: center;">{{ $item->transaksi_count }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-12">
      <div class="card">
         <div class="card-header">
            Grafik Transaksi Loka Kopi perBulan Tahun <span style="font-weight: bold">{{ date('Y') }}</span>

            {{-- <x-select2 id="select_grafik_1" label="" required="false" placeholder="Pilih Jenis Grafik">
               <option value="transaksi">Transaksi</option>
               <option value="produk">Produk</option>
               <option value="gerobak">Gerobak</option>
           </x-select2> --}}
         </div>
         <div class="card-body">
            <canvas id="transaksiChart" height="80"></canvas>
         </div>
      </div>
    </div>

    <div class="col-12">
      <div class="card">
         <div class="card-header ">
            <span>Grafik Transaksi Loka Kopi Perhari</span>
               <x-select2  id="select_month" label="" required="false" placeholder="Pilih Bulan" class="w-auto ms-auto">
                  @for ($i = 1; $i <= 12; $i++)
                     <option value="{{ $i }}" {{ $i == date('n') ? 'selected' : '' }}>
                           {{ DateTime::createFromFormat('!m', $i)->format('F') }}
                     </option>
                  @endfor
               </x-select2>
        </div>
         <div class="card-body">
            <canvas id="dailyChart" height="80"></canvas>
         </div>
      </div>
    </div>
@endsection
@push('js')

    <script src="{{ asset('template/admin/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('template/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('plugins/select2/js/select2.full.min.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2"></script> <!-- Import plugin chartjs-plugin-datalabels -->
    <script>
      

        $('#select_month').select2({
         theme: 'bootstrap4',
        });

        document.addEventListener('DOMContentLoaded', function () {
            // Initialize select2
            $('#select_grafik_1').select2();

            var ctx = document.getElementById('transaksiChart').getContext('2d');
            var transaksiChart;

            // Function to update the chart with new data
            function updateChart(apiUrl) {
                fetch(apiUrl)
                    .then(response => response.json())
                    .then(data => {
                        var labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'].map((month, index) => {
                            return `${month} (${data[index + 1]})`; // Display the jumlah next to the month name
                        });

                        // If the chart already exists, destroy it before creating a new one
                        if (transaksiChart) {
                            transaksiChart.destroy();
                        }

                        transaksiChart = new Chart(ctx, {
                            type: 'line',
                            data: {
                                labels: labels,
                                datasets: [{
                                    label: 'Jumlah',
                                    data: Object.values(data),
                                    borderColor: 'rgba(75, 192, 192, 1)',
                                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                    borderWidth: 2,
                                    fill: true
                                }]
                            },
                            options: {
                                responsive: true,
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });
                    })
                    .catch(error => console.error('Error fetching data:', error));
            }

            // Trigger chart update when select2 value changes
            $('#select_grafik_1').on('change', function () {
                var selectedValue = $(this).val();
                var apiUrl = '';

                // Determine the API endpoint based on the selected value
                switch (selectedValue) {
                    case 'transaksi':
                        apiUrl = route('grafik.transaksi.perbulan'); // Update with the correct endpoint for transaksi
                        break;
                    case 'produk':
                        apiUrl = '/api/produk/chart'; // Update with the correct endpoint for produk
                        break;
                    case 'gerobak':
                        apiUrl = '/api/gerobak/chart'; // Update with the correct endpoint for gerobak
                        break;
                }

                // Fetch new data and update the chart
                updateChart(apiUrl);
            });

            // Load default chart (e.g., transaksi)
            updateChart(route('grafik.transaksi.perbulan'));


            
        });

        updateDailyChart(route('grafik.transaksi.perhari'),  $('#select_month').val());
        $('#select_month').on('change', function () {
                var selectedMonth = $(this).val();
                updateDailyChart(route('grafik.transaksi.perhari'), selectedMonth);
            });
        var dailyCtx = document.getElementById('dailyChart').getContext('2d');
            var monthlyChart, dailyChart;
           
            function updateDailyChart(apiUrl, month) {
                fetch(route('grafik.transaksi.perhari') + '?month=' + month)
                    .then(response => response.json())
                    .then(data => {
                        const currentYear = new Date().getFullYear();
                        const daysInMonth = Object.keys(data);
                        const labels = daysInMonth.map(day => {
                            const date = new Date(currentYear, month - 1, day);
                            const dayName = date.toLocaleDateString('Id', { weekday: 'long' });
                            return `${dayName}, ${day}`;
                        });

                        if (dailyChart) {
                            dailyChart.destroy();
                        }

                        dailyChart = new Chart(dailyCtx, {
                            type: 'line',
                            data: {
                                labels: labels,
                                datasets: [{
                                    label: 'Jumlah',
                                    data: Object.values(data),
                                    borderColor: 'rgba(75, 192, 192, 1)',
                                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                    borderWidth: 2,
                                    fill: true
                                }]
                            },
                            options: {
                                responsive: true,
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });
                    })
                    .catch(error => console.error('Error fetching daily data:', error));
            }

    </script>
@endpush
