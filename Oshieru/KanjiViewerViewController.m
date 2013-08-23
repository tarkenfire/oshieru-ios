//
//  KanjiViewerViewController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "KanjiViewerViewController.h"

@interface KanjiViewerViewController ()

@end

@implementation KanjiViewerViewController

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
    localNavigationBar.topItem.title = [NSString stringWithFormat:@"Details for %@", self.selectedKanji.kana];
    
    UIImage* strokeImage = self.selectedKanji.stroke;
    UIImageView* strokeImageContainer = [[UIImageView alloc] init];
    strokeImageContainer.bounds = CGRectMake(0, 0, strokeImage.size.width, strokeImage.size.height);
    strokeImageContainer.frame = CGRectMake(0, 0, strokeImage.size.width, strokeImage.size.height);
    strokeImageContainer.image = strokeImage;
    strokeImageDisplay.contentSize = CGSizeMake(strokeImage.size.width, strokeImageDisplay.frame.size.height);
    [strokeImageDisplay addSubview:strokeImageContainer];
    
    kanjiDisplay.text = self.selectedKanji.kana;
    radicalDisplay.text = self.selectedKanji.radical;
    strokeCountDisplay.text = [NSString stringWithFormat:@"%d", self.selectedKanji.strokeCount];
    kunReadingDisplay.text = self.selectedKanji.kunReadings;
    onReadingDisplay.text = self.selectedKanji.onReadings;
    meaningsDisplay.text = self.selectedKanji.meanings;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClose:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
