@extends('backend.partials.master')
@section('title')
    {{ __('deliveryman.title') }} {{ __('levels.add') }}
@endsection
@section('maincontent')
<div class="container-fluid  dashboard-content">
    <!-- pageheader -->
    <div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="page-header">
                <div class="page-breadcrumb">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{route('dashboard.index')}}" class="breadcrumb-link">{{ __('levels.dashboard') }}</a></li>
                            <li class="breadcrumb-item"><a href="{{ route('deliveryman.index') }}" class="breadcrumb-link">{{ __('deliveryman.title') }}</a></li>
                            <li class="breadcrumb-item"><a href="" class="breadcrumb-link active">{{ __('levels.create') }}</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- end pageheader -->
    <div class="row">
        <!-- basic form -->
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h2 class="pageheader-title"> {{ __('deliveryman.create_deliveryman') }}</h2>
                    <form action="{{route('deliveryman.store')}}"  method="POST" enctype="multipart/form-data" id="basicform">
                        @csrf
                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="Name">{{ __('levels.name') }}</label> <span class="text-danger">*</span>
                                    <input id="name" type="text" name="name" data-parsley-trigger="change" placeholder="{{ __('placeholder.Enter_name') }}" autocomplete="off" class="form-control @error('name') is-invalid @enderror" value="{{old('name')}}" require>
                                    @error('name')
                                    <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <label for="email">{{ __('levels.email') }}</label> <span class="text-danger">*</span>
                                    <input id="email" type="text" name="email" data-parsley-trigger="change" placeholder="{{ __('placeholder.enter_email') }}" autocomplete="off" class="form-control @error('email') is-invalid @enderror" value="{{old('email')}}">
                                    @error('email')
                                    <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="return_charge">{{ __('levels.return_charge') }}</label>
                                    <input id="return_charge" type="number" step="any" name="return_charge" data-parsley-trigger="change" placeholder="{{ __('placeholder.Enter_return_charge') }}" autocomplete="off" class="form-control @error('return_charge') is-invalid @enderror" value="{{old('return_charge')}}">
                                    @error('return_charge')
                                    <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="opening_balance">{{ __('levels.opening_balance') }}</label>
                                    <input id="opening_balance" type="number" step="any" name="opening_balance" data-parsley-trigger="change" placeholder="{{ __('placeholder.Enter_opening_balance') }}" autocomplete="off" class="form-control @error('opening_balance') is-invalid @enderror" value="{{old('opening_balance')}}">
                                    @error('opening_balance')
                                    <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>

                                <div class="form-group pt-1">
                                    <label for="input-select">{{ __('levels.salary') }}</label>
                                    <input type="number" class="form-control" placeholder="{{ __('salary.title') }}" name="salary" />
                                    @error('salary')
                                        <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div >


                                <div class="form-group">
                                    <label for="input-select">{{ __('levels.hub') }}</label> <span class="text-danger">*</span>
                                    <select class="form-control @error('hub_id') is-invalid @enderror" id="input-select" name="hub_id"  required>
                                        @foreach($hubs as $hub)
                                            <option value="{{$hub->id}}" {{ (old('hub_id') == $hub->id) ? 'selected' : '' }}>{{$hub->name}}</option>
                                        @endforeach
                                    </select>
                                    @error('hub')
                                    <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <label for="image">{{ __('levels.image') }}</label>
                                    <input id="image_id" type="file" name="image_id" data-parsley-trigger="change" autocomplete="off" class="form-control" value="{{ old('image_id') }}" require>
                                    @error('image_id')
                                    <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <label for="address" class="col-form-label text-sm-right">{{ __('levels.address') }}</label> <span class="text-danger">*</span>
                                    <input type="hidden" id="lat" name="lat" required="" value="">
                                    <input type="hidden" id="long" name="long" required="" value="">
                                    <div class="main-search-input-item location location-search">
                                        <div id="autocomplete-container" class="form-group random-search">
                                            <input id="autocomplete-input" type="text" name="address" class="recipe-search2 form-control" placeholder="Location Here!" required="">
                                            <a href="javascript:void(0)" class="submit-btn btn current-location" id="locationIcon" onclick="getLocation()">
                                                <i class="fa fa-crosshairs"></i>
                                            </a>
                                            @error('address')
                                            <small class="text-danger mt-2">{{ $message }}</small>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="">
                                        <div id="googleMap" class="custom-map"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">

                                <div class="form-group">
                                    <label for="mobile">{{ __('levels.phone') }}</label> <span class="text-danger">*</span>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">{{  mobile_prefix() }}</span>
                                        <div class="form-floating">
                                            <input id="mobile" type="number" name="mobile" data-parsley-trigger="change" placeholder="{{ __('placeholder.Enter_phone') }}" autocomplete="off" class="form-control input-end-redius @error('mobile') is-invalid @enderror" value="{{old('mobile')}}">
                                        </div>
                                    </div>
                                    @error('mobile')
                                        <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>
 
                                <div class="form-group">
                                    <label for="delivery_charge">{{ __('levels.delivery_charge') }}</label>
                                    <input id="delivery_charge" type="number" step="any" name="delivery_charge" data-parsley-trigger="change" placeholder="{{ __('placeholder.Enter_delivery_charge') }}" autocomplete="off" class="form-control @error('delivery_charge') is-invalid @enderror" value="{{old('delivery_charge')}}">
                                    @error('delivery_charge')
                                    <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="pickup_charge">{{ __('levels.pickup_charge') }}</label>
                                    <input id="pickup_charge" type="number" step="any" name="pickup_charge" data-parsley-trigger="change" placeholder="{{ __('placeholder.Enter_pickup_charge') }}" autocomplete="off" class="form-control @error('pickup_charge') is-invalid @enderror" value="{{old('pickup_charge')}}">
                                    @error('pickup_charge')
                                    <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="email">{{ __('levels.password') }}</label> <span class="text-danger">*</span>
                                    <input id="password" type="password" name="password" data-parsley-trigger="change" placeholder="{{ __('placeholder.Enter_password') }}" autocomplete="off" class="form-control @error('password') is-invalid @enderror" value="{{old('password')}}">
                                    @error('password')
                                    <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="status">{{ __('levels.status') }}</label> <span class="text-danger">*</span>
                                    <select name="status" class="form-control @error('status') is-invalid @enderror">
                                        @foreach(trans('status') as $key => $status)
                                            <option value="{{ $key }}" {{ (old('status',\App\Enums\Status::ACTIVE) == $key) ? 'selected' : '' }}>{{ $status }}</option>
                                        @endforeach
                                    </select>
                                    @error('status')
                                    <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="driving_license_image_id">{{ __('levels.driving_license') }}</label>
                                    <input id="driving_license_image_id" type="file" name="driving_license_image_id" data-parsley-trigger="change" autocomplete="off" class="form-control @error('driving_license_image_id') is-invalid @enderror " value="{{ old('driving_license_image_id') }}" require>
                                    @error('driving_license_image_id')
                                    <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>

                                <div id="documents">
                                    <div class="form-group" id="document">
                                        <label>{{ __('levels.documents') }}</label>
                                        <div class="d-flex">
                                            <input   type="file" name="documents[]" data-parsley-trigger="change" autocomplete="off" class="form-control ">
                                            <label class="btn btn-sm btn-primary" id="add_document"><i class="fa fa-plus"></i></label>
                                        </div> 
                                    </div> 
                                    @error('documents')
                                        <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>
                            </div>
                        </div>
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                    <button type="submit" class="btn btn-space btn-primary">{{ __('levels.save') }}</button>
                                    <a href="{{ route('deliveryman.index') }}" class="btn btn-space btn-secondary">{{ __('levels.cancel') }}</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- end basic form -->
    </div>
</div>
@endsection()
@push('styles')
    <style>
        .main-search-input-item {
            flex: 1;
            margin-top: 3px;
            position: relative;
        }

        #autocomplete-container,
        #autocomplete-input {
            position: relative;
            z-index: 101;
        }

        .main-search-input input,
        .main-search-input input:focus {
            font-size: 16px;
            border: none;
            background: #fff;
            margin: 0;
            padding: 0;
            height: 44px;
            line-height: 44px;
            box-shadow: none;
        }
        .input-with-icon i,
        .main-search-input-item.location a {
            padding: 5px 10px;
            z-index: 101;
        }
        .main-search-input-item.location a {
            position: absolute;
            right: -50px;
            top: 40%;
            transform: translateY(-50%);
            color: #999;
            padding: 10px;
        }
        .current-location {
            margin-right: 50px;
            margin-top: 5px;
            color: #FFCC00 !important;
        }
        .custom-map {
            width: 100%;
            height: 17rem;
        }
        .pac-container {
            width: 295px;
            position: absolute;
            left: 0px !important;
            top: 28px !important;
        }
    </style>
@endpush
@push('scripts')
<script type="text/javascript">
    
    $('#add_document').click(function(){ 
        var input = $('#document input')[0]; 
        var row  = '';
            row += '<div class="form-group">';
            row += '<div class="d-flex">';
            row += '<input type="file" name="documents[]" data-parsley-trigger="change" autocomplete="off" class="form-control ">';
            row += '<a href="javascript:void(0)" class="document_cancel"><i class="fa fa-times text-danger" style="padding:10px"></i></a>';
            row += '</div>';
            row += '</div>';  
        $('#documents').append(row);

        $('.document_cancel').click(function(){
            $(this).closest('.form-group').remove();
        });
        
    });
 
 
</script>
    <script>
        var mapLat = '';
        var mapLong = '';
    </script>
    <script type="text/javascript" src="{{ static_asset('backend/js/map/map-current.js') }}"></script>

    <script async src="https://maps.googleapis.com/maps/api/js?key={{ googleMapSettingKey() }}&libraries=places&callback=initMap">
    </script>

@endpush
