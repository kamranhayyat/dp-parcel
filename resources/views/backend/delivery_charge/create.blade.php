@extends('backend.partials.master')
@section('title')
    {{ __('delivery_charge.title') }} {{ __('levels.add') }}
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
                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">{{__('menus.settings')}}</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('delivery-charge.index') }}" class="breadcrumb-link">{{ __('delivery_charge.title') }}</a></li>
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
                        <h2 class="pageheader-title">{{ __('delivery_charge.create_delivery_charge') }}</h2>
                        <form action="{{route('delivery-charge.store')}}"  method="POST" enctype="multipart/form-data" id="basicform">
                            @csrf
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="category">{{ __('levels.category') }}</label> <span class="text-danger">*</span>
                                        <select id="category" name="category" class="form-control @error('category') is-invalid @enderror">
                                            <option selected disabled>{{ __('menus.select') }}</option>
                                            @foreach($categories as $key => $value)
                                                <option value="{{ $key }}" {{ old('category') == $key ? 'selected' : '' }} data-value="{{ $key }}">
                                                    {{ $value }}
                                                </option>
                                            @endforeach
                                        </select>
                                        @error('category')
                                        <small class="text-danger mt-2">{{ $message }}</small>
                                        @enderror
                                    </div>
                                    <div class="form-group d-none" id="sub-cat-group">
                                        <label for="sub_category">{{ __('levels.sub_category') }}</label> <span class="text-danger">*</span>
                                        <select id="sub_category" name="sub_category" class="form-control @error('sub_category') is-invalid @enderror">
                                            <option selected disabled>{{ __('menus.select') }}</option>
                                            @foreach($subCategories as $key => $value)
                                                <option value="{{ $key }}" {{ old('sub_category') == $key ? 'selected' : '' }}>
                                                    {{ $value }}
                                                </option>
                                            @endforeach
                                        </select>
                                        @error('sub_category')
                                        <small class="text-danger mt-2">{{ $message }}</small>
                                        @enderror
                                    </div>
                                    <input type="hidden" id="category_slug" name="category_slug" value="{{ old('category_slug') }}">
                                    <div class="form-group" id="weight_group">
                                        <label for="first_kg">{{ __('levels.first_kg') }}</label> <span class="text-danger">*</span>
                                        <input id="first_kg" type="number" name="first_kg" data-parsley-trigger="change" placeholder="{{ __('placeholder.Enter_rate') }}" autocomplete="off" class="form-control" value="{{old('first_kg')}}" require>
                                        @error('first_kg')
                                        <small class="text-danger mt-2">{{ $message }}</small>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="other_kg">{{ __('levels.other_kg') }}</label> <span class="text-danger">*</span>
                                        <input id="other_kg" type="number" name="other_kg" data-parsley-trigger="change" placeholder="{{ __('placeholder.Enter_rate') }}" autocomplete="off" class="form-control" value="{{old('other_kg')}}" require>
                                        @error('other_kg')
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
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                    <button type="submit" class="btn btn-space btn-primary">{{ __('levels.save') }}</button>
                                    <a href="{{ route('delivery-charge.index') }}" class="btn btn-space btn-secondary">{{ __('levels.cancel') }}</a>
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

@push('scripts')
    <script src="{{ static_asset('backend/js/deliveryCharge/delivery_charge.js') }}"></script>
@endpush
