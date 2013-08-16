//
//  VerbConjSifterViewController.h
//  Oshieru
//
//  Created by Michael Mancuso on 8/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VerbConjSifterViewController : UIViewController
{
    IBOutlet UIView* containerView;
    
    IBOutlet UIButton* clearButton;
    IBOutlet UIButton* conjButton;
    
    IBOutlet UITextField* entryField;
    
    IBOutlet UILabel* baseLabel;
    
    IBOutlet UILabel* teFormLabel;
    IBOutlet UILabel* taFormLabel;
    IBOutlet UILabel* iFormLabel;
    IBOutlet UILabel* negativeFormLabel;
    IBOutlet UILabel* causitiveFormLabel;
    IBOutlet UILabel* passiveFormLabel;
    IBOutlet UILabel* potentialFormLabel;
    IBOutlet UILabel* conditionalFormLabel;
    IBOutlet UILabel* volitionalFormLabel;
    IBOutlet UILabel* politeFormLabel;
    
    
    NSString* verb;
}

-(IBAction)onClick:(id)sender;

@end
