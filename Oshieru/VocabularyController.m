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
    
    return self;
}

//public methods
-(void)loadVocabListWithFileName:(NSString*)name
{
    
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
