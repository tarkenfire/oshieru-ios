//
//  DatabaseController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/20/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "DatabaseController.h"


@implementation DatabaseController

static DatabaseController* _instance = nil;


+(DatabaseController*)getInstance
{
    if (!_instance)
    {
        _instance = [[self alloc] init];
    }
    return _instance;
}



-(id)init
{
    self = [super init];
    
    //load database
    NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"jlpt-kanji"
                                                         ofType:@"sqlite"];
    
    NSMutableArray* holder = [[NSMutableArray alloc] init];
    
    if (sqlite3_open([sqLiteDb UTF8String], &_database) == SQLITE_OK)
    {
        //create id-only query
        NSString* idQuery = @"SELECT rowid FROM n5";
        
        //run query
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(_database, [idQuery UTF8String], -1, &statement, nil)
            == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                [holder addObject:[NSNumber numberWithInt:sqlite3_column_int(statement, 0)]];
            }
            sqlite3_finalize(statement);
        }
        else
        {
            NSLog(@"Prepare-error: %s", sqlite3_errmsg(_database));
        }
        
        self.indexes = holder;
    }
    sqlite3_close(_database);
    
    return self;
}
//public methods
-(int)getDataCount
{
    return [self.indexes count];
}


-(Kanji*)getKanjiWithId:(int)id
{
    Kanji* holder = [[Kanji alloc] init];
    //load database
    NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"jlpt-kanji"
                                                         ofType:@"sqlite"];
    
    if (sqlite3_open([sqLiteDb UTF8String], &_database) == SQLITE_OK)
    {
        //create id-only query
        NSString* idQuery = [NSString stringWithFormat:@"SELECT * FROM n5 WHERE rowid = %d", id];
        
        //run query
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(_database, [idQuery UTF8String], -1, &statement, nil)
            == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                //check for null before assigning
                if (sqlite3_column_text(statement, 0))
                {
                    holder.kana = [[NSString alloc] initWithUTF8String:(char*) sqlite3_column_text(statement, 0)];
                }
                if (sqlite3_column_text(statement, 1))
                {
                    holder.onReadings = [[NSString alloc] initWithUTF8String:(char*) sqlite3_column_text(statement, 1)];                
                }
                if (sqlite3_column_text(statement, 2))
                {
                    holder.kunReadings = [[NSString alloc] initWithUTF8String:(char*) sqlite3_column_text(statement, 2)];
                }
                if (sqlite3_column_text(statement, 3))
                {
                    holder.meanings = [[NSString alloc] initWithUTF8String:(char*) sqlite3_column_text(statement, 3)];
                }
                if (sqlite3_column_int(statement, 4))
                {
                    holder.strokeCount = sqlite3_column_int(statement, 4);
                }
                if(sqlite3_column_text(statement, 5))
                {
                    holder.radical = [[NSString alloc] initWithUTF8String:(char*) sqlite3_column_text(statement, 5)];
                }
                if (sqlite3_column_text(statement, 6))
                {
                    [holder setImage:[[NSString alloc]initWithUTF8String:(char*) sqlite3_column_text(statement, 6)]];
                }
            }
            sqlite3_finalize(statement);
        }
    }
    sqlite3_close(_database);
   
    
    
    return holder;
}
//private methods

@end
