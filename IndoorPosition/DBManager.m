//
//  DBManager.m
//  IndoorPosition
//
//  Created by 雨田秋浩 on 14-7-30.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import "DBManager.h"

@interface DBManager()

@property (nonatomic, strong)NSMutableArray *arrResult;

-(void)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExcutable;

@end


@implementation DBManager

-(instancetype)initWithDatabaseFilename:(NSString *)dbFilename
{
    self = [super init];
    if (self) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        
        _documentsDirectory = [paths objectAtIndex:0];
        
        _databaseFilename = dbFilename;
        
        [self copyDatabaseIntoDocumentsDirectory];
    }
    return self;
}

-(void)copyDatabaseIntoDocumentsDirectory
{
    NSString *destinationPath = [_documentsDirectory stringByAppendingPathComponent:_databaseFilename];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:destinationPath]) {
        NSString *sourcePath = [[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:_databaseFilename];
        NSError *error;
        [[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:destinationPath error:&error];
        if (error!=nil) {
            NSLog(@"%@",[error localizedDescription]);
        }
    }
}


#pragma mark - query

-(NSArray *)loadDataFromDB:(NSString *)query
{
    [self runQuery:[query UTF8String] isQueryExecutable:NO];
    return (NSArray *)_arrResult;
}

-(void)excuteQuery:(NSString *)query
{
    [self runQuery:[query UTF8String] isQueryExecutable:YES];
}

-(void)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExcutable
{
    sqlite3 *sqlite3Database;
    
    NSString *databasePath = [_documentsDirectory stringByAppendingPathComponent:_databaseFilename];
    
    if (_arrResult != nil) {
        [_arrResult removeAllObjects];
        _arrResult = nil;
    }
    _arrResult = [[NSMutableArray alloc] init];
    
    if (_arrColumnNames != nil) {
        _arrColumnNames = nil;
    }
    _arrColumnNames = [[NSMutableArray alloc] init];
    
    //open database
    int openDatabaseResult = sqlite3_open([databasePath UTF8String], &sqlite3Database);
    if (openDatabaseResult == SQLITE_OK) {
        sqlite3_stmt *compliedStatement;
    
        int prepareStatementResult = sqlite3_prepare_v2(sqlite3Database, query, -1, &compliedStatement, NULL);
        if (prepareStatementResult == SQLITE_OK) {
            if (!queryExcutable) {
                NSMutableArray *arrDataRow;
                
                while (sqlite3_step(compliedStatement)==SQLITE_ROW) {
                    arrDataRow = [[NSMutableArray alloc] init];
                    
                    int totalColumns = sqlite3_column_count(compliedStatement);
                    
                    for (int i=0; i<totalColumns; i++) {
                        char *dbDataAsChars = (char *)sqlite3_column_text(compliedStatement, i);
                        
                        if (dbDataAsChars != NULL) {
                            [arrDataRow addObject:[NSString stringWithUTF8String:dbDataAsChars]];
                        }
                        
                        if (_arrColumnNames.count != totalColumns) {
                            dbDataAsChars = (char *)sqlite3_column_name(compliedStatement, i);
                            [_arrColumnNames addObject:[NSString stringWithUTF8String:dbDataAsChars]];
                        }
                    }
                    
                    if (arrDataRow.count>0) {
                        [_arrResult addObject:arrDataRow];
                    }
                    
                }
            } else {
                int excuteQueryResults = sqlite3_step(compliedStatement);
                if (excuteQueryResults == SQLITE_DONE) {
                    _affectedRows = sqlite3_changes(sqlite3Database);
                    _lastInsertedRowID = sqlite3_last_insert_rowid(sqlite3Database);
                } else {
                    NSLog(@"DB Error: %s", sqlite3_errmsg(sqlite3Database));
                }
            }
        } else {
            NSLog(@"%s", sqlite3_errmsg(sqlite3Database));
        }
        sqlite3_finalize(compliedStatement);
    }
    
    sqlite3_close(sqlite3Database);
    
}

@end
