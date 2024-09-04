<div style=" gap:5px;" class="d-flex justify-content-center">

    @if ($actions['edit'])
        @can($actions['route'] . '-edit')
            <a href="{{ route($actions['route'] . '.edit', $data->hashId) }}" data-toggle="tooltip" data-placement="bottom"
                title="Edit Data" class="btn btn-sm btn-primary"><i class="fas fa-pencil-alt"></i> Edit </a>
        @endcan
    @endif

    @if ($actions['delete'])
        @can($actions['route'] . '-delete')
            <a href="#" data-url="{{ route($actions['route'] . '.destroy', $data->hashId) }}" data-toggle="tooltip"
                data-placement="bottom" title="Delete Data" class="btn btn-sm btn-danger btn_delete" data-id=""
                data-name=""><i class="fas fa-trash"></i> Hapus</a>
        @endcan
    @endif


    @if ($actions['show'])
        @can($actions['route'] . '-show')
            <a href="#" data-url="{{ route($actions['route'] . '.show', $data->hashId) }}" data-toggle="tooltip"
                data-placement="bottom" title="Delete Data" class="btn btn-sm btn-danger btn_show"><i
                    class="fas fa-trash"></i> Show</a>
        @endcan
    @endif


</div>
