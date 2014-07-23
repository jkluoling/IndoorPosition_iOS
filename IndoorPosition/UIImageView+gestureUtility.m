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
    
    CGFloat currX,currY,width,height,superWidth,superHeight;
    
    currX=self.frame.origin.x;
    currY=self.frame.origin.y   ;
    width = self.frame.size.width;
    height = self.frame.size.height;
    superWidth = self.superview.frame.size.width;
    superHeight = self.superview.frame.size.height;


    if((currX+width+100<superWidth&&translation.x<0)||(currX-100>0&&translation.x>0)){
        if ((currY-100>66&&translation.y>0)||(currY+height+100<superHeight&&translation.y<0)) {
            return alignCorner;
        } else {
            return alignHorizon;
        }
    }
    else if ((currY-100>66&&translation.y>0)||(currY+height+100<superHeight&&translation.y<0))
        return alignVertical;
    return -1;
}

-(int)isScaleFit:(CGFloat)scale
{
    if ((self.frame.size.width<=320 && scale < 1)||(self.frame.size.width>640 && scale >1 )) {
        return tooSmall;
    }
    return -1;
}

@end
