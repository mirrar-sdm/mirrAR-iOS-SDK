# mirrARSDK Example

# How to import mirrAR iOS SDK
1. Drag and drop the .framework file into your project
2. Xcode project > General > Scroll down to find "Frameworks, Libraries, and Embedded Content" Section > Switch from "Do not Embed" to "Embed & Sign"

# Initialisation
Step 1 -
```
    NSDictionary *options =  @{
        @"productData": @{
                @"Necklaces": @{
                        @"items": @[@"1", @"2", @"3"],
                        @"type": @"neck"
                },
                @"Earrings": @{
                        @"items": @[@"1", @"2"],
                        @"type": @"ear"
                },
                @"Mangalsutras": @{
                        @"items": @[@"1", @"2", @"3"],
                        @"type": @"neck"
                },
                @"NecklaceSets": @{
                        @"items": @[@"1", @"2"],
                        @"type": @"set"
                },
                @"PendantSets": @{
                        @"items": @[@"1", @"2"],
                        @"type": @"set"
                }
        }
    };
```

Step 2 -
```
    NSDictionary *loginParam = @{@"username": @"brand username here",
                                 @"password": @"brand password here",
                                 @"type": @"ios_sdk"
    };
```

Step 3 -
```
    self.camera = [MARCameraViewController sharedInstance];
    self.camera.productData = options;
    self.camera.loginParams = loginParam;
```

Step 4 -
```
    [self.navigationController pushViewController:self.camera animated:NO];
```

# Notes
1. The framework size is 81.9Mb.
2. Minimum iOS version Tested is iOS 12 & Supported version is iOS 10.
3. iOS simulator is not supported (obviously) because it doesn't have a camera. You need an physical iOS device to implement the SDK.
4. Expect lower camera resolution/fps on older devices like iPhone 7.

# License validity along with active product codes & types supported can be determined from this API -
curl --location --request POST 'https://mirrar.styledotme.com/api/v2/login' \
--form 'username=/*login ID*/' \
--form 'password=/*password*/' \
--form 'type=android_sdk'

```
{
  "meta": {
    "code": 200,
    "message": "You have successfully logged in"
  },
  "data": {
    "access_token": ###,
    "uuid": ###,
    "name": ###,
    "webar_status": 0,
    "admin_status": 1,
    "warp_status": 0,
    "instore_status": 1,
    "android_sdk_bundle": "",
    "ios_sdk_bundle": "",
    "webar_sdk_domain": "",
    "max_design_count": 10000,
    "brand_type": "FINE",
    "design_count": 200,
    "logo_url": "https://mirrar.s3.ap-south-1.amazonaws.com/raghav/logo.png",
    "bucket_name": ###,
    "has_subsidiary": 0,
    "instore_expires_at": "2100-01-01 00:00:00",
    "webar_expires_at": "2100-01-01 00:00:00",
    "warp_expires_at": "2100-01-01 00:00:00",
    "active_product_codes": {
      "Earrings": {
        "items": [
          1,
          "112A",
        ],
        "type": "ear"
      },
      "Necklaces": {
        "items": [
          "2CD",
          "XYZA"
        ],
        "type": "neck"
      },
      "Sets": {
        "items": [
          "TEST123"
        ],
        "type": "set"
      }
    }
  }
}
```
Use data from this to populate your `options` key in Initialisation Step 1 above.
