## gridy-id-dart-api-client

Gridy ID is a Multi-Factor authentication (MFA) API service & Authenticator application for Android, IOS, Windows, MacOS, Linux & Web .

Use Gridy to replace your existing username/password authentication or Integrate Gridy ID into your adaptive authentication workflow in minutes using our API service and clients


## Requirements

* Dart 2.15.0+ or Flutter 2.8.0+
* Dio >=4.0.1 <5.0.0 (https://pub.dev/packages/dio)

## Installation & Usage

### pub.dev
To use the package from [pub.dev](https://pub.dev), please include the following in pubspec.yaml
```yaml
dependencies:
  gridy_id_client: 0.5.0
```

### Github
To use this package from Github, please include the following in pubspec.yaml
```yaml
dependencies:
  gridy_id_client:
    git:
      url: https://github.com/gridytech/gridy-id-dart-api-client.git
      #ref: main
```

### Local development
To use the package from your local drive, please include the following in pubspec.yaml
```yaml
dependencies:
  gridy_id_client:
    path: /path/to/gridy_id_client
```

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:gridy_id_client/gridyapi.dart';

final api = GridyClient()
    .setHmacAuth('<Your 9-digit API User ID>','<Your API Secret Key>')
    .getGridyIDServiceApi();

    ApiRequest request = ApiRequest( (r) =>
    r
      ..id = 'Your refernence ID'
      ..utcTime = DateTime.now()
          .toUtc().millisecondsSinceEpoch
          .toString()
      ..type = API_CHALLENGE_SEND
      ..apiUser = '<Your 9-digit Api User ID>'
      ..body = {
              "gridyUser": "<User Email Address >",
              "challengeType": <"UserKeyAndPattern"|"UserKeyPatternAndPin"|"UserKeyAndUserPin"|"UserKeyAndUserFace"|"UserKeyAndUserVoice" >,
                "challengeExpiry": <"ThreeMins"|"FiveMins"|"TenMins"|"FifteenMins"|"ThirtyMins"|"SixtyMins">,
                "enableQRCode": <true|false>,
                "enableAutoVerify": <true|false>,
                "profile": "<Your Assigned User Profile Reference>",
                "status": "NEW"
            }
    );
    
  try {
    final response = await api.challenge(apiRequest);
    final _dresponse = ApiResponse( (r) =>
    r
      ..id = _response.data?.id
      ..utcTime = _response.data?.utcTime
      ..status = _response.data?.status
      ..message = _response.data?.message
      ..code = _response.data?.code
      ..moreInfo = _response.data?.moreInfo
    );
    
    print(response);
    
  } catch on DioException (e) {
    print("Exception when calling GridyIDServiceApi->challenge: $e\n"); 
  }


```

## Documentation for API Endpoints

All URIs are relative to *https://api.gridy.io/prod*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
[*GridyIDServiceApi*] | [**challenge**](https://support.gridy.io/docs/api/challenge.html) | **POST** /v1/svc/challenge | Send or Cancel a Gridy ID MFA challenge request.
[*GridyIDServiceApi*] | [**status**](https://support.gridy.io/docs/api/status.html) | **POST** /v1/svc/status | Check a Gridy ID MFA challenge status
[*GridyIDServiceApi*] | [**time**](https://support.gridy.io/docs/api/time.html) | **GET** /v1/svc/time | Get current UTC time
[*GridyIDServiceApi*] | [**verify**](https://support.gridy.io/docs/api/verify.html) | **POST** /v1/svc/verify | Verify a Gridy ID authentication code
[*GridyIDServiceApi*] | [**blocked**](https://support.gridy.io/docs/api/blocked.html) | **POST** /v1/svc/blocked | Check IPv4 & User Blocked Rules.


## Documentation For Models

 - [ApiRequest](doc/ApiRequest.md)
 - [ApiResponse](doc/ApiResponse.md)


## Documentation For Authorization


[Authentication](https://support.gridy.io/docs/api/security.html) schemes defined for the API:
### x-gridy-apiuser

- **Type**: GRIDY-HMAC
- **parameter name**: x-gridy-apiuser
- **Location**: HTTP header

### x-gridy-cnonce

- **Type**: GRIDY-HMAC
- **parameter name**: x-gridy-cnonce
- **Location**: HTTP header

### x-gridy-utctime

- **Type**: GRIDY-HMAC
- **parameter name**: x-gridy-utctime
- **Location**: HTTP header

### GridyHmacAuth

- **Type**: GRIDY-HMAC
- **parameter name**: Authorization
- **Location**: HTTP header


## Author
Gridy.io


