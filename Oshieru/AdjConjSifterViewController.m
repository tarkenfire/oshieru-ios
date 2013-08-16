//
//  AdjConjSifterViewController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "AdjConjSifterViewController.h"

@interface AdjConjSifterViewController ()

@end

@implementation AdjConjSifterViewController

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
    containerView.hidden = true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    //check for reset button
    if ([sender tag] == 0)
    {
        [self reset];
        return;
    }

    [self.view endEditing:YES];
    
    adje = entryField.text;
    
    //check for nil
    if (![adje isEqualToString:@""])
    {
        [self getAdjectiveType];
    }

}

//private methods
-(void)getAdjectiveType
{
    //only works with romaji (english characters). This unfortunatly makes it an incomplete implementation.
    if ([adje hasSuffix:@"i"])
    {
        [self conjugateIAdjective];
    }
    else //is na adjective
    {
        [self conjugateNaAdjective];
    }
}

-(void)conjugateNaAdjective
{
    containerView.hidden = false;
    
    baseLabel.text = adje;
    posPreFormal.text = [NSString stringWithFormat:@"%@ desu", adje];
    posPreCasual.text = [NSString stringWithFormat:@"%@ da", adje ];
    posPastFormal.text = [NSString stringWithFormat:@"%@ deshita", adje];
    posPastCasual.text = [NSString stringWithFormat:@"%@ datta", adje];
    negPreFormal.text = [NSString stringWithFormat:@"%@ dewa arimasen", adje];
    negPreCasual.text = [NSString stringWithFormat:@"%@ dewa nai", adje];
    negPastFormal.text = [NSString stringWithFormat:@"%@ dewa arimasen deshita", adje];
    negPastCasual.text = [NSString stringWithFormat:@"%@ dewa nakatta", adje];
}

-(void)conjugateIAdjective
{
    containerView.hidden = false;
    
    NSString* base = [adje substringWithRange:NSMakeRange(0, [adje length] - 1)];
    baseLabel.text = adje;
    posPreFormal.text = [NSString stringWithFormat:@"%@i desu", base];
    posPreCasual.text = [NSString stringWithFormat:@"%@i", base];
    posPastFormal.text = [NSString stringWithFormat:@"%@katta desu", base];
    posPastCasual.text = [NSString stringWithFormat:@"%@katta", base];
    negPreFormal.text = [NSString stringWithFormat:@"%@ku nai desu", base];
    negPreCasual.text = [NSString stringWithFormat:@"%@ku nai", base];
    negPastFormal.text = [NSString stringWithFormat:@"%@ku nakatta desu", base];
    negPastCasual.text = [NSString stringWithFormat:@"%@ku nakatta", base];
}

-(void)reset
{
    containerView.hidden = true;
    [entryField setText:@""];
    [self.view endEditing:YES];
}
@end
