//
//  ViewController.m
//  mirrARExample
//
//  Created by Vineet on 11/07/20.
//  Copyright © 2020 mirrARSDK. All rights reserved.
//

#import "ViewController.h"
#import <mirrARSDK/MARCameraViewController.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <MARCameraViewControllerDelegate>
@property (strong, nonatomic) MARCameraViewController *camera;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"mirrAR SDK";
}

- (IBAction)launchSDK:(id)sender {
    if (@available(iOS 14.3, *)) {
        [self checkCameraAuthorization];
    } else {
        [self launchMirrarSDK];
    }
}

-(void) checkCameraAuthorization {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(status == AVAuthorizationStatusAuthorized) { // authorized
        dispatch_async(dispatch_get_main_queue(), ^{
            [self launchMirrarSDK];
        });
    } else if(status == AVAuthorizationStatusDenied){ // denied
        if ([AVCaptureDevice respondsToSelector:@selector(requestAccessForMediaType: completionHandler:)]) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self launchMirrarSDK];
                    });
                } else {
                    // Permission has been denied.
                    NSLog(@"DENIED");
                }
            }];
        }
    } else if(status == AVAuthorizationStatusRestricted){ // restricted
    } else if(status == AVAuthorizationStatusNotDetermined){ // not determined
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if(granted){ // Access has been granted ..do something
                NSLog(@"camera authorized");
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self launchMirrarSDK];
                });
            } else { // Access denied ..do something
            }
        }];
    }
}

- (void)launchMirrarSDK {
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

    //Initialize SDK
    self.camera = [MARCameraViewController sharedInstance];
    self.camera.delegate = self;
    self.camera.productData = productData;
    self.camera.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self.navigationController presentViewController:self.camera animated:YES completion:nil];
}


#pragma mark: MARCameraViewControllerDelegate methods

- (void)didTapDownloadFor:(UIImage *)image {
    NSLog(@"didTapDownloadFor");
}

- (void)didTapWhatsappToShare:(UIImage *)image {
    NSLog(@"didTapWhatsappToShare");
}

- (void)didTapShareFor:(UIImage *)image {
    NSLog(@"didTapShareFor");
}

- (void)didTapDetailsFor:(NSString *)productCode {
    NSLog(@"didTapDetailsFor->%@", productCode);
}

- (void)didTapWishlistFor:(NSString *)productCode {
    NSLog(@"didTapWishlistFor->%@", productCode);
}

- (void)didTapCartFor:(NSString *)productCode {
    NSLog(@"didTapCartFor->%@", productCode);
}

- (void)didTapRemoveCartFor:(NSString *)productCode {
    NSLog(@"didTapRemoveCartFor->%@", productCode);
}

- (void)didTapUnWishlistFor:(NSString *)productCode {
    NSLog(@"didTapUnWishlistFor->%@", productCode);
}

@end
