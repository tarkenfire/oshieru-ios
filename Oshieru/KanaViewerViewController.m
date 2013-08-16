//
//  KanaViewerViewController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/11/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "KanaViewerViewController.h"

@interface KanaViewerViewController ()

@end

@implementation KanaViewerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    characterDataController = [CharacterDataController getInstance];
    
    //create object for character
    NSDictionary* selectedCharacter = characterDataController.kanaList[characterDataController.selectedIndex];
    
    localNavBar.topItem.title = [NSString stringWithFormat:@"Details for %@(%@)", [selectedCharacter objectForKey:@"char"], [selectedCharacter objectForKey:@"char_roma"]];
    
    kanaDisplay.text = [selectedCharacter objectForKey:@"char"];
    strokeOrder.image = [UIImage imageNamed:[selectedCharacter objectForKey:@"stroke_img"]];
    originKana.text = [selectedCharacter objectForKey:@"origin_kanji"];
    spellingKana.text = [selectedCharacter objectForKey:@"spelling_kana"];
    spellingKanaRoma.text = [selectedCharacter objectForKey:@"spelling_roma"];
    morseCode.text = [selectedCharacter objectForKey:@"morse_code"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onDonePressed:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
