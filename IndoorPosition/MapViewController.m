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
@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

#pragma mark - Bluetooth const
static NSString * const kUUID = @"d26d197e-4a1c-44ae-b504-dd7768870564";
//static float ycMajor = 0x1111;

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //initial the mapvView
    [_mapView setMap:@"Map_yc"];
}


#pragma mark - Location

-(void)startLocationWithMajor:(CGFloat)major
{
    [self initBeaconRegionWithMajor:major];
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate=self;
    [_locationManager startRangingBeaconsInRegion:_beaconRegion];
}

-(void)stopLocation
{
    [_locationManager stopMonitoringForRegion:_beaconRegion];
    _locationManager = nil;
}

-(void)initBeaconRegionWithMajor:(CGFloat)major
{
    if (_beaconRegion) {
        _beaconRegion = nil;
    }
    NSUUID *uuid = [[NSUUID alloc]initWithUUIDString:kUUID];
    _beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:major identifier:@"Tongji"];
}


-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    
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
