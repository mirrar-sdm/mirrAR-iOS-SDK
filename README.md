# mirrARSDK Example

# How to import mirrAR iOS SDK
1. Drag and drop the .framework file into your project
2. Xcode project > General > Scroll down to find "Frameworks, Libraries, and Embedded Content" Section > Switch from "Do not Embed" to "Embed & Sign"

# Initialisation
Step 1 -
```
        NSDictionary *productData =  @{
        @"brandId": @"your-brand-id-here",
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
    self.camera = [MARCameraViewController sharedInstance];
    self.camera.productData = productData;
```

Step 3 -
```
     self.camera.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self.navigationController presentViewController:self.camera animated:YES completion:nil];

```

# To add delegate methods as callback

Step 1- 
Conform to <MARCameraViewControllerDelegate> delegate
```
@interface MARViewController () <MARCameraViewControllerDelegate>
```

Step 2-
Assign self to delegate
```
//Initialize SDK
self.camera = [MARCameraViewController sharedInstance];
self.camera.delegate = self;

```
Step 3-
Implement followinng delegate methods into the viewCotroller where MARCameraViewController is being initialized
(All methods are optional)

```
#pragma mark: MARCameraViewControllerDelegate methods

- (void)didTapDownloadFor:(UIImage *)image {
    NSLog(@"didTapDownloadForImage");
}
- (void)didTapWhatsappToShare:(UIImage *)image {
    NSLog(@"didTapWhatsappToShareForImage");
}
- (void)didTapShareFor:(UIImage *)image {
    NSLog(@"didTapShareForImage");
}
- (void)didTapDetailsFor:(NSString *)productCode {
    NSLog(@"didTapDetailsForId->%@", productCode);
}
- (void)didTapWishlistFor:(NSString *)productCode {
    NSLog(@"didTapWishlistForId->%@", productCode);
}
- (void)didTapCartFor:(NSString *)productCode {
    NSLog(@"didTapCartForId->%@", productCode);
}
- (void)didTapRemoveCartFor:(NSString *)productCode {
    NSLog(@"didTapRemoveCartForId->%@", productCode);
}
- (void)didTapUnWishlistFor:(NSString *)productCode {
    NSLog(@"didTapUnWishlistForId->%@", productCode);
}
- (void)didJewellarySelectedFor:(NSString *)productCode {
    NSLog(@"didJewellarySelectedForId->%@", productCode);
}
- (void)didSDKLoaded {
    NSLog(@"didSDKLoaded....");
}
- (void)didClickBackButton {
    NSLog(@"didClickedBackButton...");
}
- (void)didSubmitReview {
    NSLog(@"didSubmitReview...");
}
- (void)didImageCaptured {
    NSLog(@"didImageCaptured...");
}
```


# Notes
1. The framework size is under 3Mb.
2. Minimum iOS version Tested is iOS 11.
3. Earrings, Necklaces & Sets are supported for devices iOS 11 & above. Rings & Bracelets are supported for devices above iOS 13 & above.
4. iOS simulator is not supported (obviously) because it doesn't have a camera. You need an physical iOS device to implement the SDK & compile the project.
5. Expect lower camera resolution/fps on older devices like iPhone 7.
6. Internet access is required.
7. App needs to have camera permission key in info.plist
```
<key>NSPhotoLibraryUsageDescription</key>
<string>Need library access to save & share images!</string>
<key>NSCameraUsageDescription</key> 
<string>Need camera access for augmented reality!</string>
<key>NSPhotoLibraryAddUsageDescription</key>
<string>We need to access to your gallery to save your AR photos!</string>

```

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
