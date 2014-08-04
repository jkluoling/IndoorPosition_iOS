//
//  DBManager.h
//  IndoorPosition
//
//  Created by 雨田秋浩 on 14-7-30.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject

@property (nonatomic,strong) NSString *documentsDirectory;
@property (nonatomic,strong) NSString *databaseFilename;

@property (nonatomic,strong) NSMutableArray *arrColumnNames;
@property (nonatomic) int affectedRows;
@property (nonatomic) long long lastInsertedRowID;

-(instancetype)initWithDatabaseFilename:(NSString *)dbFilename;

-(void)copyDatabaseIntoDocumentsDirectory;

-(NSArray *)loadDataFromDB:(NSString *)query;

-(void)excuteQuery:(NSString *)query;

@end
