//
//  QuizController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/14/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "QuizController.h"

@implementation QuizController

-(id)init
{
    self = [super init];
    
    characterDataController = [CharacterDataController getInstance];
    questionStack = [[PsuedoStack alloc] init];
    selectedNumbers = [[NSMutableArray alloc] init];
    
    return self;
}

//public methods
-(void)populateQuestionSet
{
    [self getNumbers];

    for (NSNumber* num in selectedNumbers)
    {
        NSDictionary* selectedCharacter = characterDataController.kanaList[[num intValue]];
        NSMutableArray* holder = [[NSMutableArray alloc] init];
        
        [holder addObject:[selectedCharacter objectForKey:@"char"]];
        [holder addObject:[selectedCharacter objectForKey:@"char_roma"]];
        [holder addObject:[self getWrongAnswers:[num intValue]]];
        
                
        [questionStack push:holder];
    }
}

-(NSArray*)getNextQuestion
{
    return [questionStack pop];
}

//private methods
-(void)getNumbers
{
    [selectedNumbers removeAllObjects];
    //does not protect against repeats in questions
    for (int i = 0; i < 5; i++)
    {
        [selectedNumbers addObject:[NSNumber numberWithInt:arc4random_uniform([characterDataController.kanaList count])]];
    }

}

-(NSArray*)getWrongAnswers:(int)correctAnswer
{
    int count = 0;
    NSMutableArray* holder = [[NSMutableArray alloc] init];
    
    while (count < 3)
    {
        int rand = arc4random_uniform([characterDataController.kanaList count]);
        
        if (rand != correctAnswer)
        {
            NSDictionary* selectedCharacter = characterDataController.kanaList[rand];
            [holder addObject:[selectedCharacter objectForKey:@"char_roma"]];
            count++;
        }
    }
    return holder;
}

@end
