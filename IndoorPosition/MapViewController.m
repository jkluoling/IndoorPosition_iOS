//
//  ViewController.m
//  IndoorPosition
//
//  Created by 雨田秋浩 on 14-7-22.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import "MapViewController.h"
#import "MapView.h"

@interface MapViewController ()
@property (nonatomic, strong) MapView *mapView;
@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _mapView = [[MapView alloc]initWithMapName:@"Map"];
    [_mapView setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:_mapView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)adjustAnchorPointForGesture:(UIGestureRecognizer *)gestureRecognizer
{
    UIView *GestureView = [gestureRecognizer view];
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        CGPoint locationInView = [gestureRecognizer locationInView:_mapView];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:_mapView.superview];
        
        GestureView.layer.anchorPoint = CGPointMake(locationInView.x / GestureView.bounds.size.width, locationInView.y / GestureView.bounds.size.height);
        
        NSLog(@"%f, %f",GestureView.layer.anchorPoint.x, GestureView.layer.anchorPoint.y);
        GestureView.center = locationInSuperview;
    }
}

- (IBAction)panGesture:(UIPanGestureRecognizer *)sender {
    
//    [self adjustAnchorPointForGesture:sender];
    
    
    UIView *view = [sender.view superview];
    
    if ([sender state]) {
        CGPoint translation = [sender translationInView:view];
        NSLog(@"%f,  %f",translation.x,translation.y);
        [_mapView setCenter:CGPointMake([_mapView center].x+translation.x,[_mapView center].y+translation.y)];
        [sender setTranslation:CGPointZero inView:view];
    }
}
- (IBAction)pinchGesture:(UIPinchGestureRecognizer *)sender {
    
//    [self adjustAnchorPointForGesture:sender];
    
    if ([sender state]) {
        _mapView.transform = CGAffineTransformScale(_mapView.transform, [sender scale], [sender scale]);
        [sender setScale:1];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
