@section('title')
    {{ __('merchant.title') }} {{ __('merchantshops.title') }} {{ __('levels.edit') }}
@endsection
@extends('backend.merchant.view')
@section('backend.merchant.layout.list')

    <div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="page-header">
                <div class="page-breadcrumb">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{route('dashboard.index')}}" class="breadcrumb-link">{{ __('levels.dashboard') }}</a></li>
                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">{{ __('merchantmanage.title') }}</a></li>
                            <li class="breadcrumb-item"><a href="{{route('merchant.index') }}" class="breadcrumb-link">{{ __('merchant.title') }}</a></li>
                            <li class="breadcrumb-item"><a href="{{route('merchant.shops.index',$singleMerchant->id) }}" class="breadcrumb-link">{{ __('merchantshops.title') }}</a></li>
                            <li class="breadcrumb-item"><a href="" class="breadcrumb-link active">{{ __('levels.edit') }}</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <h2 class="pageheader-title">{{ __('merchantshops.edit_shops') }}</h2>
            <form action="{{route('merchant.shops.update')}}"  method="POST" enctype="multipart/form-data" id="basicform">
                @method('PUT')
                @csrf
                <div class="row">
                    <div class="col-12">
                        <input type="hidden" name="merchant_id" value="{{ $edit_shop->merchant_id }}" />
                        <input type="hidden" name="id" value="{{ $edit_shop->id }}" />
                        <div class="form-group">
                            <label for="name">{{ __('levels.name') }}</label> <span class="text-danger">*</span>
                            <input id="name" type="text" name="name" data-parsley-trigger="change" placeholder="{{ __('placeholder.Enter_name') }}" autocomplete="off" class="form-control" value="{{$edit_shop->name}}" require>
                            @error('name')
                            <small class="text-danger mt-2">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="contact">{{ __('merchantshops.contact') }}</label> <span class="text-danger">*</span>
                            <div class="input-group mb-3">
                                <span class="input-group-text">{{ mobile_prefix() }}</span>
                                <div class="form-floating">
                                    <input id="contact" type="number" name="contact_no" data-parsley-trigger="change" placeholder="{{ __('placeholder.Enter_contact_no') }}" autocomplete="off" class="form-control input-end-redius" value="{{$edit_shop->contact_no}}" require>
                                </div>
                            </div>
                            @error('contact_no')
                                <small class="text-danger mt-2">{{ $message }}</small>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label for="address" class="col-form-label text-sm-right">{{ __('levels.address') }}</label> <span class="text-danger">*</span>
                            <input type="hidden" id="lat" name="lat" required="" value="{{ $edit_shop->merchant_lat }}">
                            <input type="hidden" id="long" name="long" required="" value="{{ $edit_shop->merchant_long }}">
                            <div class="main-search-input-item location location-search">
                                <div id="autocomplete-container" class="form-group random-search">
                                    <input id="autocomplete-input" type="text" name="address" value="{{$edit_shop->address}}" class="recipe-search2 form-control" placeholder="Location Here!" required="">
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
                        <div class="form-group">
                            <label for="contact">{{ __('merchantshops.district') }}</label> <span class="text-danger">*</span>
                            <select id="district_id" name="district_id" data-parsley-trigger="change" require class="form-control">
                                @foreach($districts as $district)
                                    <option value="{{ $district->id }}" {{ (old('district_id', $edit_shop->district_id) == $district->id) ? 'selected' : '' }}>
                                        {{ $district->sector }}
                                    </option>
                                @endforeach
                            </select>
                            @error('district')
                            <small class="text-danger mt-2">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="city_id">{{ __('Territory City') }}</label> <span class="text-danger">*</span>
                            <select id="city_id" name="city_id" data-parsley-trigger="change" require class="form-control">
                                @foreach($cities as $city)
                                    <option value="{{ $city->id }}" {{ (old('district_id', $edit_shop->city_id) == $city->id) ? 'selected' : '' }}>
                                        {{ $city->name }}
                                    </option>
                                @endforeach
                            </select>
                            @error('city_id')
                            <small class="text-danger mt-2">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="status">{{__('levels.status')}}</label> <span class="text-danger">*</span>
                            <select name="status" class="form-control @error('status') is-invalid @enderror">
                                @foreach(trans('status') as $key => $status)
                                    <option value="{{ $key }}" {{ (old('status',$edit_shop->status) == $key) ? 'selected' : '' }}>{{ $status }}</option>
                                @endforeach
                            </select>
                            @error('status')
                            <small class="text-danger mt-2">{{ $message }}</small>
                            @enderror
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <button type="submit" class="btn btn-space btn-primary">{{ __('levels.save_change') }}</button>
                            <a href="{{ route('merchant.view',$merchant_id) }}" class="btn btn-space btn-secondary">{{ __('levels.cancel') }}</a>
                        </div>
                    </div>
            </form>
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
    <script>
        var mapLat = '{{ $edit_shop->merchant_lat }}'
        var mapLong = '{{ $edit_shop->merchant_long }}'
    </script>
    <script type="text/javascript" src="{{ static_asset('backend/js/map/map-current.js') }}"></script>
    <script>
        var territoryCityUrl = '{{ route('merchant.shops.territory.cities') }}';
    </script>
    <script type="text/javascript" src="{{ static_asset('backend/js/merchant/shops/create.js') }}"></script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key={{ googleMapSettingKey() }}&libraries=places&callback=initMap">
    </script>

@endpush
