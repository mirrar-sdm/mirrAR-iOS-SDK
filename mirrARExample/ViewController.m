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
    NSDictionary *loginParam = @{@"username": @"tanishqwebar",
        @"password": @"w4y0EihepyIAA50U",
        @"type": @"ios_sdk"
      };
    
    
    //For sakshi test
    /*
    NSDictionary *options = @{
        @"productData": @{
                @"Bracelets": @{
                        @"items": @[@"BR-01", @"BR-02", @"BR-03"],
                        @"type": @"wrist"
                },
                @"Earrings": @{
                        @"items": @[@"1503677279384_RIB_2113_1", @"CT-2032", @"CS2124E"],
                        @"type": @"ear"
                },
                @"Rings": @{
                        @"items": @[@"RN-01", @"RN-013", @"RN-01543"],
                        @"type": @"finger"
                },
                @"Sets": @{
                        @"items": @[@"CS-414"],
                        @"type": @"set"
                }
        }
    };
    
    
    NSDictionary *loginParam = @{@"username": @"sakshi",
        @"password": @"w4y0EihepyIAA50U",
        @"type": @"ios_sdk"
      };
    */
    self.camera = [[MARCameraViewController alloc] init];
    self.camera.productData = options;
    self.camera.loginParams = loginParam;
    [self.navigationController pushViewController:self.camera animated:NO];

    
}


@end
