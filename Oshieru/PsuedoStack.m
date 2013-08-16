//
//  PsuedoStack.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/14/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "PsuedoStack.h"

@implementation PsuedoStack

@synthesize count;

-(id)init
{
    if( self=[super init] )
    {
        array = [[NSMutableArray alloc] init];
        count = 0;
    }
    return self;
}

-(void)push:(id)object
{
    [array addObject:object];
    count = [array count];
}

-(id)pop
{
    id holder = nil;
    if ([array count] > 0)
    {
        holder = [array lastObject];
        [array removeLastObject];
        count = [array count];
    }
    return holder;
}

-(void)clear
{
    [array removeAllObjects];
    count = 0;
}

-(int)count
{
    return [array count];
}

@end
