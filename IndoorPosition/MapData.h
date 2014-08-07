//
//  MapData.h
//  IndoorPosition
//
//  Created by yutian on 14-8-7.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBManager.h"

@interface MapData : DBManager

@property (nonatomic,strong) NSArray *mapName;

-(instancetype)init;

-(NSNumber *) getMajorWithMapName:(NSString *)mapName;

@end
