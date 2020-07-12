#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>


@interface MARPostCreateViewController : UIViewController <UITextViewDelegate>
{
    UIButton *postButton;
    UIButton *instagramButton;
    UIButton *facebookButton;
	UIButton *wishlistE;
	UIButton *wishlistN;
	UIButton *wishlistS;
	UIView *postContainerView;
    UIButton *saveButton;
    UILabel *saveLabel;
    UIButton *shareButton;
    UILabel *shareLabel;
}
@property (nonatomic, strong) NSString *sharingAllowed;
@property (nonatomic, strong) UIImage *prevImg;
@property (nonatomic) CGPoint translation;
@property (nonatomic, strong) NSString *productCodeE;
@property (nonatomic, strong) NSString *productCodeN;
@property (nonatomic, strong) NSString *productCodeS;
@property (nonatomic, strong) NSString *type;

- (instancetype)initWithImage:(UIImage*)img;
- (void)setup;
@end
