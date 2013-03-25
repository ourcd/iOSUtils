//
//  CustomPageControl.m
//  CarInfo
//
//  Created by ccf on 13-3-22.
//  Copyright (c) 2013年 ccf. All rights reserved.
//

#import "CustomPageControl.h"

#if ! __has_feature(objc_arc)
#warning This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#define Padding                     (10/2.0)

#define IndicatorBaseTag            154

@interface CustomPageControl (){
    UIImage *_normalImage;
    UIImage *_selectedImage;
    
    UIView *_indicatorView;
}

@end

@implementation CustomPageControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.totalPage = 0;
        self.currentPage = 0;
        _normalImage = nil;
        _selectedImage = nil;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)setTotalPage:(NSInteger)totalPage{
    _totalPage = totalPage;
    
    if (_normalImage != nil) {
        [self reloadIndicatorView];
    }
}

- (void)setCurrentPage:(NSInteger)currentPage{
    if (currentPage < self.totalPage) {
        _currentPage = currentPage;
        for (UIImageView *tmpImageView in _indicatorView.subviews) {
            NSInteger index = tmpImageView.tag - IndicatorBaseTag;
            if (index == currentPage) {
                tmpImageView.image = _selectedImage;
            }else{
                tmpImageView.image = _normalImage;
            }
        }
    }
}

- (void)setNormalImage:(UIImage *)normalImg selectedImage:(UIImage *)selectedImg{
    _normalImage = normalImg;
    _selectedImage = selectedImg;
    
    if (self.totalPage != 0) {
        [self reloadIndicatorView];
    }
}

#pragma mark - Inner Methods
- (void)reloadIndicatorView{
    if (_indicatorView != nil) {
        [_indicatorView removeFromSuperview];
        _indicatorView = nil;
    }
    
    if (self.totalPage > 0 && _normalImage != nil) {
        _indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.totalPage * _normalImage.size.width + (self.totalPage - 1) * Padding, self.frame.size.height)];
        _indicatorView.center = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
        [self addSubview:_indicatorView];
        
        for (NSInteger i = 0; i < self.totalPage; i++) {
            UIImageView *tmpImageView = [[UIImageView alloc] initWithImage:_normalImage];
            tmpImageView.center = CGPointMake(i * (_normalImage.size.width + Padding) + _normalImage.size.width/2.0, _indicatorView.frame.size.height/2.0);
            if (i == self.currentPage) {
                tmpImageView.image = _selectedImage;
            }
            tmpImageView.tag = IndicatorBaseTag + i;
            [_indicatorView addSubview:tmpImageView];
        }
    }
}


@end
