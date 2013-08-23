//
//  SentenceQuizzerViewController.h
//  Oshieru
//
//  Created by Michael Mancuso on 8/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SentenceQuizController.h"

@interface SentenceQuizzerViewController : UIViewController <UIAlertViewDelegate>
{
    SentenceQuizController* sentenceQuizController;
    
    IBOutlet UIButton* firstButton;
    IBOutlet UIButton* secondButton;
    IBOutlet UIButton* thirdButton;
    IBOutlet UIButton* fourthButton;
    
    IBOutlet UILabel* display;
    IBOutlet UILabel* correctLabel;
    IBOutlet UILabel* incorrectLabel;
    
    int correctAnswer;
    int numCorrectAnswers;
    int numIncorrectAnswers;
    
    id nextQuestion;
}

-(IBAction)onClick:(id)sender;

@end
