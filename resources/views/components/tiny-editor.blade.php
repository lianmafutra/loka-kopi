<div class="form-group">
    <label>{{ $label }}
        @if ($attributes['required'] == 'true')
            <span style="color: red">*</span>
        @endif
    </label>
    <textarea name="{{ $name }}"id="{{ $id }}"></textarea>
    <span class="text-danger error error-text {{ $id }}_err"></span>
</div>
