//
//  ViewController.h
//  IndoorPosition
//
//  Created by 雨田秋浩 on 14-7-22.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <UIGestureRecognizerDelegate,CLLocationManagerDelegate>

-(IBAction)unwindMapList:(UIStoryboardSegue *)segue;

@end
