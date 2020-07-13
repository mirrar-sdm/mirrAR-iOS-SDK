//
//  AppDelegate.h
//  mirrAR
//
//  Created by Vineet on 11/07/20.
//  Copyright © 2020 mirrARSDK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MARCameraViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

+ (AppDelegate*)sharedInstance;
@property (nonatomic, strong) UIWindow *window;


@end

