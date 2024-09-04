<div style=" gap:5px;" class="d-flex justify-content-center">
   <a href="{{ route('tinjuk-chr.edit', $data->hashId) }}" 
        data-toggle="tooltip" data-placement="bottom" title="Edit Data" class="btn btn-sm btn-primary"
><i class="fas fa-pencil-alt"></i> Edit </a>

    <a href="#" data-url="{{ route('tinjuk-chr.destroy', $data->hashId) }}" data-toggle="tooltip"
        data-placement="bottom" title="Delete Data" class="btn btn-sm btn-danger btn_delete" data-id=""
        data-name=""><i class="fas fa-trash"></i> Hapus</a>
</div>
