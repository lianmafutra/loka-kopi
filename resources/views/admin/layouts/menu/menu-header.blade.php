@if (isset($permission) && auth()->user()->getRoleName() != 'superadmin')
    @if (auth()->user()->hasAnyPermission($permission))
        <li class="nav-header ml-2"><i class="fas fa-xs fa-equals"></i> {{ $title }}
        </li>
    @endif
@else
    <li class="nav-header ml-2"><i class="fas fa-xs fa-equals"></i> {{ $title }}
    </li>
@endif
