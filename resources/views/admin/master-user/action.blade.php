<style>
   .dropdown-menu.show {
    left: -50px !important;
}
</style>
<x-dropdown-action>

    @can('master-user-forcelogin')
        <li><a data-user="{{ $data->username }}" data-url="{{ route('master-user.force-login', $data->id) }}"
                class="btn_force_login dropdown-item" href="#"> <i class="fas fa-user-secret mr-1"></i>
                 Force Login
                <form hidden id="form-force-login" action="{{ route('master-user.force-login', $data->id) }}" method="POST">
                    @csrf
                    @method('POST')
                    {{-- <input name="user_id" hidden value="{{ $data->id }}"> --}}
                </form>
            </a> </li>
        <div class="dropdown-divider"></div>
    @endcan
    <li><a data-url='{{ route('master-user.edit', $data->id) }}' href="#" class="btn_edit dropdown-item">
            <i class="fas fa-edit"></i> Edit</a> </li>
    @if ($data->status == 'NONAKTIF')
        @php
            $text_status = 'Aktifkan';
            $status = 'AKTIF';
        @endphp
    @elseif ($data->status == 'AKTIF')
        @php
            $text_status = 'Nonaktifkan';
            $status = 'NONAKTIF';
        @endphp
    @endif
    <div class="dropdown-divider"></div>
    <li><a data-status="{{ $text_status }}" data-user="{{ $data->username }}"
            data-url="{{ route('master-user.destroy', $data->id) }}" class="btn_nonaktifkan dropdown-item"
            href="#"><i class="fas fa-user-slash"></i> {{ $text_status }}
            <form hidden id="form-nonaktifkan" action="{{ route('master-user.active-status', $data->id) }}"
                method="POST"> @csrf
                @method('PUT')
                <input name="id" hidden value="{{ $data->id }}">
                <input name="status" hidden value="{{ $status }}">
            </form>
        </a> </li>
    <div class="dropdown-divider"></div>
    <li><a data-id="{{ $data->id }}" href="#" class="btn_reset_password dropdown-item">
            <i class="fas fa-lock-open"></i> Reset
            Password</a> </li>
    <div class="dropdown-divider"></div>
    @can('master-user-forcelogin')
    <li><a data-url='{{ route('master-user.show', $data->id) }}' data-name="{{ $data->username }}"
            data-id="{{ $data->id }}" href="{{ route('master-user.show', $data->id) }}" class="dropdown-item">
            <i class="fas fa-info-circle"></i> Detail </a> </li>
    <div class="dropdown-divider"></div>
    @endcan
    <li><a data-hapus="{{ $data->user }}" data-url="{{ route('master-user.destroy', $data->id) }}"
            class="btn_delete dropdown-item" href="#"> <i class="fas fa-trash-alt"></i> Delete
        </a> </li>

</x-dropdown-action>
