//
//  Kanji.h
//  Oshieru
//
//  Created by Michael Mancuso on 8/21/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Kanji : NSObject

@property NSString* kana;
@property NSString* radical;
@property int strokeCount;
@property NSString* onReadings;
@property NSString* kunReadings;
@property NSString* meanings;

@property UIImage* stroke;

-(void)setImage:(NSString*)imageName;

@end
