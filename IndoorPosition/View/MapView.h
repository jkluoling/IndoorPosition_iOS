//
//  MapView.h
//  IndoorPosition
//
//  Created by 雨田秋浩 on 14-7-22.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapView : UIView <UIGestureRecognizerDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *mapImage;
-(instancetype)initWithMapName:(NSString *)mapName;

@end
