//
//  ViewController.m
//  IndoorPosition
//
//  Created by 雨田秋浩 on 14-7-22.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import "MapViewController.h"
#import "MapView.h"
#import "UIImageView+gestureUtility.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *mapView;
@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_mapView setImage:[UIImage imageNamed:@"Map_zhf"]];
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
    
    if ([_mapView isOutofBoundsWithSuperView:sender.view]) {
        _mapView.center = CGPointMake(0, 0);
        return;
    }
    
    if ([sender state] == UIGestureRecognizerStateBegan || [sender state] == UIGestureRecognizerStateChanged) {
        CGPoint translation = [sender translationInView:[sender.view superview]];
        
        [_mapView setCenter:CGPointMake([_mapView center].x + translation.x, [_mapView center].y + translation.y)];
        [sender setTranslation:CGPointZero inView:[sender.view superview]];
    }
}

- (IBAction)pinchGesture:(UIPinchGestureRecognizer *)sender {
    
    [self adjustAnchorPointForGesture:sender];
    
    if ([_mapView isOutofBoundsWithSuperView:sender.view]) {
        _mapView.center = CGPointMake(0, 0);
        return;
    }
    
    if ([sender state] == UIGestureRecognizerStateBegan || [sender state] == UIGestureRecognizerStateChanged) {
        _mapView.transform = CGAffineTransformScale([_mapView transform], [sender scale], [sender scale]);
        [sender setScale:1];
    }
    
}





@end
