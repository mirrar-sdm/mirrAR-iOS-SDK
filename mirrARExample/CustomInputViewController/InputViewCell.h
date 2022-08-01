//
//  InputViewCell.h
//  mirrARExample
//
//  Created by Krishna Datt Shukla on 12/07/22.
//  Copyright © 2022 mirrARSDK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputViewCell : UITableViewCell

@property (weak) IBOutlet UITextField *inputFieldCategory;
@property (weak) IBOutlet UITextField *inputFieldType;
@property (weak) IBOutlet UITextField *inputFieldSKU;

@end

NS_ASSUME_NONNULL_END
