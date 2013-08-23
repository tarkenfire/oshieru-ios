//
//  KanjiListViewController.h
//  Oshieru
//
//  Created by Michael Mancuso on 8/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseController.h"

@interface KanjiListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    DatabaseController* databaseController;
}

@end
