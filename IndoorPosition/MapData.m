//
//  MapData.m
//  IndoorPosition
//
//  Created by yutian on 14-8-7.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import "MapData.h"

@interface MapData()

@end

@implementation MapData

-(instancetype)init
{
    self = [super initWithDatabaseFilename:@"sample.db"];
    if (self) {
        [self setMapName];
    }
    return self;
}

-(void)setMapName
{
    NSString *query = @"SELECT DISTINCT map FROM MapWithLocation";
    
    _mapName = [[NSArray alloc] initWithArray:[self loadDataFromDB:query]];
}

-(NSNumber *)getMajorWithMapName:(NSString *)mapName
{
    NSString *query = [NSString stringWithFormat:@"SELECT DISTINCT major FROM MapWithLocation WHERE map = '%@'",mapName];
    
    NSNumber *major =[[[self loadDataFromDB:query] objectAtIndex:0]objectAtIndex:0];
        
    return major;
}

@end
