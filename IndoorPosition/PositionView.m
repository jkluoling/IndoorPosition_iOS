//
//  PositionView.m
//  IndoorPosition
//
//  Created by tj  on 14-8-9.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import "PositionView.h"

@implementation PositionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *positonImage = [UIImage imageNamed:@"point.png"];
        UIImageView *positionView =[[UIImageView alloc] initWithImage:positonImage];
        
        
        
        CGFloat r = 40;
        
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0,0,1.5*r,1.5*r)];
        lbl.text = @"●";
        lbl.textAlignment = UITextAlignmentCenter;
        lbl.backgroundColor = [UIColor clearColor];
        lbl.textColor = [UIColor blueColor];
        lbl.font = [UIFont systemFontOfSize:2*r];
        lbl.alpha = 0.2;
        lbl.center = CGPointMake(10, 10);
        [self addSubview:lbl];
        
        [self addSubview:positionView];
    }
    return self;
}
@end
