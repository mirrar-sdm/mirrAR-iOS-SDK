//
//  MARCameraViewController.h
//  mirrAR
//
//  Created by Akhil Tolani on 24/09/20.
//  Copyright © 2020 mirrARSDK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SafariServices/SafariServices.h>
#import <WebKit/WebKit.h>

#import "ObjectManager.h"


@protocol MARCameraViewControllerDelegate <NSObject>
@optional
- (void)didTapDownloadFor:(UIImage *)image;
- (void)didTapWhatsappToShare:(UIImage *)image;
- (void)didTapShareFor:(UIImage *)image;
- (void)didTapDetailsFor:(NSString *)productCode;
- (void)didTapWishlistFor:(NSString *)productCode;
- (void)didTapCartFor:(NSString *)productCode;

@end

@interface MARCameraViewController : UIViewController <SFSafariViewControllerDelegate, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler, UIDocumentInteractionControllerDelegate>
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
@property (nonatomic, strong) NSDictionary *loginParams;

@property (nonatomic, strong) id <MARCameraViewControllerDelegate> delegate;

+ (MARCameraViewController*)sharedInstance;

@end
