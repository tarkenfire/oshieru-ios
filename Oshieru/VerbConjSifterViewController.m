//
//  VerbConjSifterViewController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "VerbConjSifterViewController.h"

@interface VerbConjSifterViewController ()

@end

@implementation VerbConjSifterViewController

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
    
    verb = entryField.text;
    
    //check for nil
    if (![verb isEqualToString:@""])
    {
        [self findVerbType];
    }
}

//private functions

-(void)findVerbType
{
    NSLog(@"%@", verb);
    //there's 2 (consistantly) irregular verbs, check for those first.
    if([self isEqualIgnoringCase:verb secondString:@"suru"] || [self isEqualIgnoringCase:verb secondString:@"kuru"] || [verb isEqualToString:@"する"] || [verb isEqualToString:@"くる"])
    {
        [self conjugateIrregularVerb];
    }
    else if ([verb hasSuffix:@"ru"] || [verb hasSuffix:@"る"] || [verb hasSuffix:@"ル"]) //is ru verb
    {
        [self conjugateRUVerb];
    }
    else if ([verb hasSuffix:@"u"] || [verb hasSuffix:@"う"] || [verb hasSuffix:@"ウ"]) //is u verb
    {
        [self conjugateUVerb];
    }
    else //not verb
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Invalid Entry"
                                                          message:@"Entry is not a valid verb. Please try again."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }

}

-(void)conjugateRUVerb
{
    containerView.hidden = false;
    
    if ([verb hasSuffix:@"る"]) //is kana
    {
        NSString* base = [verb substringWithRange:NSMakeRange(0, [verb length] - 1)];
        
        baseLabel.text = verb;
        teFormLabel.text = [NSString stringWithFormat:@"%@て", base];
        taFormLabel.text = [NSString stringWithFormat:@"%@た", base];
        iFormLabel.text = base; //i form is just hte base for ru verbs
        negativeFormLabel.text = [NSString stringWithFormat:@"%@ない", base];
        causitiveFormLabel.text = [NSString stringWithFormat:@"%@させる", base];
        passiveFormLabel.text = [NSString stringWithFormat:@"%@られる", base];
        potentialFormLabel.text = [NSString stringWithFormat:@"%@られる", base];
        conditionalFormLabel.text = [NSString stringWithFormat:@"%@れば", base];
        volitionalFormLabel.text = [NSString stringWithFormat:@"%@よう", base];
        politeFormLabel.text = [NSString stringWithFormat:@"%@ます", base];
        
    }
    else //is roma
    {
        NSString* base = [verb substringWithRange:NSMakeRange(0, [verb length] - 2)];

        baseLabel.text = verb;
        teFormLabel.text = [NSString stringWithFormat:@"%@te", base];
        taFormLabel.text = [NSString stringWithFormat:@"%@ta", base];
        iFormLabel.text = base; //i form is just hte base for ru verbs
        negativeFormLabel.text = [NSString stringWithFormat:@"%@nai", base];
        causitiveFormLabel.text = [NSString stringWithFormat:@"%@saseru", base];
        passiveFormLabel.text = [NSString stringWithFormat:@"%@rareru", base];
        potentialFormLabel.text = [NSString stringWithFormat:@"%@rareru", base];
        conditionalFormLabel.text = [NSString stringWithFormat:@"%@reba", base];
        volitionalFormLabel.text = [NSString stringWithFormat:@"%@you", base];
        politeFormLabel.text = [NSString stringWithFormat:@"%@masu", base];
    }
}

-(void)conjugateUVerb
{
    containerView.hidden = false;
    
    //there are special cases for U verbs. This does not take into account for these cases. That is a bug.
    if ([verb hasSuffix:@"う"]) //is kana
    {
        NSString* base = [verb substringWithRange:NSMakeRange(0, [verb length] - 1)];
        
        baseLabel.text = verb;
        teFormLabel.text = [NSString stringWithFormat:@"%@して", base];
        taFormLabel.text = [NSString stringWithFormat:@"%@した", base];
        iFormLabel.text = [NSString stringWithFormat:@"%@い", base];
        negativeFormLabel.text = [NSString stringWithFormat:@"%@あない", base];
        causitiveFormLabel.text = [NSString stringWithFormat:@"%@あせる", base];
        passiveFormLabel.text = [NSString stringWithFormat:@"%@あれる", base];
        potentialFormLabel.text = [NSString stringWithFormat:@"%@える", base];
        conditionalFormLabel.text = [NSString stringWithFormat:@"%@えば", base];
        volitionalFormLabel.text = [NSString stringWithFormat:@"%@おう", base];
        politeFormLabel.text = [NSString stringWithFormat:@"%@います", base];
    }
    else //is roma
    {
        NSString* base = [verb substringWithRange:NSMakeRange(0, [verb length] - 1)];
        baseLabel.text = verb;
        teFormLabel.text = [NSString stringWithFormat:@"%@shite", base];
        taFormLabel.text = [NSString stringWithFormat:@"%@shita", base];
        iFormLabel.text = [NSString stringWithFormat:@"%@i", base];
        negativeFormLabel.text = [NSString stringWithFormat:@"%@anai", base];
        causitiveFormLabel.text = [NSString stringWithFormat:@"%@aseru", base];
        passiveFormLabel.text = [NSString stringWithFormat:@"%@areru", base];
        potentialFormLabel.text = [NSString stringWithFormat:@"%@eru", base];
        conditionalFormLabel.text = [NSString stringWithFormat:@"%@eba", base];
        volitionalFormLabel.text = [NSString stringWithFormat:@"%@ou", base];
        politeFormLabel.text = [NSString stringWithFormat:@"%@imasu", base];
    }
}

-(void)conjugateIrregularVerb
{
    containerView.hidden = false;
    
    if ([self isEqualIgnoringCase:verb secondString:@"suru"])
    {
        baseLabel.text = @"Suru";
        teFormLabel.text = @"Shite";
        taFormLabel.text = @"Shita";
        iFormLabel.text = @"Shi";
        negativeFormLabel.text = @"Saseru";
        causitiveFormLabel.text = @"Saseru";
        passiveFormLabel.text = @"Dekiru";
        potentialFormLabel.text = @"Sureba";
        conditionalFormLabel.text = @"Shiyou";
        volitionalFormLabel.text = @"Shiyou";
        politeFormLabel.text = @"Shimasu";
    }
    else if ([verb isEqualToString:@"する"])
    {
        baseLabel.text = @"する";
        teFormLabel.text = @"して";
        taFormLabel.text = @"した";
        iFormLabel.text = @"し";
        negativeFormLabel.text = @"させる";
        causitiveFormLabel.text = @"サせる";
        passiveFormLabel.text = @"でける";
        potentialFormLabel.text = @"すれば";
        conditionalFormLabel.text = @"しよう";
        volitionalFormLabel.text = @"しよう";
        politeFormLabel.text = @"します";
    }
    else if ([self isEqualIgnoringCase:verb secondString:@"kuru"])
    {
        baseLabel.text = @"Kuru";
        teFormLabel.text = @"Kite";
        taFormLabel.text = @"Kita";
        iFormLabel.text = @"Ki";
        negativeFormLabel.text = @"Kisaseru";
        causitiveFormLabel.text = @"Korareru";
        passiveFormLabel.text = @"Korareru";
        potentialFormLabel.text = @"Kureba";
        conditionalFormLabel.text = @"Koyou";
        volitionalFormLabel.text = @"Koyou";
        politeFormLabel.text = @"Kimasu";
    }
    else //is くる
    {
        baseLabel.text = @"くる";
        teFormLabel.text = @"きて";
        taFormLabel.text = @"きた";
        iFormLabel.text = @"き";
        negativeFormLabel.text = @"きさせる";
        causitiveFormLabel.text = @"こられる";
        passiveFormLabel.text = @"こられる";
        potentialFormLabel.text = @"くれば";
        conditionalFormLabel.text = @"こよう";
        volitionalFormLabel.text = @"こよう";
        politeFormLabel.text = @"きます";
    }
}

//counters bug in caseinsensitivecompare that makes it always return true when called across methods.
- (BOOL)isEqualIgnoringCase:(NSString *)firstString secondString:(NSString*)secondString
{
    return [firstString caseInsensitiveCompare:secondString] == NSOrderedSame;
}

-(void)reset
{
    containerView.hidden = true;
    [entryField setText:@""];
    [self.view endEditing:YES];
}

@end
