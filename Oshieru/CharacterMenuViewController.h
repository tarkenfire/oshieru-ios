//
//  CharacterMenuViewController.h
//  Oshieru
//
//  Created by Michael Mancuso on 8/11/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CharacterDataController.h"

@interface CharacterMenuViewController : UIViewController
{
    CharacterDataController* characterDataController;
}

-(IBAction)onClick:(id)sender;


@end
