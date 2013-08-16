//
//  KanaQuizzerViewController.h
//  Oshieru
//
//  Created by Michael Mancuso on 8/11/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizController.h"

@interface KanaQuizzerViewController : UIViewController <UIAlertViewDelegate>
{
    IBOutlet UIButton* firstButton;
    IBOutlet UIButton* secondButton;
    IBOutlet UIButton* thirdButton;
    IBOutlet UIButton* fourthButton;
    
    IBOutlet UILabel* displayKana;
    IBOutlet UILabel* correctLabel;
    IBOutlet UILabel* incorrectLabel;
    
    QuizController* quizController;
    
    int correctAnswer;
    int numCorrectAnswers;
    int numIncorrectAnswers;
    
    id nextQuestion;
    
}


-(IBAction)onClick:(id)sender;

@end
