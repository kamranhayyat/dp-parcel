<?php

namespace App\Http\Services;

use App\Models\User;


class PushNotificationService
{
    public function sendPushNotification($data, $topicName, $type)
    {

        if (!empty($topicName)) {
            $topic = env('FCM_TOPIC') . '_' . str_replace(['@', '.', '+'], ['_', '_', ''], $topicName);
        } else {
            $topic = env('FCM_TOPIC');
        }

        $final = array(
            'to' => '/topics/' . $topic,
            'priority' => 'high',
            'notification' => [
                'body' => $data->description,
                'title' => $data->title,
                'sound' => 'Default',
                'image' => $data->image
            ],
        );

        $url = 'https://fcm.googleapis.com/fcm/send';

        $headers = array(
            'Authorization: key=' . env('FCM_SECRET_KEY'),
            'Content-Type: application/json'
        );

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($final));
        $result = curl_exec($ch);

        if ($result === FALSE) {
            die('Curl failed: ' . curl_error($ch));
        }
        curl_close($ch);
        return $result;
    }

    public function sendStatusPushNotification($parcel, $topicName, $msg, $type)
    {
        if (!empty($topicName)) {
            $topic = env('FCM_TOPIC') . '_' . str_replace(['@', '.', '+'], ['_', '_', ''], $topicName);
        } else {
            $topic = env('FCM_TOPIC');
        }

        $final = array(
            'to' => '/topics/' . $topic,
            'priority' => 'high',
            'notification' => [
                "title" => "Your parcel #" . $parcel->tracking_id . " status updated " . trans("parcelStatus." . $parcel->status),
                "body" => $msg,
                'sound' => 'Default',
            ],
        );
        $url = 'https://fcm.googleapis.com/fcm/send';

        $headers = array(
            'Authorization: key=' . env('FCM_SECRET_KEY'),
            'Content-Type: application/json'
        );

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($final));
        $result = curl_exec($ch);

        curl_close($ch);
        return $result;
    }

    public function sendStatusPushNotificationTo($parcel, $topicName, $msg, $type)
    {
        $final = array(
            'to' => $topicName,
            'priority' => 'high',
            'notification' => [
                "title" => "Your parcel #" . $parcel->tracking_id . " status updated " . trans("parcelStatus." . $parcel->status),
                "body" => $msg,
                'sound' => 'Default',
            ],
        );
        $url = 'https://fcm.googleapis.com/fcm/send';

        $headers = array(
            'Authorization: key=' . env('FCM_SECRET_KEY'),
            'Content-Type: application/json'
        );

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($final));
        $result = curl_exec($ch); 
        curl_close($ch);
        return $result;
    }

    public function sendCreatePushNotificationToMessage($topicName, $msg)
    {
        $final = array(
            'to' => $topicName,
            'priority' => 'high',
            'notification' => [
                "title" => "Your parcel",
                "body" => $msg,
                'sound' => 'Default',
            ],
        );
        $url = 'https://fcm.googleapis.com/fcm/send';

        $headers = array(
            'Authorization: key=' . env('FCM_SECRET_KEY'),
            'Content-Type: application/json'
        );

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($final));
        $result = curl_exec($ch);

        curl_close($ch);
        return $result;
    }



    public function fcmSubscribe($request)
    {

        $deviceToken = $request->device_token;
        $topic = env('FCM_TOPIC') . '_' . str_replace(['@', '.', '+'], ['_', '_', ''], $request->topic);


        $headers = array(
            'Authorization: key=' . env('FCM_SECRET_KEY'),
            'Content-Type: application/json'
        );
        $this->fcmGlobalSubscribe($request);
        try {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, "https://iid.googleapis.com/iid/v1/$deviceToken/rel/topics/$topic");
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($ch, CURLOPT_POSTFIELDS, array());
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_exec($ch);
            return response()->json([
                'status' => 200,
                'message' => 'Subscribed',
            ], 200);
        } catch (\Exception $exception) {
            return response()->json([
                'status'  => 401,
                'message' => $exception,
            ], 401);
        }
    }


    public function fcmGlobalSubscribe($request)
    {
        $deviceToken = $request->device_token;
        $topic = env('FCM_TOPIC');

        $headers = array(
            'Authorization: key=' . env('FCM_SECRET_KEY'),
            'Content-Type: application/json'
        );

        try {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, "https://iid.googleapis.com/iid/v1/$deviceToken/rel/topics/$topic");
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($ch, CURLOPT_POSTFIELDS, array());
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_exec($ch);
            return response()->json([
                'status' => 200,
                'message' => 'Global Subscription',
            ], 200);
        } catch (\Exception $exception) {
            return response()->json([
                'status'  => 401,
                'message' => $exception,
            ], 401);
        }
    }
 
    public function fcmUnsubscribe($request)
    {
        $request->validate([
            'device_token' => 'required',
            'topic' => 'nullable',
        ]);

        $deviceToken = $request->token;

        $headers = array(
            'Authorization: key=' . env('FCM_SECRET_KEY'),
            'Content-Type: application/json'
        );

        try {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, "https://iid.googleapis.com/v1/web/iid/$deviceToken");
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'DELETE');
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_exec($ch);

            return response()->json([
                'status' => 200,
                'message' => 'Unsubscribed',
            ], 200);
        } catch (\Exception $exception) {
            return response()->json([
                'status'  => 401,
                'message' => $exception,
            ], 401);
        }
    }

    public function sendWebNotification($data, $notification, $type, $FcmToken)
    {
        $url = 'https://fcm.googleapis.com/fcm/send';

        if (!blank($FcmToken)) {

            $serverKey = env('FCM_SECRET_KEY');
            if ($notification) {
                $pushData = [
                    "registration_ids" => $FcmToken,
                    "notification" => [
                        "title" => "New Parcel #" . $data->id,
                        "body" => 'A new parcel has been placed ' . $data->merchant->title . ' The parcel amount is ' . $data->cash_collection,
                        'sound' => 'default', // Optional
                        'icon' => public_path('images/fav.png'),
                    ]
                ];
            } else {
                $pushData = [
                    "registration_ids" => $FcmToken,
                    "notification" => [
                        "title" => $data->title,
                        "body" => $data->description,
                        'sound' => 'default', // Optional
                        'icon' => $data->image,
                    ]
                ];
            }

            $encodedData = json_encode($pushData);

            $headers = [
                'Authorization:key=' . $serverKey,
                'Content-Type: application/json',
            ];

            $ch = curl_init();

            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
            curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $encodedData);
            // Execute post
            $result = curl_exec($ch);
            // Close connection
            curl_close($ch);
            // FCM response
            return true;
        } else {
            return true;
        }
    }
}
