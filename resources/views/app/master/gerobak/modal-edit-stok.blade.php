<div class="modal fade" id="modal_edit_stok">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Update Data Stok</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form autocomplete="off" id="form_edit_stok" method="POST">
                @csrf
                @method('POST')
                <div class="modal-body">
                    <section class="content">
                        <div class="container-fluid">
                            <div class="row">
                            
                                <div class="col-md-12">  
                                 <input value="" hidden name="gerobak_stok_id" id="gerobak_stok_id" /> 

                                 <x-input label="Nama Produk" id="nama_produk" placeholder=""  disabled/> 
                                 <x-input label="Gerobak" id="nama_gerobak" placeholder="" disabled /> 
                                 <x-input-number label="Stok Saat Ini" id="stok_sekarang" placeholder="" disabled />

                              <x-input-number label="Perubahan Jumlah Stok" id="stok_update" placeholder=""  requiredGeroba/>
                                 <span class="teks_info_update_stok"></span>
                                 <x-textarea id="update_stok_ket" label="Keterangan (Opsional)" name="update_stok_ket" /> 
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="modal-footer ">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
                    <button id="btn_action" type="submit" class="float-right btn btn-primary">Update Stok</button>
                </div>
            </form>
        </div>
    </div>
</div>
