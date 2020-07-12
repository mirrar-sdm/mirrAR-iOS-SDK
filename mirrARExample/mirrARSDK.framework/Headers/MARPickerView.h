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
@property (nonatomic, strong) UICollectionView *carousel;
@property (nonatomic, strong) UISegmentedControl *segmentControl;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, weak) id<MARPickerViewDelegate> delegate;

@property (nonatomic) int screenState;

- (void)setUpSegment:(int) updateIndex;

@end

@protocol MARPickerViewDelegate <NSObject>
- (void)pickerViewWillUpdateCurrentItem;
- (void)pickerViewDidUpdateCurrentItem;

@end
