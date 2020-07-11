//
//  ViewController.m
//  mirrARExample
//
//  Created by Vineet on 11/07/20.
//  Copyright © 2020 mirrARSDK. All rights reserved.
//

#import "ViewController.h"
#import <mirrARSDK/MARCameraViewController.h>

@interface ViewController ()
@property (strong, nonatomic) MARCameraViewController *camera;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.camera = [[MARCameraViewController alloc] init];
    self.camera.brandID = @"ffae6dac-89e4-41df-8973-e58a60efc9c4";
    self.camera.brandName = @"Tanishqwebar";
    NSDictionary *options =  @{
        @"productData": @{
                @"Necklaces": @{
                        @"items": @[@"502516NFEAAB32_N", @"5027182ADABA02_N", @"500005PFAAAA09"],
                        @"type": @"neck"
                },
                @"Earrings": @{
                        @"items": @[@"500005DMAABA04", @"500005SFAABA02"],
                        @"type": @"ear"
                },
                @"Mangalsutras": @{
                        @"items": @[@"502118YEEAAA32", @"502118YENAAA32", @"502118YEOAAA32"],
                        @"type": @"neck"
                },
                @"NecklaceSets": @{
                        @"items": @[@"5027182ADABA02", @"5027182AJABA02"],
                        @"type": @"set"
                },
                @"PendantSets": @{
                        @"items": @[@"5031181DXAAA09", @"5132181BUABA00"],
                        @"type": @"set"
                }
        }
    };
    self.camera.productData = options;
    NSDictionary *loginParam = @{@"username": @"tanishqwebar",
        @"password": @"w4y0EihepyIAA50U",
        @"type": @"ios_sdk"
      };
    
    self.camera.loginParams = loginParam;
    [self presentViewController:self.camera animated:YES completion:^{
        
    }];
}


@end
