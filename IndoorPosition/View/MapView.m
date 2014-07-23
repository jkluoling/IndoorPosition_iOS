//
//  MapView.m
//  IndoorPosition
//
//  Created by 雨田秋浩 on 14-7-22.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import "MapView.h"

@implementation MapView



- (id)initWithFrame:(CGRect)frame withMapName:(NSString *)mapName
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(instancetype)initWithMapName:(NSString *)mapName
{
    UIImage *map = [UIImage imageNamed:mapName];
    self = [super initWithFrame:CGRectMake(0, 0, map.size.width, map.size.height)];
    if (self) {
//        _mapImage = [[UIImageView alloc]initWithImage:map];
//        [self addSubview:_mapImage];
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

@end
