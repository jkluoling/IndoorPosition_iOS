//
//  MapListTableViewController.h
//  IndoorPosition
//
//  Created by 雨田秋浩 on 14-7-22.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Map.h"
#import "Coordinate.h"

@interface MapListTableViewController : UITableViewController

@property NSMutableArray *maps;


- (IBAction)unwindAddMap:(UIStoryboardSegue *)sender;

@end
