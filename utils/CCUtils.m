//
//  CCUtils.m
//  ShowEasy
//
//  Created by ccf on 13-4-10.
//  Copyright (c) 2013年 ccf. All rights reserved.
//

#import "CCUtils.h"
#import "Reachability.h"

@implementation CCUtils

#pragma mark - Outer methods implementation 

+ (BOOL)hasNetwork{
    if ([CCUtils currentNetworkType] == NotReachable) {
        return NO;
    }else{
        return YES;
    }
}

#pragma mark - Inner methods
+ (NetworkStatus)currentNetworkType{
    Reachability *r = [Reachability reachabilityWithHostName:@"www.apple.com"];
    return [r currentReachabilityStatus];
}

@end
