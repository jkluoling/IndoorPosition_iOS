//
//  UIImageView+gestureUtility.h
//  IndoorPosition
//
//  Created by 雨田秋浩 on 14-7-23.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, isAlign) {
    alignLeft,
    alignRight,
    alignTop,
    alignBottom,
};

typedef NS_ENUM(NSInteger, isScale) {
    tooSmall,
    tooLarge,
};

@interface UIImageView (gestureUtility)

-(int)isAlignBounds:(CGPoint)translation;
-(int)isScaleFit:(CGFloat)scale;

@end
