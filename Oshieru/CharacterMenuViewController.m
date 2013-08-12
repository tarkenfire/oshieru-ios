//
//  CharacterMenuViewController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/11/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "CharacterMenuViewController.h"

#import "KanaListViewController.h"
#import "KanaQuizzerViewController.h"
#import "KanjiListViewController.h"

@interface CharacterMenuViewController ()

@end

@implementation CharacterMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Characters";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINavigationBar* navBar = [self.navigationController navigationBar];
    [navBar setTintColor:[UIColor colorWithRed:0.839 green:0.545 blue:0.545 alpha:1]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    //two views needs tab controllers
    UITabBarController* kanaTC = [[UITabBarController alloc] init];
    [kanaTC.tabBar setTintColor:[UIColor colorWithRed:0.839 green:0.545 blue:0.545 alpha:1]];
    
    //create views for hira and kata
    KanaListViewController* kanaLC = [[KanaListViewController alloc] initWithNibName:@"KanaListViewController" bundle:nil];
    KanaQuizzerViewController* kanaQC = [[KanaQuizzerViewController alloc] initWithNibName:@"KanaQuizzerViewController" bundle:nil];
    
    //add to tab controller
    kanaTC.viewControllers = @[kanaLC, kanaQC];
    
    switch ([sender tag])
    {
        case 0: //hiragana
            kanaTC.title = @"Hiragana Study";
            [self.navigationController pushViewController:kanaTC animated:true];
            break;
        case 1: //katakana
            kanaTC.title = @"Katakana Study";
            [self.navigationController pushViewController:kanaTC animated:true];
            break;
        case 2: //kanji
        {
            KanjiListViewController* vc = [[KanjiListViewController alloc] initWithNibName:@"KanjiListViewController" bundle:nil];
            [self.navigationController pushViewController:vc animated:true];
            break;
        }

            
    }
    
}


@end
