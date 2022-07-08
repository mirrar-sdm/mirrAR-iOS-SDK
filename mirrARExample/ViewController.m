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
        [self launchMirrarSDK];
}

- (void)launchMirrarSDK {
    
    NSDictionary *productData = @{
        @"brandId": @"brand-id-here",
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
    
    //PUSH
    [self.navigationController pushViewController:self.camera animated:NO];
    //   OR
    
    //PRESENT
    //    self.camera.modalPresentationStyle = UIModalPresentationOverFullScreen;
    //    [self.navigationController presentViewController:self.camera animated:YES completion:nil];
}

#pragma mark: MARCameraViewControllerDelegate methods

- (void)didTapDownloadFor:(UIImage *)image {
    NSLog(@"didTapDownloadForImage");
    [self showAlert:@"didTapDownloadForImage"];
}
- (void)didTapWhatsappToShare:(UIImage *)image {
    NSLog(@"didTapWhatsappToShareForImage");
    [self showAlert:@"didTapWhatsappToShareForImage"];
}
- (void)didTapShareFor:(UIImage *)image {
    NSLog(@"didTapShareForImage");
    [self showAlert:@"didTapShareForImage"];
}
- (void)didTapDetailsFor:(NSString *)productCode {
    NSLog(@"didTapDetailsForId->%@", productCode);
    [self showAlert:[NSString stringWithFormat:@"didTapDetailsForId->%@", productCode]];
}
- (void)didTapWishlistFor:(NSString *)productCode {
    NSLog(@"didTapWishlistForId->%@", productCode);
    [self showAlert:[NSString stringWithFormat:@"didTapWishlistForId->%@", productCode]];
}
- (void)didTapCartFor:(NSString *)productCode {
    NSLog(@"didTapCartForId->%@", productCode);
    [self showAlert:[NSString stringWithFormat:@"didTapCartForId->%@", productCode]];
}
- (void)didTapRemoveCartFor:(NSString *)productCode {
    NSLog(@"didTapRemoveCartForId->%@", productCode);
    [self showAlert:[NSString stringWithFormat:@"didTapRemoveCartForId->%@", productCode]];
}
- (void)didTapUnWishlistFor:(NSString *)productCode {
    NSLog(@"didTapUnWishlistForId->%@", productCode);
    [self showAlert:[NSString stringWithFormat:@"didTapUnWishlistForId->%@", productCode]];
}
- (void)didJewellarySelectedFor:(NSString *)productCode {
    NSLog(@"didJewellarySelectedForId->%@", productCode);
    [self showAlert:[NSString stringWithFormat:@"didJewellarySelectedForId->%@", productCode]];

}
- (void)didSDKLoaded {
    NSLog(@"didSDKLoaded....");
    [self showAlert:@"didSDKLoaded"];
}
- (void)didClickBackButton {
    NSLog(@"didClickedBackButton...");
    [self showAlert:@"didClickedBackButton"];

}
- (void)didSubmitReview {
    NSLog(@"didSubmitReview...");
    [self showAlert:@"didSubmitReview"];

}
- (void)didImageCaptured {
    NSLog(@"didImageCaptured...");
    [self showAlert:@"didImageCaptured"];
}

- (void)showAlert:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

@end
