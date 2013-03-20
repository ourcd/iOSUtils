//
//  UIView+getController.m
//  yipai3-1
//
//  Created by ccf on 12-11-13.
//  Copyright (c) 2012年 ccf. All rights reserved.
//

#import "UIView+getController.h"

@implementation UIView (getController)

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
