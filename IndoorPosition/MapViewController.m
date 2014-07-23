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
    int alignState = [_mapView isAlignBounds:translation];
    
    if (alignState == alignCorner) {
        translation.x = translation.y =0;
    } else if (alignState == alignHorizon){
        translation.x = 0;
    } else if (alignState == alignVertical){
        translation.y = 0;
    }
    
    [_mapView setCenter:CGPointMake([_mapView center].x + translation.x, [_mapView center].y + translation.y)];
    [sender setTranslation:CGPointZero inView:[sender.view superview]];

}

- (IBAction)pinchGesture:(UIPinchGestureRecognizer *)sender {
    
    [self adjustAnchorPointForGesture:sender];
    CGFloat scale = [sender scale];
    if ([sender state] == UIGestureRecognizerStateBegan || [sender state] == UIGestureRecognizerStateChanged) {
        int scaleState = [_mapView isScaleFit:scale];
        if (scaleState == tooLarge || scaleState == tooSmall) {
            scale = 1;
        }
        _mapView.transform = CGAffineTransformScale([_mapView transform], scale, scale);
        [sender setScale:1];
    }
    
}

@end
