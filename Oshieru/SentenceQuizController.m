//
//  SentenceQuizController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/22/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "SentenceQuizController.h"

@implementation SentenceQuizController

static SentenceQuizController* _instance = nil;


+(SentenceQuizController*)getInstance
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
    
    remainingOptions = [[NSMutableArray alloc]init];
    selectedQuestions = [[PsuedoStack alloc] init];
    
    return self;
}



//public functions
-(void)populateData:(NSString*)filePath
{
    NSString* truePath = [[NSBundle mainBundle]pathForResource:filePath ofType:@"json"];
    
    NSString* JSONData = [[NSString alloc] initWithContentsOfFile:truePath encoding:NSUTF8StringEncoding error:nil];
    
    NSData* data = [JSONData dataUsingEncoding:NSUTF8StringEncoding];
    
    //put json in array
    questionPool = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}


-(void)getRandomNumbers
{
    int counter = 5;
    
    //populate possible numbers
    for (int i = 0; i < [questionPool count]; i++)
    {
        [remainingOptions addObject:[NSNumber numberWithInt:i + 1]]; //list is 1 indexed, not 0 indexed.
    }
    

    
    while (counter > 0)
    {
        NSNumber* holder = [NSNumber numberWithInt:arc4random_uniform([questionPool count])];
        
        if ([remainingOptions containsObject:holder])
        {
            [selectedQuestions push:[questionPool objectAtIndex:[holder intValue]]];
            [remainingOptions removeObject:holder];
            counter--;
        }
    }
}

-(NSDictionary*)getNextQuestion
{
    return [selectedQuestions pop];
}


@end
