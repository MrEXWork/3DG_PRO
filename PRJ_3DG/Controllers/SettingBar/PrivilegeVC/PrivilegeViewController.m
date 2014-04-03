//
//  PrivilegeViewController.m
//  PRJ_3DG
//
//  Created by mac on 14-4-3.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "PrivilegeViewController.h"
#import "PrivilegeCell.h"

@interface PrivilegeViewController ()
{
    NSArray * _dataArr;
}
@end

@implementation PrivilegeViewController

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
    
    self.title = @"优惠劵";
    
    _dataArr = @[@"ssfds",@"8ashf3",@"askfhej",@"asfs",@"dsfsd",@"9090",@"sdgd"];
}

#pragma mark tableView Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArr count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * indentifyStr = @"indentifyStr";
    PrivilegeCell * cell = (PrivilegeCell *)[tableView dequeueReusableCellWithIdentifier:indentifyStr];
    if(!cell)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PrivilegeCell" owner:nil options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    //    cell.textLabel.text = _dataArr[indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
