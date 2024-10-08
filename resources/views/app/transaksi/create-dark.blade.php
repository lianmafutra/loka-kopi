@extends('admin.layouts.master-mobile')
@push('css')
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Select2 CSS -->
    <link rel="stylesheet" href="{{ asset('css/input-stok-dark.css') }}">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
      

        .table input[type="number"] {
            width: 100%;
            /* Ensure input takes full width of the cell */
            text-align: center;
            /* Center text inside input */
            max-width: 150px;
            /* Optional: adjust the max width as needed */
        }

        html,
        body {
            height: 100%;
            padding-bottom: 100px;
            margin-bottom: 100px;
        }

        .container {
            min-height: 100vh;
            /* Mengisi setidaknya 100% dari tinggi viewport */
            padding-bottom: 100px;
            margin-bottom: 100px;
        }

        select {
            -webkit-appearance: none !important;
            -moz-appearance: none !important;
         
            height: 45px;
            width: 100%;
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAUCAMAAACtdX32AAAAdVBMVEUAAAD///8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAhMdQaAAAAJ3RSTlMAAAECAwQGBwsOFBwkJTg5RUZ4eYCHkJefpaytrsXGy8zW3+Do8vNn0bsyAAAAYElEQVR42tXROwJDQAAA0Ymw1p9kiT+L5P5HVEi3qJn2lcPjtIuzUIJ/rhIGy762N3XaThqMN1ZPALsZPEzG1x8LrFL77DHBnEMxBewz0fJ6LyFHTPL7xhwzWYrJ9z22AqmQBV757MHfAAAAAElFTkSuQmCC);
            background-position: 100%;
            background-repeat: no-repeat;
            border: 1px solid ;
            padding: 0.5rem;
            border-radius: 0;
        }

        .product-select2 {
            width: 100%;
            /* Adjust width to fit mobile screens */
            height: 50px;
            /* Adjust height to fit your design */
            font-weight: bold;
            font-size: 20px;
            /* Adjust font size */
            padding: 5px;
            /* Add padding for better touch interaction */
       
            /* Dark gray border color */
            border-width: 1px;
            /* Border size */
            border-style: solid;
            /* Border style */
            border-radius: 10px;
            /* Adjust the value as needed */
            box-sizing: border-box;
        }

        button.btn.btn-danger.remove-row.remove-tr {
            height: 50px;
            font-size: 20px !important;
        }

        .btn-custom-size {
            font-size: 25px;
            /* Adjust font size */
            padding: 20px;
            /* Adjust padding */
            /* Optionally adjust width and height */
            width: auto;
            /* Set a specific width if desired */
            height: 50px;
            /* Set a specific height if desired */
        }

        .product-select {
            width: 200px;
            padding-left: 20px;
            max-width: 500px;
            height: 50px;
            font-size: 20px;
            border-color: #636363;
            /* Dark gray border color */
            border-width: 1px;
            /* Border size */
            border-style: solid;
            /* Border style */
            border-radius: 10px;
            /* Adjust the value as needed */
            box-sizing: border-box;
        }
    </style>
@endpush
@section('content')
    <!-- Main Content -->
    <div class="main-content container my-5" style=" padding-bottom: 100px">
        <div class="row">
            <form id="form_sample" method="post" enctype="multipart/form-data" novalidate>
                <div class="row">
                    <div class="col-lg-8 col-sm-12">
                        @csrf
                        @method('POST')
                        <div class="card">
                            <div class="table-responsive">
                                <table style="margin-bottom: 0 !important" class="table table-bordered" id="products-table">
                                    <thead style="font-size: 20px; color:#999999">
                                        <tr>
                                            <th>Produk</th>
                                            <th>Jumlah</th>
                                            <th>Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <select data-placeholder="Pilih Produk" class="product-select"
                                                    name="products[0][id]" required>
                                                    <option value="">Pilih Produk</option>
                                                    @foreach ($products->get() as $product)
                                                        <option value="{{ $product->id }}">{{ $product->nama }}</option>
                                                    @endforeach
                                                </select>
                                                <br>
                                                <small name="products[0][id]" class="stock-info" style="display: none">Sisa
                                                    stok: <span class="stock-amount">0</span></small>
                                                {{-- <small class="stock-info">
                                                   Sisa stok: <span id="stok-value">0</span>
                                               </small> --}}

                                            </td>
                                            <td><input type="number" name="products[0][quantity]" placeholder="0"
                                                    class="product-select2 product-quantity" required disabled /></td>
                                            <td>
                                                <button type="button" class="btn btn-danger remove-row remove-tr"
                                                    style="font-size: 14px; padding: 10px 20px;">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Select2 JS -->
<script>
    let tokens = "";
  

    function iniToken(token) {
        tokens = token
    }

    function addRow() {
        var rowCount = $('#products-table tbody tr').length;
        var newRow = `
      <tr>
          <td>
              <select data-placeholder="Pilih Produk" style="width: 200px"  name="products[${rowCount}][id]" class="product-select" required>
                  <option value="">Pilih Produk</option>
                  @foreach ($products->get() as $product)
                      <option value="{{ $product->id }}">{{ $product->nama }}</option>
                  @endforeach
              </select>
              <br>
              <small class="stock-info" style="display: none" name="products[${rowCount}][id]" >Sisa stok: <span class="stock-amount">0</span></small>
          </td>
          
          <td><input  type="number" placeholder="0"  class="product-select2 product-quantity" name="products[${rowCount}][quantity]" required disabled></td>
          <td>
                                                <button type="button" class="btn btn-danger remove-row remove-tr"
                                                    style="font-size: 14px; padding: 10px 20px;">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </td>
      </tr>`;
        $('#products-table tbody').append(newRow);
        // Focus on the new select element
        var newSelect = $('#products-table tbody tr').last().find('select');
        newSelect.focus();
        // Reinitialize select2 for new rows
    }
    
    
    document.addEventListener('DOMContentLoaded', function() {
    const quantityInputs = document.querySelectorAll('.product-quantity');

    quantityInputs.forEach(input => {
        input.addEventListener('input', function() {
            if (this.value <= 0) {
                this.setCustomValidity('Value must be greater than 0');
                this.reportValidity(); // Show the validation message
            } else {
                this.setCustomValidity(''); // Clear the error message
            }
        });
    });
});

    function submit() {
        var form = document.getElementById('form_sample');
        if (form.checkValidity() === false) {
             const data = {
                            key: "error",
                            message: "Cek Inputan Data Dengan Benar"
                        };
                        window.Android.showResponse(JSON.stringify(data));
            form.reportValidity(); // Show validation messages
        } else {
            $(form).trigger('submit'); // Trigger form submission if valid
        }
    }
    $(function() {
        let stockInfo = 0;
        // Event listener for change event on select
        $('#products-table').on('change', '.product-select', function() {
   

            if ($(this).val() !== "") {
            
                // Enable the associated quantity input field
                $(this).closest('tr').find('input[name*="[quantity]"]').prop('disabled', false);

            } else {
                // If no product is selected, disable the quantity input field
               //  test.prop('disabled', true);
               $(this).closest('tr').find('input[name*="[quantity]"]').prop('disabled', true);
              $(this).closest('tr').find('input[name*="[quantity]"]').val("")
            }


            // Get the name of the selected element





            // Focus on the input field in the same row
            $(this).closest('tr').find('input[name*="[quantity]"]').focus();
            var productId = $(this).val();

            const selectName = $(this).attr('name');



            stockInfo = $('small[name="' + selectName + '"]');
            test = $(this).closest('tr').find('input[name*="[quantity]"]')




            let quantityInput = $(this).closest('#products-table').find('.product-quantity');





            if (productId) {
                // Make an AJAX request to get stock info
                $.ajax({
                    url: route('getStokProdukBarista', productId),
                    method: 'GET',
                    headers: {
                        'Authorization': 'Bearer ' + tokens
                    },
                    success: function(response) {
                        // Assuming data contains the stock amount
                        stockInfo.find('.stock-amount').text(response.data
                            .jumlah_stok); // Update stock amount
                        stockInfo.show(); // Show stock info
                        $(this).closest('tr').find('input[name*="[quantity]"]').focus();
                        //   quantityInput.attr('max', stockAmount); // Set max attribute on quantity input
                        //   quantityInput.val(Math.min(quantityInput.val(), stockAmount)); // Adjust value if it exceeds stock
                    },
                    error: function() {
                        stockInfo.find('.stock-amount').text(
                            'Error fetching stock'); // Handle error
                        stockInfo.show(); // Show stock info
                    }
                });
            } else {
                stockInfo.hide(); // Hide stock info if no product is selected
            }



        });

        // Validate quantity input
        $('#products-table').on('input', '.product-quantity', function() {

            $(this).closest('tr').find('input[name*="[quantity]"]').focus();
            var productId = $(this).val();

            var stockAmount =  parseInt($(this).closest('tr').find('.stock-amount').text())

            // Jika Anda ingin mengambil nilai dari <span> di dalam <small> yang ada di <tr>
        

    



            let quantity = parseInt($(this).val());

            // Ensure quantity does not exceed stock amount
            if (quantity > stockAmount) {
                const data = {
                    key: "stok_kurang",
                    message: "Melebihi Jumlah Stok Tersedia"
                };
                window.Android.showResponse(JSON.stringify(data));
                $(this).val(""); // Set to max stock amount
            }

           
        });


            $('#form_sample').submit(function(e) {
            e.preventDefault();
            const formData = new FormData(this);
            $.ajax({
                type: 'POST',
                url: route('android.transaksi.store'),
                data: formData,
                contentType: false,
                processData: false,
                dataType: 'json',
                headers: {
                    'Authorization': 'Bearer ' + tokens
                },
                success: (response) => {
                    if (response) {
                        const data = {
                            key: "submit_sukses",
                            message: "Update Stok Berhasil"
                        };
                        window.Android.showResponse(JSON.stringify(data));
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    let errorMessage = `Status: ${jqXHR.status}\n`;
                    errorMessage += `Status Text: ${textStatus}\n`;
                    errorMessage += `Error: ${errorThrown}\n`;
                    errorMessage += `Response Text: ${jqXHR.responseText}\n`;
                    try {
                        let responseJSON = JSON.parse(jqXHR.responseText);
                        errorMessage +=
                            `Response JSON: ${JSON.stringify(responseJSON, null, 2)}`;
                    } catch (e) {
                        errorMessage += `Raw Response Text: ${jqXHR.responseText}`;
                    }
                    
                      const data = {
                            key: "error",
                            message: "Error Update Stok"
                        };
                        window.Android.showResponse(JSON.stringify(data));
                   
                  
                }
            });
        });
        document.getElementById('form_sample').addEventListener('keydown', function(event) {
            // Cek apakah tombol Enter ditekan
            if (event.key === 'Enter') {
                // Mencegah pengiriman form
                event.preventDefault();
                addRow()
            }
        });
        $(document).on('click', '.remove-row', function() {
            $(this).closest('tr').remove();
        });
    })
</script>

</html>
