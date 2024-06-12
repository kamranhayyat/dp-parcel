@extends('backend.partials.master')
@section('title')
   {{ __('merchant.title') }} {{ __('permissions.permissions') }}
@endsection
@section('maincontent')

<div class="container-fluid  dashboard-content">
    <div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="page-header">
                <div class="page-breadcrumb">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{route('dashboard.index')}}" class="breadcrumb-link">{{ __('levels.dashboard') }}</a></li>
                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">{{ __('merchantmanage.title') }}</a></li>
                            <li class="breadcrumb-item"><a href="{{ route('merchant.index') }}" class="breadcrumb-link">{{ __('merchant.title') }}</a></li>
                            <li class="breadcrumb-item"><a href="" class="breadcrumb-link active">{{ __('permissions.permissions') }}</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <div class="row">

        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="card">
                <div class="row pl-4 pr-4 pt-4">
                    <div class="col-6">
                        <p class="h3">{{ __('merchant.title') }} {{ __('permissions.permissions') }}</p>
                    </div>
                </div>
                <div class="card-body">
                    <form action="{{route('merchant.permissions.update',['id'=>$user->id])}}"  method="POST" enctype="multipart/form-data" id="basicform">
                        @csrf
                        @method('PUT')
                        <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="">
                                        <table class="table  border  permission-table" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th>{{ __('permissions.modules') }}</th>
                                                    <th>{{ __('permissions.permissions') }}</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                @foreach ($permissions as $key=>$permission )
                                                    <tr>
                                                        <td>{{__('permissions.'.$key) }}</td>
                                                        <td>
                                                           
                                                            @foreach ($permission as $keys=>$keyword)
                                                             
                                                                <div class="row align-items-center permission-check-box pb-2 pt-2"  >
                                                                    <input  id="{{ $keyword }}" class="read common-key form-check-input" type="checkbox" value="{{ $keyword }}" name="permissions[]" @if(in_array($keyword,$user->permissions??[])) checked @endif  />
                                                                    <label for="{{ $keyword }}">{{ __('permissions.'.$keys) }}</label>
                                                                </div>
                                                            @endforeach
                                                        </td>
                                                    </tr>
                                                @endforeach
 
                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 text-right ">
                                <button type="submit" class="btn btn-space btn-primary">{{ __('levels.submit') }}</button>
                                <a href="{{ route('merchant.index') }}" class="btn btn-space btn-secondary">{{ __('levels.cancel') }}</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection()

@push('scripts')
    <script src="{{ static_asset('backend/js/roles/roles.js') }}"></script>
@endpush

