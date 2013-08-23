//
//  KanjiListViewController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "KanjiListViewController.h"
#import "KanjiViewerViewController.h"

#import "KanjiCell.h"

@interface KanjiListViewController ()

@end

@implementation KanjiListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"N5 Kanji";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    databaseController = [DatabaseController getInstance];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//table code
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%d", [databaseController getDataCount]);
    return [databaseController getDataCount];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"Cell";
    
    KanjiCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell)
    {
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"KanjiCell" owner:self options:nil];
        cell = [views objectAtIndex:0];
    }
    //I don't understand why xcode/objc was throwing a hissy fit about just using the indexpath.row number by itself.
    NSInteger holder = indexPath.row;
    int index = holder;
    NSNumber* indexNum = databaseController.indexes[index];
    
    Kanji* kanjiToDisplay = [databaseController getKanjiWithId:[indexNum intValue]];
    
    cell.kanjiDisplay.text = kanjiToDisplay.kana;
    cell.meanings.text = kanjiToDisplay.meanings;
    cell.strokes.text = [NSString stringWithFormat:@"Strokes: %d", kanjiToDisplay.strokeCount];
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KanjiViewerViewController* vc = [[KanjiViewerViewController alloc] initWithNibName:@"KanjiViewerViewController" bundle:nil];
    
    //I don't understand why xcode/objc was throwing a hissy fit about just using the indexpath.row number by itself.
    NSInteger holder = indexPath.row;
    int index = holder;
    NSNumber* indexNum = databaseController.indexes[index];
    
    vc.selectedKanji = [databaseController getKanjiWithId:[indexNum intValue]];
    
    [self presentViewController:vc animated:true completion:nil];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
}

@end
