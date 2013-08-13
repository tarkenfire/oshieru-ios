//
//  KanaViewerViewController.h
//  Oshieru
//
//  Created by Michael Mancuso on 8/11/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CharacterDataController.h"

@interface KanaViewerViewController : UIViewController
{
    IBOutlet UILabel* kanaDisplay;
    IBOutlet UILabel* originKana;
    IBOutlet UILabel* spellingKana;
    IBOutlet UILabel* spellingKanaRoma;
    IBOutlet UILabel* morseCode;
    
    IBOutlet UIImageView* strokeOrder;
    
    IBOutlet UINavigationBar* localNavBar;
    
    CharacterDataController* characterDataController;
}

-(IBAction)onDonePressed:(id)sender;

@end
