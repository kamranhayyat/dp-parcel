<div class="modal fade" id="parcelstatus{{ \App\Enums\ParcelStatus::COLLECT_TO_PICKUP }}"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" id="data-modal">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">{{ __('parcel.collect_to_pickup') }}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{ route('parcel.collect_to_pickup',['page'=>$request->page,'filter'=>$request->filter? $request->filter:'']) }}" method="post">
                @csrf
                <input type="hidden" class="modal_parcel_id" id="modal_parcel_id" value="" name="parcel_id" />
                <div class="modal-body">
                    <div class="form-group  ">
                        <label for="note">{{ __('parcel.note')}}</label>
                        <div class="form-control-wrap deliveryman-search">
                            <textarea class="form-control" name="note" rows="5"></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="custom-control custom-checkbox">
                                    <input id="send_sms_pickuman" name="send_sms_pickuman" class="custom-control-input" type="checkbox"><span class="custom-control-label">Send SMS for pickup man</span>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="custom-control custom-checkbox">
                                    <input id="send_sms_merchant" name="send_sms_merchant" class="custom-control-input" type="checkbox"><span class="custom-control-label">Send SMS for merchant </span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ __('levels.cancel') }} </button>
                    <button type="submit" class="btn btn-primary">{{ __('levels.save') }}</button>
                </div>
            </form>
        </div>
    </div>
</div>
