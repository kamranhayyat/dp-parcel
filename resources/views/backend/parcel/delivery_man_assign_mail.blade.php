<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ @settings()->title }}</title>
    <style>
            body{
                background-color: aliceblue;
                color:#8094ae;
            }
            a{
                color:#7e0095;
            }
            ul {
                display: inline-block;
                text-align: center;
                overflow: hidden;
                padding-left: 0px;
                margin-bottom: 0px!important;
            }
            ul li{
                float: left;
                list-style: none;
                padding:5px;
            }
            ul li a{
                cursor: pointer;
                display: block;
            }
    </style>
</head>
    <body style="margin: 10;">
        <table style="width:100%;height:50px;max-width:650px;margin: auto;">
                <tr>
                    <td style="text-align: center;padding:30px 10px">
                        <a href="{{ url('/') }}"><img src="{{ static_asset(@settings()->rxlogo->original) }}" style="height: 50px;"/></a>
                    </td>
                </tr>
        </table>
        <table style="width:100%;height:50px;max-width:650px;margin: auto;background-color: white;">
                <tr>
                    <td style="padding:30px;line-height: 1.5;" colspan="2">
                       
                        @if ($data['user_type'] == App\Enums\UserType::MERCHANT)
                        <div>
                            <b>Dear {{ $data['parcel']->merchant->business_name }}  ,</b> parcel with ID  {{ $data['parcel']->tracking_id }}  to ({{ $data['parcel']->customer_name }}) {{ settings()->currency }} {{ $data['parcel']->cash_collection }} delivery man assing by   {{ $data['deliverymanAssign']->deliveryMan->user->name }} , {{ $data['deliverymanAssign']->deliveryMan->user->mobile }} . <br/>
                            Delivery Time:{{ \Carbon\Carbon::parse($data['parcel']->delivery_time)->format('d-m-Y h:i A')}} <br/> 
                            Track here: {{ url('/') }}   - {{ settings()->name }}
                        </div>
                        @elseif ($data['user_type'] == App\Enums\UserType::DELIVERYMAN)
                        <div>
                            <b>Dear  {{ $data['deliverymanAssign']->deliveryMan->user->name }} ,</b> your  parcel with ID  <b>{{ $data['parcel']->tracking_id }}</b> .<br/>
                            Delivery Time:{{ \Carbon\Carbon::parse($data['parcel']->delivery_time)->format('d-m-Y h:i A')}} <br/> 
                             Track here:{{ url('/') }} - {{ settings()->name }}  
                        </div>
                        @endif 
                        <p>Hope you'll enjoy the experience, we're here if you have any questions, drop us a line at <a href="mailto:{{ @settings()->email }}" >{{ @settings()->email }}</a> or {{ @settings()->phone }} anytime.</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p style="text-align: center;text-transform:uppercase">
                            Get download our android or Apple application
                        </p>
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%; text-align: right;padding: 10px 10px 30px 10px;">
                       <a href="#"> <img src="{{ static_asset('backend/images/social-media') }}/play butttom.png" style="width:200px;"/></a>
                    </td>
                    <td style="width: 50%;text-align: left;padding: 10px 10px 30px 10px;">
                        <a href="#"><img src="{{ static_asset('backend/images/social-media') }}/istore.png" style="width:200px" /></a>
                    </td>
                </tr>
        </table>
        <table style="width:100%;height:50px;max-width:650px;margin: auto; ">
                <tr>
                    <td style="text-align: center;">
                        <ul>
                            <li> <a> <img src="{{ static_asset('backend/images/social-media') }}/brand-b.png" style="width: 30px;" />  </a> </li>
                            <li> <a> <img src="{{ static_asset('backend/images/social-media') }}/brand-c.png" style="width: 30px;" />  </a> </li>
                            <li> <a> <img src="{{ static_asset('backend/images/social-media') }}/brand-d.png" style="width: 30px;" />  </a> </li>
                            <li> <a> <img src="{{ static_asset('backend/images/social-media') }}/brand-e.png" style="width: 30px;" />  </a> </li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0px 30px;text-align: center;">
                        <p style="font-size: 13px;">
                            {{ @settings()->copyright }}
                        </p>
                    </td>
                </tr>
        </table>
    </body>
</html>
