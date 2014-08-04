//
//  Coordinate.h
//  IndoorPosition
//
//  Created by 雨田秋浩 on 14-7-24.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Map;

@interface Coordinate : NSManagedObject

@property (nonatomic, retain) NSNumber * x;
@property (nonatomic, retain) NSNumber * y;
@property (nonatomic, retain) Map *relationship;

@end
