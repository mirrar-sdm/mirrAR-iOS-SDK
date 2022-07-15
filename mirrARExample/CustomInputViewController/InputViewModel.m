//
//  InputViewModel.m
//  mirrARExample
//
//  Created by Krishna Datt Shukla on 12/07/22.
//  Copyright © 2022 mirrARSDK. All rights reserved.
//

#import "InputViewModel.h"

@implementation InputViewModel

+ (NSDictionary *)getDictionaryFromModelArray:(NSArray *)arrayModel {
    NSMutableDictionary *dataDic = [[NSMutableDictionary alloc] init];
    
    NSArray *arrayCategoriesWithDuplicates = [arrayModel valueForKeyPath:@"category"];
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:arrayCategoriesWithDuplicates];
    NSArray *arrayCategories = [orderedSet array];

    for (int i=0; i<arrayCategories.count; i++) {
        NSString *category = [arrayCategories objectAtIndex:i];
        NSDictionary *itemsAndType = [InputViewModel getAllItemsAndTypeFor:category fromData:arrayModel];
        [dataDic setObject:itemsAndType forKey:category];
    }
    return dataDic;
}

+ (NSDictionary *)getAllItemsAndTypeFor:(NSString *)category fromData:(NSArray *)array {
    NSMutableArray *arrayItems = [[NSMutableArray alloc] init];
    NSString *type = @"";
    for (int i=0; i<array.count; i++) {
        InputViewModel *model = [array objectAtIndex:i];
        if ([model.category isEqualToString:category]) {
            NSArray *arraySKUs = [model.sku componentsSeparatedByString:@","];
            [arrayItems addObjectsFromArray:arraySKUs];
            type = model.type;
        }
    }
    return  @{
        @"items": arrayItems,
        @"type": type
    };
}


@end
