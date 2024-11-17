
import 'package:googleapis_auth/auth_io.dart';

class GetServerKey {
  Future<String> getServerKeyToken() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging'
    ];
    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "notification-50402",
          "private_key_id": "3b25e71949307a4a8e927e5056b6a5a3f274274a",
          "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCSOvp46H/9FliZ\nlT3D0zFxtA8WvoEkmrJNzFcyZwlRgDgqSDi9zQz6u6dGxJj3TOOWnhbioDcpWuE8\ngS2MY68L2+vEHk89Wt9IJAtW2rA5RrHkts6CH6WRX8t3wJBkPbDAW3U3MBCDccwz\nwh6h98V/e22wjgbpuyHvDJj+d9NFzluD5BDuUGP7DNEHiuooWB8ZW5ASVeDZViai\nKqcgfYrBIPm5eUE4NoWRZHloajY6bXRlbyc3bZ7VeiXLQJTasRuWEeyhfxWDJVy9\nibf3KwnOQ/HU7RwrpvEcJ5JXi9g08kq1hRTMfLroBAOdD0/6Wh2sc8FrhiU2L0JQ\n+9lSIVvRAgMBAAECggEAAwBfc/HfkktOIEDkxTPxLCQFuiw9N/58g1dgqbe6bSUx\naqkfkE3EhcxBhYknsM31rByVUJQ+kIR3qFX/iRGFRurD3XV65Z8LmsKmRmN5dlT0\n3rbYC+oRGr88WF0t8NDJhpwlmjsGPTO5ZbwG7R4nGVnFTz4lPIscrOyeRX0K3+63\ncpRF2DLi0269DzMX65JMweV9GY3BdU5P6AQY/cKCh0QGiCtXv4Nl1UWWQdd5h4/V\nUnYzTNI3gFdf2a2X5gV4TlskmDBWTExuKPiQ1VTGGV5fqaTiKw/TaMU6dQ/x3Frh\nfJe00r9/x59yC3P9cK8jWVP72PXlqj2RHDEC8cn4vQKBgQDJjIf91kl19I4LWheG\niZnx9PisVnwDdHTbonNVKPH5U1Y0OMvZL5KeXLenzk49qWzCSwCkySvMSBMum9xv\nIsGoD5HzJrRC6tafVhS+qhL2epDRo0tyMJxM0+sJOfjptGMbY6tUwVi2GYPJdQRE\nMVqWhdiCFGIl5LeAR1xep2pI5wKBgQC5vIVcNCzDDwnG6u0PaWFCpO+zmEpwWkik\nZh5qDz0JawW4IGwYIaWRO1M9AqPMUkC7FAAJi749icIR2lwdJDPvSzp4JRjcRCgA\nqZkimbmQ2g3lqXB/CHxFL/ImlYNbt45MS4QwEPYszNla385BB6NcOa2ErOFOBysr\ndnlJqDSGhwKBgEiaTwKphpzvE5wTQBY+yy3VyR6LqPC1qsLTqigrL79Yvdzh+Myr\nzm0tiRrxvk2IEp2K1xiFPzm/XOmVS7rdElWwBitI7faNEfMj1yU3rs0LKc/auvrP\nd/5U+H3CXGATkv/yz20gmQw/9LFFbdwCy1cdr/hrz09HLLMRAb03IZpRAoGAV4ZK\nBdgkW8rjXZRpH8EV7xTQS/5w3Z796lKg9HO33I9NQ6Yrqfd5EQY2xGJRE8CS9lWH\navgqLs+S31zZ2XWs74+wvtskau/HNgC1xANS2bqXn+kHtSUngmcEokAEhZzq9nMD\nmK71gskJh/Q9OpHB3nzjksjw5xcjtbh/kUEtd1MCgYAoFb6D8rzBzATbcMF4qCtm\nR4xwsAJ6U6VtbX+VjCqoeO9c2rW7+LPuXnzS/aUo9n+GnxfioODK0pYFyV5Y9FdF\nA+UK7XIygihOrUdYhMTRV0yCNOLKxiDsO7qy6xldUx7f3AvZCNDzlzUJA4VsggKW\n6jCjbLgknj8ytIpn4hEWuw==\n-----END PRIVATE KEY-----\n",
          "client_email": "firebase-adminsdk-nkdg8@notification-50402.iam.gserviceaccount.com",
          "client_id": "101324827489967300890",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-nkdg8%40notification-50402.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }
        ),
        scopes);
    final accessServerKey =  client.credentials.accessToken.data;
    return accessServerKey;
  }
}
