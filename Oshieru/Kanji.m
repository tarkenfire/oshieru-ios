//
//  Kanji.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/21/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "Kanji.h"

@implementation Kanji

-(void)setImage:(NSString*)imageName
{
    self.stroke = [UIImage imageNamed:imageName];
}

@end
