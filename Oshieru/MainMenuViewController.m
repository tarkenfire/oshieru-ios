//
//  ViewController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/10/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "MainMenuViewController.h"

#import "CharacterMenuViewController.h"
#import "GrammarMenuViewController.h"
#import "VocabSetViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"Home";
}

-(void)viewDidAppear:(BOOL)animated
{
    UINavigationBar* navBar = [self.navigationController navigationBar];
    [navBar setTintColor:[UIColor colorWithRed:0.839 green:0.545 blue:0.769 alpha:1]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//main menu buttons
-(IBAction)onClick:(id)sender
{
    switch([sender tag])
    {
        case 0: //characters
        {
            CharacterMenuViewController* vc = [[CharacterMenuViewController alloc] initWithNibName:@"CharacterMenuViewController" bundle:nil];
            [self.navigationController pushViewController:vc animated:true];
            break;
        }
        case 1: //grammar
        {
            GrammarMenuViewController* vc = [[GrammarMenuViewController alloc] initWithNibName:@"GrammarMenuViewController" bundle:nil];
            [self.navigationController pushViewController:vc animated:true];
            break;
        }
        case 2: //vocab
        {
            VocabSetViewController* vc = [[VocabSetViewController alloc] initWithNibName:@"VocabSetViewController" bundle:nil];
            [self.navigationController pushViewController:vc animated:true];
            break;
        }
    }
    
}

@end
