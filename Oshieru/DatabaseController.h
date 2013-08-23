//
//  DatabaseController.h
//  Oshieru
//
//  Created by Michael Mancuso on 8/20/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "/usr/include/sqlite3.h"
#import "Kanji.h"

@interface DatabaseController : NSObject
{
    sqlite3 *_database;
}

@property NSArray* indexes;

+(DatabaseController*)getInstance;
-(int)getDataCount;
-(Kanji*)getKanjiWithId:(int)id;

@end
