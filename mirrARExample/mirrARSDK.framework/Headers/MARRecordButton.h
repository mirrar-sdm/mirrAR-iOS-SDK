#import <UIKit/UIKit.h>

@interface MARRecordButton : UIButton
@property (nonatomic) BOOL isRecording;
@property (nonatomic) BOOL isRecordingVideo;

- (instancetype)initWithFrame:(CGRect)frame;
- (void)beginRecordingCameraButton;
- (void)endRecordingCameraButton;
- (void)touchAnimateRecordingButton;
- (void)touchAnimateRecordingButtonEnd;
@end
