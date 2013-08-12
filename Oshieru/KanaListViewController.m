//
//  KanaListViewController.m
//  Oshieru
//
//  Created by Michael Mancuso on 8/11/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "KanaListViewController.h"
#import "KanaViewerViewController.h"

@interface KanaListViewController ()

@end

@implementation KanaListViewController

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
    
}

-(void)viewDidAppear:(BOOL)animated
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//private methods


//table code
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [characterDataController getKanaCount];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    NSDictionary* currentKana = characterDataController.kanaList[indexPath.row];
    
    cell.textLabel.text = [currentKana objectForKey:@"char"];
    cell.detailTextLabel.text = [currentKana objectForKey:@"char_roma"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KanaViewerViewController* kanaView = [[KanaViewerViewController alloc] initWithNibName:@"KanaViewerViewController" bundle:nil];
    
    characterDataController.selectedIndex = indexPath.row;
    
    [self presentViewController:kanaView animated:true completion:nil];
}

@end
