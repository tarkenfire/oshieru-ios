//
//  PsuedoStack.h
//  Oshieru
//
//  Created by Michael Mancuso on 8/14/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PsuedoStack : NSObject
{
    NSMutableArray* array;
    int count;
}

@property (nonatomic, readonly) int count;

-(void)push:(id)object;
-(id)pop;
-(void)clear;
-(int)count;



@end
