//
//  ViewController.m
//  IndoorPosition
//
//  Created by 雨田秋浩 on 14-7-22.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import "MapViewController.h"
#import "UIImageView+gestureUtility.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *mapView;
@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_mapView setImage:[UIImage imageNamed:@"Map_yc"]];
    [_mapView sizeToFit];
    
}


#pragma mark - Gesture
- (void)adjustAnchorPointForGesture:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIView *piece = gestureRecognizer.view;
        CGPoint locationInView = [gestureRecognizer locationInView:_mapView];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece];
        _mapView.layer.anchorPoint = CGPointMake(locationInView.x / _mapView.bounds.size.width, locationInView.y / _mapView.bounds.size.height);
        _mapView.center = locationInSuperview;
    }
}

- (IBAction)panGesture:(UIPanGestureRecognizer *)sender {
    
    [self adjustAnchorPointForGesture:sender];
    CGPoint translation = [sender translationInView:[sender.view superview]];
//    NSLog(@"x:%f, y;%f",_mapView.frame.origin.x,_mapView.frame.origin.y);
    
    switch ([_mapView isAlignBounds:translation]) {
        case alignRight:
            NSLog(@"right");
            [_mapView setCenter:CGPointMake([_mapView center].x, [_mapView center].y + translation.y)];
            break;
        case alignLeft:
            NSLog(@"left");
            [_mapView setCenter:CGPointMake([_mapView center].x, [_mapView center].y + translation.y)];
            break;
        case alignTop:
            NSLog(@"top");
            [_mapView setCenter:CGPointMake([_mapView center].x+translation.x, [_mapView center].y)];
            break;
        case alignBottom:
            NSLog(@"bottom");
            [_mapView setCenter:CGPointMake([_mapView center].x+translation.x, [_mapView center].y)];
            break;
        default:
            [_mapView setCenter:CGPointMake([_mapView center].x + translation.x, [_mapView center].y + translation.y)];
            NSLog(@"default");
    }
    
    
    
    
    
//    if (NO) {
//        [_mapView setCenter:CGPointMake([_mapView center].x, [_mapView center].y + translation.y)];
//    } else if ([sender state] == UIGestureRecognizerStateBegan || [sender state] == UIGestureRecognizerStateChanged) {
//        [_mapView setCenter:CGPointMake([_mapView center].x + translation.x, [_mapView center].y + translation.y)];
//        NSLog(@"x:%f, y;%f",translation.x,translation.y);
//    }
    
    [sender setTranslation:CGPointZero inView:[sender.view superview]];

}

- (IBAction)pinchGesture:(UIPinchGestureRecognizer *)sender {
    
    [self adjustAnchorPointForGesture:sender];
    
    
    if ([sender state] == UIGestureRecognizerStateBegan || [sender state] == UIGestureRecognizerStateChanged) {
        _mapView.transform = CGAffineTransformScale([_mapView transform], [sender scale], [sender scale]);
        [sender setScale:1];
    }
    
}





@end
