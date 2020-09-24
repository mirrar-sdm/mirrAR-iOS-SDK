//
//  MARCameraViewController.h
//  mirrAR
//
//  Created by Akhil Tolani on 24/09/20.
//  Copyright © 2020 mirrARSDK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SafariServices/SafariServices.h>

#import "ObjectManager.h"

@interface MARCameraViewController : UIViewController {
    BOOL isSafariPresented;
    UIActivityIndicatorView *activityIndicator;
}

// Init Property
@property (nonatomic, strong) NSString *brandID;
@property (nonatomic, strong) NSString *brandName;
@property (nonatomic, strong) NSDictionary *productData;
@property (nonatomic, strong) NSDictionary *loginParams;

+ (MARCameraViewController*)sharedInstance;
@end
