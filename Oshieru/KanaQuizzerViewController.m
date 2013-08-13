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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
