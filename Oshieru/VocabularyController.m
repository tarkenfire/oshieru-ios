//
//  VocabularyController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/22/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "VocabularyController.h"

@implementation VocabularyController

static VocabularyController* _instance = nil;

+(VocabularyController*)getInstance
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
    self.vocabSets = [[NSMutableArray alloc] init];
    return self;
}

//public methods

//allows for loading as many JSON vocab lists as the programmer/user desires
-(void)loadVocabListWithFileName:(NSString*)name
{
    NSString* truePath = [[NSBundle mainBundle]pathForResource:name ofType:@"json"];
    
    NSString* JSONData = [[NSString alloc] initWithContentsOfFile:truePath encoding:NSUTF8StringEncoding error:nil];
    
    NSData* data = [JSONData dataUsingEncoding:NSUTF8StringEncoding];
    
    //add json object to array
    [self.vocabSets addObject:[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]];
}

-(NSDictionary*)getVocabListAtIndex:(int)index
{
    return [self.vocabSets objectAtIndex:index];
}

-(NSString*)getVocabListNameAtIndex:(int)index
{
    NSDictionary* holder = [self.vocabSets objectAtIndex:index];
    
    return [holder objectForKey:@"set_name"];
}

-(int)vocabListCount
{
    return [self.vocabSets count];
}

@end
