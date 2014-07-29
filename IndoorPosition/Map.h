//
//  Map.h
//  IndoorPosition
//
//  Created by 雨田秋浩 on 14-7-24.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Map : NSManagedObject

@property (nonatomic, retain) NSNumber * major;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSManagedObject *relationship;

@end
