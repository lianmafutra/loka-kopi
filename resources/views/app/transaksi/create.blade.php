<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basic Bootstrap Layout</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Select2 CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet">
</head>
<style>
   .card-footer {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  background-color: #f8f9fa; /* atau warna latar belakang yang Anda inginkan */
  padding: 10px;
  box-shadow: 0 -1px 5px rgba(0, 0, 0, 0.1);
  z-index: 1000; /* Pastikan footer berada di atas elemen lain */
}

.main-content {
  margin-bottom: 90px; /* Sesuaikan dengan tinggi footer */
}
</style>
<body>

   
    <!-- Main Content -->
    <div class="main-content container my-5">
        <div class="row">
            <form id="form_sample" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-lg-8 col-sm-12">
                @csrf
                @method('POST')
                <div class="card">
                    <div class="card-body">

                        {{--
               <x-input label="Judul" id="nama" required /> --}}
                        <table class="table table-bordered"id="products-table">
                            <thead>
                                <tr>
                                    <th>Produk</th>
                                    <th>Jumlah</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td >
                                        <select data-placeholder="Pilih Produk"  style="width: 200px" name="products[0][id]" class="product-select" required>
                                            <option value="">Pilih Produk</option>
                                            @foreach ($products as $product)
                                                <option value="{{ $product->id }}">{{ $product->nama }}</option>
                                            @endforeach
                                        </select>
                                    </td>
                               

                                    <td><input type="number" name="products[0][quantity]" class="form-control" required /></td>
                                    <td>
                                       <button type="button" class="btn btn-danger remove-row remove-tr">
                                          <i class="fas fa-trash-alt"></i>
                                        </button>

                                    </td>
                                 
                                </tr>
                            </tbody>
                        </table>


                    </div>

                    <div class="card-footer">
                     <div style="gap:8px;" class="d-flex">
                       {{-- <a href="{{ route('transaksi.index') }}" type="button" class="btn btn-secondary">Kembali</a> --}}
                       <button type="button" class="btn btn-warning" id="add-row">Tambah</button>
                       <button type="submit" class="btn btn-primary">Simpan</button>
                     </div>
                   </div>
                </div>
            </div>

        </div>
    </form>
        </div>
    </div>

  

   <!-- jQuery -->
   <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
   <!-- Bootstrap JS and Popper.js -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Select2 JS -->
   <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
      $(function() {




        

          $('#form_sample').submit(function(e) {
              e.preventDefault();
              const formData = new FormData(this);
              $.ajax({
                  type: 'POST',
                  url: route('transaksi.store'),
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
                                  'transaksi.index'))
                          })
                      }
                  },
                  error: function(response) {
                      _showError(response)
                  }
              })
          })



          $('.product-select').select2({
            //  theme: 'bootstrap4',
          });
   
          $('#add-row').click(function() {
              var rowCount = $('#products-table tbody tr').length;
              var newRow = `
      <tr>
          <td>
              <select data-placeholder="Pilih Produk" style="width: 200px"  name="products[${rowCount}][id]" class="product-select" required>
                  <option value="">Pilih Produk</option>
                  @foreach ($products as $product)
                      <option value="{{ $product->id }}">{{ $product->nama }}</option>
                  @endforeach
              </select>
          </td>
          <td><input type="number"  class="form-control" name="products[${rowCount}][quantity]" required></td>


          <td>  <button type="button" class="btn btn-danger remove-row remove-tr">
                                          <i class="fas fa-trash-alt"></i>
                                        </button></td>
      </tr>`;
              $('#products-table tbody').append(newRow);
              $('.product-select').select2(); // Reinitialize select2 for new rows
          });

          $(document).on('click', '.remove-row', function() {
              $(this).closest('tr').remove();
          });
      })
  </script>
</body>
</html>
