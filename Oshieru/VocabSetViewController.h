//
//  VocabSetViewController.h
//  Oshieru
//
//  Created by Michael Mancuso on 8/11/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VocabularyController.h"

@interface VocabSetViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
{
    VocabularyController* vocabController;
    IBOutlet UICollectionView* colView;
}

@end
