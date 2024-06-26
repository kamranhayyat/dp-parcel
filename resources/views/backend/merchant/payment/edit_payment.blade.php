@section('title')
    {{ __('merchant.title') }} {{ __('merchant.payment_account') }} {{ __('levels.edit') }}
@endsection
@extends('backend.merchant.view')
@section('backend.merchant.layout.list')
  <div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="page-header">
                <div class="page-breadcrumb">
                    <nav aria-label="breadcrumb" class="border-none">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{route('dashboard.index')}}" class="breadcrumb-link">{{ __('levels.dashboard') }}</a></li>
                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">{{ __('merchantmanage.title') }}</a></li>
                            <li class="breadcrumb-item"><a href="{{route('merchant.index') }}" class="breadcrumb-link">{{ __('merchant.title') }}</a></li>
                            <li class="breadcrumb-item"><a href="{{route('merchant.paymentaccount.index',$singleMerchant->id) }}" class="breadcrumb-link">{{ __('merchant.payment_account') }}</a></li>
                            <li class="breadcrumb-item"><a href="" class="breadcrumb-link active">{{ __('levels.edit') }}</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
  <div class="card">
      <div class="card-body">
          <h2 class="pageheader-title">{{ __('levels.edit') }} {{ __('merchant.payment_info') }}</h2>
              <div class="row">
                  <div class="col-12">
                    <input id="merchant_id" type="hidden" name="merchant_id" value="{{ $merchant_id }}" />
                      <div class="form-group  ">
                        <label for="payment_method">{{ __('merchant.payment_method') }}</label> <span class="text-danger"></span>
                        <select id="payment_method" name="payment_method" class="form-control @error('payment_method') is-invalid @enderror" data-url="{{ route('merchant.paymentmethod.change') }}"  >
                            <option>{{ __('merchant.select_payment_method') }}</option>
                            @foreach (\Config::get('merchantpayment.payment_method') as $value)
                                <option value="{{ $value }}"
                                @if(
                                        $errors->has('bank_name')   ||
                                        $errors->has('holder_name') ||
                                        $errors->has('account_no')  ||
                                        $errors->has('branch_name') ||
                                        $errors->has('routing_no')
                                    )
                                    @if ($value ==   $paymentInfo->payment_method)
                                        selected
                                    @endif
                                @elseif(
                                        $errors->has('mobile_company')  ||
                                        $errors->has('mobile_no')       ||
                                        $errors->has('account_type')
                                        )
                                    @if ($value ==  $paymentInfo->payment_method)
                                        selected
                                    @endif
                                @elseif($value == $paymentInfo->payment_method)
                                    selected
                                @endif
                                >{{ __('merchant.'.$value) }}</option>
                             @endforeach
                        </select>
                        @error('payment_method')
                        <small class="text-danger mt-2">{{ $message }}</small>
                        @enderror
                     </div>
                    <div id="info">
                        <input id="editid" type="hidden" name="editid" value="{{ $paymentInfo->id }}" />

                    @if( $paymentInfo->payment_method == 'bank')

                        <form action="{{route('merchant.payment.bank.update')}}"  method="POST" enctype="multipart/form-data" id="basicform"  >
                            @method('PUT')
                            @csrf
                            <input id="merchant_id" type="hidden" name="merchant_id" value="{{ $merchant_id }}" />
                            <input type="hidden" id="payment_method_name"  value="bank"  name="payment_method_name"  />
                            <input  type="hidden" name="editid" value="{{ $paymentInfo->id }}" />
                                <div class="form-group  ">
                                    <label for="bank_name">{{ __('merchant.select_bank') }}</label> <span class="text-danger">*</span>

                                    <select id="bank_name" name="bank_name" class="form-control @error('bank_name') is-invalid @enderror"  >
                                        @foreach (\Config::get('merchantpayment.banks') as $value)
                                            <option value="{{ __('merchant.'.$value) }}"
                                                @if ($paymentInfo->bank_name == __('merchant.'.$value))
                                                    selected
                                                @endif
                                            >{{ __('merchant.'.$value) }}</option>
                                        @endforeach
                                    </select>
                                    @error('bank_name')
                                        <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="holder_name">{{ __('merchant.holder_name') }}</label> <span class="text-danger">*</span>
                                    <input id="holder_name" type="text" name="holder_name" data-parsley-trigger="change" placeholder="{{ __('placeholder.Account_Holder_Name') }}" autocomplete="off" class="form-control" value="{{$paymentInfo->holder_name}}" require>
                                    @error('holder_name')
                                    <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="account_no">{{ __('merchant.account_no') }}.</label> <span class="text-danger">*</span>
                                    <input id="account_no" type="number" name="account_no" data-parsley-trigger="change" placeholder="{{ __('placeholder.Enter_account_no') }}" autocomplete="off" class="form-control" value="{{$paymentInfo->account_no}}" require>
                                    @error('account_no')
                                        <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="branch_name">{{ __('merchant.branch_name') }}</label> <span class="text-danger">*</span>
                                    <input id="branch_name" type="text" name="branch_name" data-parsley-trigger="change" placeholder="{{ __('placeholder.Enter_branch_name') }}" autocomplete="off" class="form-control" value="{{$paymentInfo->branch_name}}" require>
                                    @error('branch_name')
                                    <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="routing_no">{{ __('merchant.routing_no') }}.</label> <span class="text-danger">*</span>
                                    <input id="routing_no" type="number" name="routing_no" data-parsley-trigger="change" placeholder="{{ __('placeholder.Enter_Routing_Number') }}" autocomplete="off" class="form-control" value="{{$paymentInfo->routing_no}}" require>
                                    @error('routing_no')
                                    <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="status">{{__('levels.status')}}</label> <span class="text-danger">*</span>
                                    <select name="status" class="form-control @error('status') is-invalid @enderror">
                                        @foreach(trans('status') as $key => $status)
                                            <option value="{{ $key }}" {{ (old('status',$paymentInfo->status) == $key) ? 'selected' : '' }}>{{ $status }}</option>
                                        @endforeach
                                    </select>
                                    @error('status')
                                    <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-space btn-primary">{{ __('levels.save_change') }}</button>
                                            <a href="{{ route('merchant.paymentaccount.index',$merchant_id) }}" class="btn btn-space btn-secondary">{{ __('levels.cancel') }}</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        @endif
                        @if( $paymentInfo->payment_method   == 'mobile')
                            <form action="{{route('merchant.payment.mobile.update')}}"  method="POST" enctype="multipart/form-data" id="basicform"  >
                                @method('PUT')
                                @csrf
                                    <input  type="hidden" name="editid" value="{{ $paymentInfo->id }}" />
                                    <input id="merchant_id" type="hidden" name="merchant_id" value="{{ $merchant_id }}" />
                                    <input type="hidden" id="payment_method_name"  value="mobile"  name="payment_method_name"  />
                                    <div class="form-group  ">
                                        <label for="mobile_company">{{ __('merchant.select_mobile_company') }}</label> <span class="text-danger">*</span>
                                        <select id="mobile_company" name="mobile_company" class="form-control @error('mobile_company') is-invalid @enderror"  >
                                            @foreach (\Config::get('merchantpayment.account_methods') as $value)
                                                <option value="{{ __('merchant.'.$value) }}"
                                                    @if($value ==  $paymentInfo->mobile_company)
                                                    selected
                                                    @endif
                                                    >{{ __('merchant.'.$value) }}</option>
                                            @endforeach
                                        </select>
                                        @error('mobile_company')
                                            <small class="text-danger mt-2">{{ $message }}</small>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <label for="mobile_holder_name">{{ __('merchant.holder_name') }}</label> <span class="text-danger">*</span>
                                        <input id="mobile_holder_name" type="text" name="mobile_holder_name" data-parsley-trigger="change" placeholder="{{ __('placeholder.Account_Holder_Name') }}" autocomplete="off" class="form-control" value="{{old('mobile_holder_name',$paymentInfo->holder_name)}}" require>
                                        @error('mobile_holder_name')
                                        <small class="text-danger mt-2">{{ $message }}</small>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <label for="mobile_no">{{ __('merchant.mobile_no') }}</label> <span class="text-danger">*</span>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">{{ mobile_prefix() }}</span>
                                            <div class="form-floating">  
                                                <input id="mobile_no" type="number" name="mobile_no" data-parsley-trigger="change" placeholder="{{ __('placeholder.Enter_mobile_number') }}" autocomplete="off" class="form-control input-end-redius" value="{{isset( $paymentInfo)?  $paymentInfo->mobile_no:old('mobile_no')}}" require>
                                            </div>
                                        </div>
                                        @error('mobile_no')
                                            <small class="text-danger mt-2">{{ $message }}</small>
                                        @enderror
                                    </div>
                                    <div class="form-group  ">
                                        <label for="account_type">{{ __('merchant.account_type') }}</label> <span class="text-danger">*</span>
                                        <select id="account_type" name="account_type" class="form-control @error('account_type') is-invalid @enderror"  >
                                            @foreach (\Config::get('merchantpayment.account_types') as $value)
                                                <option value="{{ __('merchant.'.$value) }}" @if( $paymentInfo->account_type == __('merchant.'.$value)) selected @endif>{{ __('merchant.'.$value) }}</option>
                                            @endforeach
                                        </select>
                                        @error('account_type')
                                            <small class="text-danger mt-2">{{ $message }}</small>
                                        @enderror
                                    </div>
                                <div class="form-group">
                                    <label for="status">{{__('levels.status')}}</label> <span class="text-danger">*</span>
                                    <select name="status" class="form-control @error('status') is-invalid @enderror">
                                        @foreach(trans('status') as $key => $status)
                                            <option value="{{ $key }}" {{ (old('status',$paymentInfo->status) == $key) ? 'selected' : '' }}>{{ $status }}</option>
                                        @endforeach
                                    </select>
                                    @error('status')
                                    <small class="text-danger mt-2">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-space btn-primary">{{ __('levels.save_change') }}</button>
                                            <a href="{{ route('merchant.paymentaccount.index',$merchant_id) }}" class="btn btn-space btn-secondary">{{ __('levels.cancel') }}</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        @endif
                        @if ($paymentInfo->payment_method == 'cash')
                            <form action="{{route('merchant.payment.bank.update')}}"  method="POST" enctype="multipart/form-data" id="basicform"  >
                                @method('PUT')
                                @csrf
                                <input id="merchant_id" type="hidden" name="merchant_id" value="{{ $merchant_id }}" />
                                <input type="hidden" id="payment_method_name"  value="cash"  name="payment_method_name"  />
                                <input  type="hidden" name="editid" value="{{ $paymentInfo->id }}" />

                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-space btn-primary">{{ __('levels.save_change') }}</button>
                                            <a href="{{ route('merchant.paymentaccount.index',$merchant_id) }}" class="btn btn-space btn-secondary">{{ __('levels.cancel') }}</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        @endif
                    </div>
                  </div>
            </div>
      </div>
  </div>
@endsection()
@push('scripts')
   <script src="{{ static_asset('backend/js/merchantpayment/create.js') }}"></script>
@endpush

