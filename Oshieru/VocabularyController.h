//
//  VocabularyController.h
//  Oshieru
//
//  Created by Michael Mancuso on 8/22/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VocabularyController : NSObject
{

}

@property NSMutableArray* vocabSets;

+(VocabularyController*)getInstance;

-(void)loadVocabListWithFileName:(NSString*)name;

-(NSDictionary*)getVocabListAtIndex:(int)index;
-(NSString*)getVocabListNameAtIndex:(int)index;

-(int)vocabListCount;
@end
