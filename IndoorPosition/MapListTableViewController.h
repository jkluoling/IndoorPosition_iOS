//
//  MapListTableViewController.h
//  IndoorPosition
//
//  Created by 雨田秋浩 on 14-7-22.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapData.h"


@interface MapListTableViewController : UITableViewController <UITableViewDataSource,UITableViewDelegate>

@property NSMutableArray *maps;
@property NSString *selectedMapName;

@end
