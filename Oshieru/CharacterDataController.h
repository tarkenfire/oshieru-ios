//
//  CharacterDataController.h
//  Oshieru
//
//  Created by Michael Mancuso on 8/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CharacterDataController : NSObject

@property NSArray* kanaList;
@property int selectedIndex;

+(CharacterDataController*)getInstance;
-(void)populateKanaList:(NSString*)path;
-(int)getKanaCount;
@end
