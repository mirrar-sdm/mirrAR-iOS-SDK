//
//  MARCameraViewController.h
//  mirrAR
//
//  Created by Akhil Tolani on 05/09/17.
//  Copyright © 2017 StyleDotMe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MARPickerView.h"

@interface MARCameraViewController : UIViewController<MARPickerViewDelegate>

- (void)setupCamera;

@property (nonatomic) int landmarkingStyle; // 4
@property (nonatomic) BOOL showsDots;
@property (nonatomic) BOOL mediaPipeEnabled;

@property (nonatomic, strong) NSString *brandID;
@property (nonatomic, strong) NSString *brandName;
@property (nonatomic, strong) NSDictionary *productData;
@property (nonatomic, strong) NSDictionary *loginParams;
@property (nonatomic, strong) MARPickerView *pickerOverlayView;
+ (MARCameraViewController*)sharedInstance;
- (void)handML;

@end
