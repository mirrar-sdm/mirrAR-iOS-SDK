//
//  MARCameraViewController.h
//  mirrAR
//
//  Created by Akhil Tolani on 05/09/17.
//  Copyright © 2017 StyleDotMe. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <SafariServices/SafariServices.h>
#import <WebKit/WebKit.h>
#import <AVKit/AVKit.h>
#import "MARPickerView.h"


#define DEGREES_TO_RADIANS(degrees)((M_PI * degrees)/180)

@protocol MARCameraViewControllerDelegate <NSObject>
@optional
- (void)didTapDownloadFor:(UIImage *)image;
- (void)didTapWhatsappToShare:(UIImage *)image;
- (void)didTapShareFor:(UIImage *)image;
- (void)didTapDetailsFor:(NSString *)productCode;
- (void)didTapWishlistFor:(NSString *)productCode;
- (void)didTapCartFor:(NSString *)productCode;
- (void)didTapRemoveCartFor:(NSString *)productCode;
- (void)didTapUnWishlistFor:(NSString *)productCode;

@end

@interface MARCameraViewController : UIViewController <SFSafariViewControllerDelegate, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler, UIDocumentInteractionControllerDelegate, AVCaptureVideoDataOutputSampleBufferDelegate, AVCaptureMetadataOutputObjectsDelegate, MARPickerViewDelegate>
{
    BOOL isSafariPresented;
    UIActivityIndicatorView *activityIndicator;
    UIButton *backButton2;
    UIButton *backButton;
    WKWebView *wkWebView;
    NSString *messageHandler;
    UIDocumentInteractionController * documentInteractionController;

}

// Init Property
@property (nonatomic, strong) NSString *brandID;
@property (nonatomic, strong) NSString *brandName;
@property (nonatomic, strong) NSDictionary *productData;

@property (nonatomic) BOOL showsDots;
@property (nonatomic, strong) MARPickerView *pickerOverlayView;

@property (nonatomic, strong) id <MARCameraViewControllerDelegate> delegate;

+ (MARCameraViewController*)sharedInstance;

@end
