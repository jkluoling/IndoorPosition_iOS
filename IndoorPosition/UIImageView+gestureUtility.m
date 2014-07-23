//
//  UIImageView+gestureUtility.m
//  IndoorPosition
//
//  Created by 雨田秋浩 on 14-7-23.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import "UIImageView+gestureUtility.h"

@implementation UIImageView (gestureUtility)

-(void)setMap:(NSString *)mapName
{
    UIImage *mapImage = [UIImage imageNamed:mapName];
    [self setImage:mapImage];
    //resize the map to fit the width with screen
    self.frame = CGRectMake(self.frame.origin.x,
                            self.frame.origin.y+66+(502-mapImage.size.height*320/mapImage.size.width)/2,
                            320,
                            mapImage.size.height*320/mapImage.size.width);
}

-(int)isAlignBounds:(CGPoint)translation
{
    
    CGFloat width,height,superWidth,superHeight;
    
    width = self.frame.size.width;
    height = self.frame.size.height;
    superWidth = self.superview.frame.size.width;
    superHeight = self.superview.frame.size.height;

    if(self.frame.origin.x+width<superWidth&&translation.x<0)
        return alignRight;
    else if (self.frame.origin.x>0&&translation.x>0)
        return alignLeft;
    else if (self.frame.origin.y>66&&translation.y>0)
        return alignTop;
    else if (self.frame.origin.y+height<superHeight&&translation.y<0)
        return alignBottom;
    return -1;
}

-(int)isScaleFit:(CGFloat)scale
{
    return tooLarge;
}

@end
