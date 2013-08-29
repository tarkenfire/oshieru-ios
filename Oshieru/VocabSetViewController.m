//
//  VocabSetViewController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/11/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "VocabSetViewController.h"
#import "VocabViewerViewController.h"
#import "VocabCell.h"

@interface VocabSetViewController ()

@end

@implementation VocabSetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Vocabulary Sets";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINavigationBar* navBar = [self.navigationController navigationBar];
    [navBar setTintColor:[UIColor colorWithRed:0.545 green:0.839 blue:0.718 alpha:1]];
    
    vocabController = [VocabularyController getInstance];
    
    if ([vocabController vocabListCount] == 0)
    {
        [vocabController loadVocabListWithFileName:@"animals"];
        [vocabController loadVocabListWithFileName:@"weather"];
    }
    
    UINib* cellNib = [UINib nibWithNibName:@"VocabCell" bundle:nil];
    
    NSLog(@"%d", [vocabController vocabListCount]);
    [colView registerNib:cellNib forCellWithReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//cell methods
//collection view methods
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [vocabController vocabListCount];
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VocabCell* cell = [colView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.setName.text = [vocabController getVocabListNameAtIndex:indexPath.row];
    cell.setNumber.text = [NSString stringWithFormat:@"Set %d", indexPath.row + 1];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    VocabViewerViewController* vc = [[VocabViewerViewController alloc] initWithNibName:@"VocabViewerViewController" bundle:nil];
    vc.vocabSet = [vocabController getVocabListAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:vc animated:true];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


@end
