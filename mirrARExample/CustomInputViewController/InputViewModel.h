//
//  InputViewModel.h
//  mirrARExample
//
//  Created by Krishna Datt Shukla on 12/07/22.
//  Copyright © 2022 mirrARSDK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputViewModel : NSObject

@property (strong, nonatomic) NSString *category;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *sku;

+ (NSDictionary *)getDictionaryFromModelArray:(NSArray *)arrayModel;


@end

NS_ASSUME_NONNULL_END
