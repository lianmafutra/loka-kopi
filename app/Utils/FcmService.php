<?php

namespace App\Utils;

use Google_Client;
use GuzzleHttp\Client;

class FcmService
{
    protected $client;
    protected $apiKey;

    public function __construct()
    {
        $this->client = new Client();
        $this->apiKey = 'AAAA_fDbHqA:APA91bFCp-MRblGXJjlsi5t9muBILdIrW732ygBZLwux6zfEWX_j-FOpM9ZwUwrBptOBkdf-0Ey2qE9a9TrzV-k2rhAeYtp8aCHSPe8wejdv8t0-m5pBrYqJ9Nvz9X4iW_3IxboxaIeJ';
    }

    public function sendMessage($to, $title, $body)
    {
        $response = $this->client->post('https://fcm.googleapis.com/v1/projects/eofficejambikota/messages:send', [
            'headers' => [
                'Authorization' => 'Bearer ' . $this->getAccessToken(),
                'Content-Type' => 'application/json',
            ],
            'json' => [
                'message' => [
                    'token' => $to,
                    'notification' => [
                        'title' => $title,
                        'body' => $body,
                    ],
                ],
            ],
        ]);

        return json_decode($response->getBody()->getContents(), true);
    }

    protected function getAccessToken()
    {
        // Load the service account credentials from JSON file
        $credentials = json_decode(file_get_contents(public_path('google-services.json')), true);

        // Use the credentials to get an access token (for simplicity, you might use a library like google/auth)
        // For example:
        $client = new Google_Client();
        $client->setAuthConfig($credentials);
        $client->addScope('https://www.googleapis.com/auth/cloud-platform');
        $client->fetchAccessTokenWithAssertion();

        return $client->getAccessToken()['access_token'];
    }
}

// Penggunaan

// protected $fcmService;

// public function __construct(FcmService $fcmService)
// {
//     $this->fcmService = $fcmService;
// }

// $deviceToken = 'fXrqGqNHRqejBP9qto3jE_:APA91bGpbfn1PqGZmDEuNkxGS8BjIt_XuGG3RnJ30G6JgbMxVsWNS4hH2f7EQEzTUGCffPXv5sVUb7OurqKW5mDtuHLQsuCS0fbxZKaNyyuJB_VxvL4fxzO0zpbs8qF93GTfu14C5xzs';
     
// $to =  $deviceToken;
// $title = "Notif App Sipadek";
// $body ="Informasi";

// $result = $this->fcmService->sendMessage($to, $title, $body);

// return response()->json($result);