//
//  SentenceQuizController.h
//  Oshieru
//
//  Created by Michael Mancuso on 8/22/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PsuedoStack.h"

@interface SentenceQuizController : NSObject
{
    NSMutableArray* remainingOptions;
    NSArray* questionPool;
    
    PsuedoStack* selectedQuestions;
    
    
}

+(SentenceQuizController*)getInstance;
-(void)populateData:(NSString*)filePath;
-(void)getRandomNumbers;
-(NSDictionary*)getNextQuestion;

@end
