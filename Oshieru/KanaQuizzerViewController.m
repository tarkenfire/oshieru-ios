//
//  KanaQuizzerViewController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/11/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "KanaQuizzerViewController.h"

@interface KanaQuizzerViewController ()

@end

@implementation KanaQuizzerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Character Quiz";
        self.tabBarItem.image = [UIImage imageNamed:@"quizIcon"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//because of the tab controller, all code that would usually be in viewDidLoad has to be in didAppear
-(void)viewDidAppear:(BOOL)animated
{
    quizController = [[QuizController alloc] init];
    [quizController populateQuestionSet];
    
    nextQuestion = [quizController getNextQuestion];
    [self displayQuestion:nextQuestion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//delegate methods
-(IBAction)onClick:(id)sender
{
    if ([sender tag] == 5) //is reset button
    {
        [self resetQuiz];
        return;
    }
    
    switch (correctAnswer)
    {
        case 1:
            if ([sender tag] == 1)
            {
                [self displayCorrectAnswer];
            }
            else
            {
                [self displayIncorrectAnswer];
            }
            break;
        case 2:
            if ([sender tag] == 2)
            {
                [self displayCorrectAnswer];
            }
            else
            {
                [self displayIncorrectAnswer];
            }
            break;
        case 3:
            if ([sender tag] == 3)
            {
                [self displayCorrectAnswer];
            }
            else
            {
                [self displayIncorrectAnswer];
            }
            break;
        case 4:
            if ([sender tag] == 4)
            {
                [self displayCorrectAnswer];
            }
            else
            {
                [self displayIncorrectAnswer];
            }
            break;
    }

    nextQuestion = [quizController getNextQuestion];
    [self displayQuestion:nextQuestion];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //quiz always resets, regardless of button clicked. In future version, putting the alert view on a timer and having no button might be better.
    [self resetQuiz];
}

//private methods
-(void)displayQuestion:(NSArray*)questionData
{
    if (nextQuestion == nil)
    {
        NSString* scoreMessage = [NSString stringWithFormat:@"The quiz is over. You answered %d questions correctly and %d questions incorrectly.", numCorrectAnswers, numIncorrectAnswers];
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Quiz Over"
                                                          message:scoreMessage
                                                         delegate:self
                                                cancelButtonTitle:nil
                                                otherButtonTitles:@"Reset Quiz", nil];
        [message show];
    }
    else
    {
        displayKana.text = questionData[0];
    
        correctAnswer = arc4random_uniform(4) + 1; //1-4
        NSArray* wrongAnswers = questionData[2];
    
        //this is kind of brute force, but it's not an expensive operation, so it's still done quickly if not nicely.
        switch (correctAnswer)
        {
            case 1:
                [firstButton setTitle:questionData[1] forState:UIControlStateNormal];
                [secondButton setTitle:wrongAnswers[0] forState:UIControlStateNormal];
                [thirdButton setTitle:wrongAnswers[1] forState:UIControlStateNormal];
                [fourthButton setTitle:wrongAnswers[2] forState:UIControlStateNormal];
                break;
            case 2:
                [firstButton setTitle:wrongAnswers[0] forState:UIControlStateNormal];
                [secondButton setTitle:questionData[1] forState:UIControlStateNormal];
                [thirdButton setTitle:wrongAnswers[1] forState:UIControlStateNormal];
                [fourthButton setTitle:wrongAnswers[2] forState:UIControlStateNormal];
                break;
            case 3:
                [firstButton setTitle:wrongAnswers[0] forState:UIControlStateNormal];
                [secondButton setTitle:wrongAnswers[1] forState:UIControlStateNormal];
                [thirdButton setTitle:questionData[1] forState:UIControlStateNormal];
                [fourthButton setTitle:wrongAnswers[2] forState:UIControlStateNormal];
                break;
            case 4:
                [firstButton setTitle:wrongAnswers[0] forState:UIControlStateNormal];
                [secondButton setTitle:wrongAnswers[1] forState:UIControlStateNormal];
                [thirdButton setTitle:wrongAnswers[2] forState:UIControlStateNormal];
                [fourthButton setTitle:questionData[1] forState:UIControlStateNormal];
                break;
        }
    }
}

-(void)resetQuiz
{
    correctLabel.text = @"0";
    incorrectLabel.text = @"0";
    
    numCorrectAnswers = 0;
    numIncorrectAnswers = 0;
    
    [quizController populateQuestionSet];
    
    nextQuestion = [quizController getNextQuestion];
    [self displayQuestion:nextQuestion];
}

-(void)displayCorrectAnswer
{
    
    numCorrectAnswers++;
    correctLabel.text = [NSString stringWithFormat:@"%d", numCorrectAnswers];
    [self animateCorrectAnswer];
}

-(void)displayIncorrectAnswer
{
    
    numIncorrectAnswers++;
        incorrectLabel.text = [NSString stringWithFormat:@"%d", numIncorrectAnswers];
    [self animateIncorrectAnswer];
}

-(void)animateCorrectAnswer
{
    [UIView animateWithDuration:.15f
                          delay:0.f
                        options:(UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveEaseIn)
                     animations:^
     {
         [UIView setAnimationRepeatCount:4];
         correctLabel.alpha = 0.0f;
     }
                     completion:^(BOOL finished)
     {
         correctLabel.alpha = 1.0f;
     }];
}

-(void)animateIncorrectAnswer
{
    [UIView animateWithDuration:.15f
                          delay:0.f
                        options:(UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveEaseIn)
                     animations:^
     {
         [UIView setAnimationRepeatCount:4];
         incorrectLabel.alpha = 0.0f;
     }
                     completion:^(BOOL finished)
     {
         incorrectLabel.alpha = 1.0f;
     }];
}

@end
