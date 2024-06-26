<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Http\Services\SmsService;
use Illuminate\Http\Request;
use App\Http\Requests\Merchant\StoreRequest;
use App\Http\Requests\Merchant\SignUpRequest;
use App\Http\Requests\Merchant\UpdateRequest;
use App\Http\Requests\Merchant\OtpRequest;
use App\Mail\MerchantSignup;
use App\Models\Backend\Merchant;
use App\Models\User;
use App\Repositories\Merchant\MerchantInterface;
use Illuminate\Support\Facades\Mail;
use Brian2694\Toastr\Facades\Toastr;
use Database\Seeders\PermissionSeeder;

class MerchantController extends Controller
{
    protected $repo;
    public function __construct(MerchantInterface $repo)
    {
        $this->repo = $repo;
    }

    public function index()
    {
        $merchants = $this->repo->all();
        return view('backend.merchant.index',compact('merchants'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $hubs = $this->repo->all_hubs();

        return view('backend.merchant.create', compact('hubs'));
    }

    public function signUp(Request $request)
    {

        $hubs       = $this->repo->all_hubs();
        return view('backend.merchant.sign_up',compact('hubs','request'));
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreRequest $request)
    {

        if($this->repo->store($request)){

            Toastr::success(__('merchant.added_msg'),__('message.success'));
            return redirect()->route('merchant.index');
        }else{
            Toastr::error(__('merchant.error_msg'),__('message.error'));
            return redirect()->back()->withInput($request->all());
        }

    }


    public function signUpStore(SignUpRequest $request)
    {
        if($this->repo->signUpStore($request)){
            return redirect()->route('merchant.otp-verification-form');
        }else{
            Toastr::error(__('merchant.error_msg'),__('message.error'));
            return redirect()->back()->withInput($request->all());
        }
    }


    public function otpVerification(OtpRequest $request)
    {
        $result     = $this->repo->otpVerification($request);
        if($result != null){
            if(auth()->attempt([
                                'mobile' => $result->mobile,
                                'password' => session('password')
                            ]))
            {
                return redirect()->route('login');
            }
        }
        elseif($result == 0){
            return redirect()->route('merchant.otp-verification-form')->with('warning', 'Invalid OTP');
        }
        else{
            Toastr::error(__('merchant.error_msg'),__('message.error'));
            return redirect()->back();
        }
    }

    public function otpVerificationForm()
    {
        return view('backend.merchant.verification');
    }

    public function resendOTP(Request $request)
    {
        $this->repo->resendOTP($request);
        return redirect()->route('merchant.otp-verification-form')->with('success', 'Resend OTP');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function view($id)
    {
        $singleMerchant = $this->repo->get($id);
        $merchant_shops =$this->repo->merchant_shops_get($id);
        if(blank($singleMerchant)){
            abort(404);
        }
        return view('backend.merchant.merchant-details',compact('singleMerchant','merchant_shops'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $hubs     = $this->repo->all_hubs();
        $merchant = $this->repo->get($id);
        if(blank($merchant)){
            abort(404);
        }
        return view('backend.merchant.edit',compact('merchant','hubs'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update($id, UpdateRequest $request)
    {

        if($this->repo->update($id,$request)){
            Toastr::success(__('merchant.update_msg'),__('message.success'));
            return redirect()->route('merchant.index');
        }else{
            Toastr::error(__('merchant.error_msg'),__('message.error'));
            return redirect()->back();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if($this->repo->delete($id)){
            Toastr::success(__('merchant.delete_msg'),__('message.success'));
            return back();
        }else{
            Toastr::error(__('merchant.error_msg'),__('message.error'));
            return redirect()->back();
        }
    }
 
    public function permissions($id){
        $data                = [];
        $merchant            = Merchant::find($id);
        $data['user']        = User::find($merchant->user_id);
        $data['permissions'] = (new PermissionSeeder)->merchantPermissions(); 
        return view('backend.merchant.permissions',$data);
    }
 
    public function permissionsUpdate(Request $request){
        if($this->permissionUpdate($request->id,$request)){
            Toastr::success('Permissions successfully updated.',__('message.success'));
            return redirect()->route('merchant.index');
        }else{
            Toastr::error('Something went wrong.',__('message.error'));
            return redirect()->back();
        }
    }

    public function permissionUpdate($id,$request){ 
        try {
            $user=User::where('id',$id)->first();
            if($request->permissions !==null){
                $user->permissions =$request->permissions;
            }else{
                $user->permissions =[];
            }
            $user->save();
            return true;

        } catch (\Throwable $th) {
          return false;
        }
    }
 
 
}
