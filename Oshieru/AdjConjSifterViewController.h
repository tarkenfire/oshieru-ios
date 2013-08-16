//
//  AdjConjSifterViewController.h
//  Oshieru
//
//  Created by Michael Mancuso on 8/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdjConjSifterViewController : UIViewController
{
    IBOutlet UIView* containerView;
    
    IBOutlet UIButton* clearButton;
    IBOutlet UIButton* conjButton;
    
    IBOutlet UITextField* entryField;
    
    IBOutlet UILabel* baseLabel;
    
    IBOutlet UILabel* posPreFormal;
    IBOutlet UILabel* posPreCasual;
    IBOutlet UILabel* posPastFormal;
    IBOutlet UILabel* posPastCasual;
    
    IBOutlet UILabel* negPreFormal;
    IBOutlet UILabel* negPreCasual;
    IBOutlet UILabel* negPastFormal;
    IBOutlet UILabel* negPastCasual;
    
    NSString* adje;
}


-(IBAction)onClick:(id)sender;
@end
