//
//  KanjiViewerViewController.h
//  Oshieru
//
//  Created by Michael Mancuso on 8/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Kanji.h"

@interface KanjiViewerViewController : UIViewController
{
    IBOutlet UILabel* kanjiDisplay;
    IBOutlet UILabel* radicalDisplay;
    IBOutlet UILabel* strokeCountDisplay;
    IBOutlet UIScrollView* strokeImageDisplay;
    IBOutlet UILabel* kunReadingDisplay;
    IBOutlet UILabel* onReadingDisplay;
    IBOutlet UILabel* meaningsDisplay;
    
    IBOutlet UINavigationBar* localNavigationBar;
}

@property Kanji* selectedKanji;

-(IBAction)onClose:(id)sender;
@end
