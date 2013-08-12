//
//  CharacterDataController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "CharacterDataController.h"

@implementation CharacterDataController

static CharacterDataController* _instance = nil;


+(CharacterDataController*)getInstance
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
    
    return self;
}

//kana (hiragana and katakana) methods
-(void)populateKanaList:(NSString*)path
{
    //get json string
    NSString* JSONData = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSData* data = [JSONData dataUsingEncoding:NSUTF8StringEncoding];
    
    //put json in array
    self.kanaList = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

-(int)getKanaCount
{
    return [self.kanaList count];
}

//kanji methods

@end
