//
//  MARPickerView.h
//  mirrAR
//
//  Created by Akhil Tolani on 05/09/17.
//  Copyright © 2017 StyleDotMe. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MARPickerViewDelegate;

@interface MARPickerView : UIView <UICollectionViewDelegate, UICollectionViewDataSource>
{
    UILabel *errorLabel;
    UITextField *materialTextField;
    NSIndexPath *earringIndexPath;
    NSIndexPath *necklaceIndexPath;
    NSIndexPath *setsIndexPath;
    NSIndexPath *braceletsIndexPath;
    NSIndexPath *ringsIndexPath;

}

@property (nonatomic, strong) UIButton *upButton;
@property (nonatomic, strong) UIButton *downButton;
@property (nonatomic) BOOL frontCamera;
@property (nonatomic, strong) UICollectionView *carousel;
@property (nonatomic, strong) UISegmentedControl *segmentControl;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic) int screenState;
@property (nonatomic, weak) id<MARPickerViewDelegate> delegate;

- (void)switchToFullScreen;
- (void)switchToCompactMode;
- (void)switchToMinimisedMode;
- (void)setUpSegment:(int) updateIndex;
@end

@protocol MARPickerViewDelegate <NSObject>
- (void)pickerViewWillUpdateCurrentItem;
- (void)pickerViewDidUpdateCurrentItem;

@end
