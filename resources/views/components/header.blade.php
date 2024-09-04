<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <div class="d-flex flex-row align-items-center">
                    @if ($backButton == 'true')
                        <div class="p-2"><a href="{{ url()->previous() }}"><i class="fas fa-arrow-left"></i></a></div>
                    @else
                    @endif
                    <div class="p-2">
                        <h5 class="m-0 header-font"> {{ $title }}</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
