<x-modal title="Create New Permission" id="modal_create_multi" size="md">
    <form id="form_create_multi_permission">
        @csrf
        <div class="modal-body">
            <input hidden name="multi" value="">
            <input hidden name="permission_group_id">
            <x-textarea id="permissions_multi_name" name='name' placeholder='create,edit,delete,update'
                label='Permission Name' required='true' info='Separate with Comma' />


            <div class="form-group">
                <label>Route Name Basic (Optional)</label>
                <div class="input-group">
                    <div class="custom-file">
                        <input type="text" id="route_name" class="form-control" placeholder="Route Name"
                            aria-describedby="basic-addon2">
                    </div>
                    <div class="input-group-append">
                        <button class="btn_generate_route btn btn-outline-secondary" type="button">Generate</button>
                    </div>
                </div>
            </div>

            @isset($groupIndex)
                <x-select2 id="permission_group_id_multi" label='Select group' required="true" placeholder='Select group'
                    name='permission_group_id'>
                    @foreach ($groupIndex as $item)
                        <option value='{{ $item->id }}'>{{ $item->name }}</option>
                    @endforeach
                </x-select2>
            @endisset
            <div class="form-group">
                <label>Guard</label>
                <select name="guard_name" class="form-control">
                    <option value="web">web</option>
                    <option value="api">api</option>
                </select>
            </div>

        </div>
        <div class="modal-footer">
            <button data-dismiss="modal" type="button" class="btn btn-secondary">Cancel</button>
            <button type="submit" class="btn_submit btn btn-primary">Save</button>
        </div>
    </form>
</x-modal>
<script>
  
    $('.btn_generate_route').click(function(e) {
        e.preventDefault();
        // Input string
        const input = $('#route_name').val();
        
        if (input.trim().length === 0) {
            alert("Route Name Can't Empty")
            return true
        } else {
            // Desired output strings
            const outputStrings = [
                `${input}-create`,
                `${input}-show`,
                `${input}-edit`,
                `${input}-delete`,
                `${input}-list`,
                `${input}-manage`,
            ];

            // Join the output strings with commas
            const output = outputStrings.join(', ');

            $('#permissions_multi_name').val(output);
        }


    });
</script>
