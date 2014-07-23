//
//  UIImageView+gestureUtility.m
//  IndoorPosition
//
//  Created by 雨田秋浩 on 14-7-23.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import "UIImageView+gestureUtility.h"

@implementation UIImageView (gestureUtility)

-(int)isAlignBounds:(CGPoint)translation
{
    
    CGFloat width,height,superWidth,superHeight;
    
    width = self.frame.size.width;
    height = self.frame.size.height;
    superWidth = self.superview.frame.size.width;
    superHeight = self.superview.frame.size.height;

    if(self.frame.origin.x+width<self.superview.frame.size.width&&translation.x<0)
        return alignRight;
    else if (self.frame.origin.x>0&&translation.x>0)
        return alignLeft;
    else if (self.frame.origin.y>66&&translation.y>0)
        return alignTop;
    else if (self.frame.origin.y+height<self.superview.frame.size.height&&translation.y<0)
        return alignBottom;
    return -1;
}

-(int)isScaleFit:(CGFloat)scale
{
    return tooLarge;
}

@end
