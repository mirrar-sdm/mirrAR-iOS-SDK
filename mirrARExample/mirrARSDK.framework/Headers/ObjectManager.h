//
//  ObjectManager.h
//  pcjAR
//
//  Created by Akhil Tolani on 22/08/17.
//  Copyright © 2017 StyleDotMe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <sys/socket.h>
#import <netinet/in.h>


@interface ObjectManager : NSObject
{
    BOOL alertPresented;
}

@property (nonatomic, strong) NSDictionary *productData;

+ (instancetype)sharedInstance;
- (void)brandLogin:(NSDictionary *)params completetionHandler:(void (^)(NSDictionary *, NSError *))completionHandler;
@end
