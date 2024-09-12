<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="csrf-token" content="{{ csrf_token() }}">
    @stack('css')
    <style>
      .select2-container .select2-selection--single {
    box-sizing: border-box;
    cursor: pointer;
    display: block;
    height: 35px !important ;
    user-select: none;
    -webkit-user-select: none;
}
        .card-footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: #f8f9fa;
          
            padding: 10px;
            box-shadow: 0 -1px 5px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }

        .main-content {
            margin-bottom: 90px;
            /* Sesuaikan dengan tinggi footer */
        }
    </style>
</head>
{{-- dd --}}

<body>





    @yield('content')

    @routes {{-- route library https://github.com/tighten/ziggy --}}




  


    {{-- tes --}}

    @stack('js')
    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        })
    </script>
</body>

</html>
