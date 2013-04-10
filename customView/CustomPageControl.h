//
//  CustomPageControl.h
//  CarInfo
//
//  Created by ccf on 13-3-22.
//  Copyright (c) 2013年 ccf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPageControl : UIView

@property (nonatomic, assign)NSInteger totalPage;
@property (nonatomic, assign)NSInteger currentPage;

- (void)setNormalImage:(UIImage *)normalImg selectedImage:(UIImage *)selectedImg;


@end
