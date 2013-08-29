//
//  VocabViewerViewController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/11/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "VocabViewerViewController.h"
#import "VocabDetailCell.h"

@interface VocabViewerViewController ()

@end

@implementation VocabViewerViewController

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
    
    self.title = [self.vocabSet objectForKey:@"set_name"];
    vocabWords = [self.vocabSet objectForKey:@"vocab"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//table methods
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [vocabWords count];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"Cell";
    
    VocabDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell)
    {
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"VocabDetailCell" owner:self options:nil];
        cell = [views objectAtIndex:0];
    }
    
    NSDictionary* vocab = [vocabWords objectAtIndex:indexPath.row];
    
    cell.kanaLabel.text = [vocab objectForKey:@"kana"];
    cell.romaLabel.text = [vocab objectForKey:@"roma"];
    cell.meaningLabel.text = [vocab objectForKey:@"meaning"];
    
    cell.indexLabel.text = [NSString stringWithFormat:@"#%d", indexPath.row + 1];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
