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
    
    //initial the mapvView
    [_mapView setMap:@"Map_yc"];
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
