//
//  QuizController.h
//  Oshieru
//
//  Created by Michael Mancuso on 8/14/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CharacterDataController.h"
#import "PsuedoStack.h"

@interface QuizController : NSObject
{
    CharacterDataController* characterDataController;
    PsuedoStack* questionStack;
    NSMutableArray* selectedNumbers;
}

-(void)populateQuestionSet;
-(NSArray*)getNextQuestion;


@end
