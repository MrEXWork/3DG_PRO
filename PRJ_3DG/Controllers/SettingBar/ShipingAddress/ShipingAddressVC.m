//
//  ShipingAddressVC.m
//  PRJ_3DG
//
//  Created by mac on 14-4-3.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "ShipingAddressVC.h"
#import "AddressCell.h"

@interface ShipingAddressVC ()
{
    NSArray * _dataArr;
}
@end

@implementation ShipingAddressVC

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
    
    self.title = @"收货地址";
    
    _dataArr = @[@"ssfds",@"8ashf3",@"askfhej",@"asfs",@"dsfsd",@"9090",@"sdgd"];
    
    UITableView * tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    self.tableVAddresss = tableV;
    tableV.delegate = self;
    tableV.dataSource = self;
    tableV.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:tableV];
    
    UIButton * btnAddNew = [UIButton buttonWithType:UIButtonTypeCustom];
    btnAddNew.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 44);
    [btnAddNew setBackgroundColor:[UIColor brownColor]];
    [btnAddNew setTitle:@"新增" forState:UIControlStateNormal];

    self.tableVAddresss.tableFooterView = btnAddNew;
}

#pragma mark tableView Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArr count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * indentifyStr = @"indentifyStr";
    AddressCell * cell = (AddressCell *)[tableView dequeueReusableCellWithIdentifier:indentifyStr];
    if(!cell)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AddressCell" owner:nil options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    //    cell.textLabel.text = _dataArr[indexPath.row];
    
//    if(indexPath.row == [_dataArr count])
//    {
//        cell.cellAddress.hidden = YES;
//        cell.cellName.hidden = YES;
//        cell.cellPhone.hidden = YES;
//        cell.textLabel.textAlignment = NSTextAlignmentCenter;
//        cell.textLabel.text = @"新增";
//    }
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
