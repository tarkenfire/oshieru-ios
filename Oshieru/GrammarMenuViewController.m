//
//  GrammarMenuViewController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/11/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "GrammarMenuViewController.h"

#import "VerbConjSifterViewController.h"
#import "AdjConjSifterViewController.h"
#import "SentenceQuizzerViewController.h"

@interface GrammarMenuViewController ()

@end

@implementation GrammarMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Grammar";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINavigationBar* navBar = [self.navigationController navigationBar];
    [navBar setTintColor:[UIColor colorWithRed:0.545 green:0.714 blue:0.839 alpha:1]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(IBAction)onClick:(id)sender
{
    switch ([sender tag])
    {
        case 0: //verb conjugation
        {
            VerbConjSifterViewController* vc = [[VerbConjSifterViewController alloc] initWithNibName:@"VerbConjSifterViewController" bundle:nil];
            [self.navigationController pushViewController:vc animated:true];
            break;
        }
        case 1: //adjective conjugation
        {
            AdjConjSifterViewController* vc = [[AdjConjSifterViewController alloc] initWithNibName:@"AdjConjSifterViewController" bundle:nil];
            [self.navigationController pushViewController:vc animated:true];
            break;
        }
        case 2: //sentence quizzer
        {
            SentenceQuizzerViewController* vc = [[SentenceQuizzerViewController alloc] initWithNibName:@"SentenceQuizzerViewController" bundle:nil];
            [self.navigationController pushViewController:vc animated:true];
            break;
        }
    }
}

@end
