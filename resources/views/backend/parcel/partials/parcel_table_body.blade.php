<div class="card-body">
    <div class="table-responsive">
        <table id="table" class="table    parcelTable" style="width:100%">
            <thead>
            <tr>
                <th class="parcel-index permission-check-box">
                    <input type="checkbox" id="tick-all" class="form-check-input"/>
                </th>
                <th>{{ __('###') }}</th>
                <th>{{ __('parcel.tracking_id') }}</th>
                <th>{{ __('parcel.recipient_info') }}</th>
                <th>{{ __('parcel.merchant') }}</th>
                <th>{{ __('parcel.amount')}}</th>
                <th>{{ __('parcel.priority') }}</th>
                <th>{{ __('parcel.status') }}</th>
                @if(hasPermission('parcel_status_update') == true)
                    <th>{{ __('parcel.status_update') }}</th>
                @endif
                <th>{{ __('parcel.payment')}}</th>
                <th>{{ __('View Proof of Delivery')}}</th>
            </tr>
            </thead>
            <tbody id="parcels-table-body">
            @php
                $i=1;
            @endphp
            @foreach($parcels as $parcel)
                <tr>
                    <td class="parcel-index permission-check-box">
                        <input type="checkbox" name="parcels[][{{ $parcel->id }}]" value="{{ $parcel->id }}" class="common-key form-check-input" />
                    </td>
                    <td>
                        <div class="row">
                            <button tabindex="-1" data-toggle="dropdown" type="button" class="btn btn-sm ml-2 bnone">...</button>
                            <div class="dropdown-menu">
                                <a href="{{ route('parcel.details',$parcel->id) }}" class="dropdown-item"><i class="fa fa-eye" aria-hidden="true"></i> {{__('levels.view')}}</a>
                                <a href="{{ route('parcel.logs',$parcel->id) }}" class="dropdown-item"><i class="fas fa-history" aria-hidden="true"></i> {{__('levels.parcel_logs')}}</a>
                                <a href="{{ route('parcel.clone',$parcel->id) }}" class="dropdown-item"><i class="fas fa-clone" aria-hidden="true"></i> {{__('levels.clone')}}</a>
                                <a href="{{ route('parcel.print',$parcel->id) }}" class="dropdown-item"><i class="fas fa-print" aria-hidden="true"></i> {{__('levels.print')}}</a>
                                <a href="{{ route('parcel.print-label',$parcel->id) }}" target="_blank" class="dropdown-item"><i class="fas fa-print" aria-hidden="true"></i> {{__('levels.print_label')}}</a>
                                @if(\App\Enums\ParcelStatus::DELIVERED !== $parcel->status && \App\Enums\ParcelStatus::PARTIAL_DELIVERED !== $parcel->status )
                                    @if(hasPermission('parcel_update') == true)
                                        <a href="{{route('parcel.edit',$parcel->id)}}" class="dropdown-item"><i class="fas fa-edit" aria-hidden="true"></i> {{__('levels.edit')}}</a>
                                    @endif
                                    @if(hasPermission('parcel_delete'))
                                        <form id="delete" value="Test" action="{{route('parcel.delete',$parcel->id)}}" method="POST" data-title="{{ __('delete.parcel') }}">
                                            @method('DELETE')
                                            @csrf
                                            <input type="hidden" name="" value="Parcel" id="deleteTitle">
                                            <button type="submit" class="dropdown-item"><i class="fa fa-trash" aria-hidden="true"></i> {{ __('levels.delete') }}</button>
                                        </form>
                                    @endif
                                @endif
                            </div>
                        </div>
                    </td>
                    <td> {{__('levels.track_id')}}: <span class="active">{{ $parcel->tracking_id }}</td>
                    <td class="merchantpayment">
                        <div class="w150">
                            <div class="d-flex">
                                <i class="fa fa-user"></i>&nbsp;<p>{{$parcel->customer_name}}</p>
                            </div>
                            <div class="d-flex">
                                <i class="fas fa-phone"></i>&nbsp;<p>{{$parcel->customer_phone}}</p>
                            </div>
                            <div class="d-flex">
                                <i class="fas fa-map-marker-alt"></i>&nbsp;<p>{{$parcel->customer_address}}</p>
                            </div>
                        </div>
                    </td>
                    <td class="merchantpayment">
                        <p>{{$parcel->merchant->business_name}}</p>
                        <p>{{$parcel->merchant->user->mobile}}</p>
                        <p>{{$parcel->merchant->address}}</p>
                    </td>
                    <td>
                        <div class="w250">
                            {{__('levels.cod')}}: <span class="text-dark">{{settings()->currency}}{{$parcel->cash_collection}}</span>
                            <br>
                            {{__('levels.total_delivery_amount')}}: <span class="text-dark">{{settings()->currency}}{{$parcel->total_delivery_amount}}</span>
                            <br>
                            {{__('levels.vat_amount')}}: <span class="text-dark">{{settings()->currency}}{{$parcel->vat_amount}}</span>
                            <br>
                            {{__('levels.current_payable')}}: <b>{{settings()->currency}}{{$parcel->current_payable}}</b>
                            <br>
                        </div>
                    </td>
                    <td>
                        <div class="form-check form-switch">
                            <input class="form-check-input switch-id" type="checkbox" data-url="{{ route('parcel.priority.status') }}" data-id="{{ $parcel->id }}"  role="switch" value="{{ $parcel->priority_type_id }}"   @if($parcel->priority_type_id == 1) checked @else @endif>
                        </div>
                    </td>
                    <td>{!! $parcel->parcel_status !!} <br>
                        @if($parcel->partial_delivered && $parcel->status != \App\Enums\ParcelStatus::PARTIAL_DELIVERED)
                            <span class="badge badge-pill badge-success mt-2">{{trans("parcelStatus." . \App\Enums\ParcelStatus::PARTIAL_DELIVERED)}}</span>
                        @endif
                        <br/>
                        <span>{{__('parcel.updated_on')}}: {{\Carbon\Carbon::parse($parcel->updated_at)->format('Y-m-d h:i:s A')}}</span>
                    </td>
                    @if(hasPermission('parcel_status_update') == true)
                        <td>
                            @if(\App\Enums\ParcelStatus::DELIVERED !== $parcel->status && \App\Enums\ParcelStatus::PARTIAL_DELIVERED !== $parcel->status && \App\Enums\ParcelStatus::RETURN_RECEIVED_BY_MERCHANT !== $parcel->status)
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend be-addon">
                                        <button tabindex="-1" data-toggle="dropdown" type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split"><span class="sr-only">Toggle Dropdown</span></button>
                                        <div class="dropdown-menu">
                                            {!! parcelStatus($parcel)  !!}
                                        </div>
                                    </div>
                                </div>
                            @else
                                ...
                            @endif
                        </td>
                        <td>
                            @php
                                if($parcel->admin_parcel_invoice !==null && $parcel->admin_parcel_invoice->status == App\Enums\InvoiceStatus::PAID):
                                     $status  = $parcel->admin_parcel_invoice->status;
                                 elseif($parcel->admin_parcel_invoice !==null && $parcel->admin_parcel_invoice->status == App\Enums\InvoiceStatus::UNPAID):
                                     $status  = App\Enums\InvoiceStatus::UNPAID;
                                 elseif($parcel->admin_parcel_invoice !==null):
                                     if($parcel->status == App\Enums\ParcelStatus::DELIVERED || $parcel->status == App\Enums\ParcelStatus::PARTIAL_DELIVERED):
                                         $status  = App\Enums\InvoiceStatus::PROCESSING;
                                     else:
                                         $status  = App\Enums\InvoiceStatus::UNPAID;
                                     endif;
                                 else:
                                     $status  = App\Enums\InvoiceStatus::UNPAID;
                                 endif;
                            @endphp
                            <p>{{ __('invoice.'.$status) }}</p>
                            <span>
                                            {{ @$parcel->admin_parcel_invoice->invoice_id }}<br/>
                                            @if ($parcel->admin_parcel_invoice !==null && $parcel->admin_parcel_invoice->status == App\Enums\InvoiceStatus::PAID)
                                    Paid At: {{ @dateFormat($parcel->admin_parcel_invoice->updated_at) }}
                                @endif
                                        </span>
                        </td>
                    @endif
                    <td>
                        @if( $parcel->status == \App\Enums\ParcelStatus::DELIVERED)
                            <a href="{{route('parcel.deliveredInfo',$parcel->id)}}" class="btn btn-sm btn-warning ml-1 " data-toggle="tooltip" data-placement="top" title="View">{{ __('View') }}</a>
                        @endif
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
        @include('backend.parcel.pickup_assign_modal')
        @include('backend.parcel.collect_to_pickup_modal')
        @include('backend.parcel.pickup_re_schedule')
        @include('backend.parcel.received_by_pickup')
        @include('backend.parcel.transfer_to_hub')
        @include('backend.parcel.received_by_hub')
        @include('backend.parcel.delivery_man_assign')
        @include('backend.parcel.delivery_reschedule')
        @include('backend.parcel.partial_delivered_modal')
        @include('backend.parcel.delivered_modal')
        @include('backend.parcel.received_warehouse')
        @include('backend.parcel.branch_cancel')
        @include('backend.parcel.return_to_qourier')
        @include('backend.parcel.return_assign_to_merchant')
        @include('backend.parcel.re_schedule_return_assign_to_merchant')
        @include('backend.parcel.return_received_by_merchant')
        @include('backend.parcel.transfer_to_hub_multiple_parcel')
        @include('backend.parcel.received_by_hub_multiple_parcel')
        @include('backend.parcel.assign_pickup_bulk')
        @include('backend.parcel.delivery_man_assign_multiple_parcel')
        @include('backend.parcel.assign_return_to_merchant_bulk')
    </div>
</div>
<div class="col-12 mt-3 links">
    <div class="table-responsive">
        <span>{{ $parcels->links() }}</span>
        <p class="p-2 small">
            {!! __('Showing') !!}
            <span class="font-medium">{{ $parcels->firstItem() }}</span>
            {!! __('to') !!}
            <span class="font-medium">{{ $parcels->lastItem() }}</span>
            {!! __('of') !!}
            <span class="font-medium">{{ $parcels->total() }}</span>
            {!! __('results') !!}
        </p>
    </div>
</div>
<script src="{{ static_asset('backend/js/parcel/custom.js') }}"></script>

