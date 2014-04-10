//
//  OrderViewController.m
//  3Dgo
//
//  Created by mac on 14-3-31.
//  Copyright (c) 2014年 LNN. All rights reserved.
//

#import "OrderViewController.h"
#import "DWBtnSelectView.h"
#import "OrderCell.h"

@interface OrderViewController ()
{
    DWBtnSelectView * _switchBtn;
    
    NSArray * _dataArr;
}
@end

@implementation OrderViewController

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
    
    self.title = @"订单";
    
    // Do any additional setup after loading the view from its nib.

    _dataArr = @[@"ssfds",@"8ashf3",@"askfhej",@"asfs",@"dsfsd",@"9090",@"sdgd"];

    [self setUpView];
}

-(void)setUpView
{
    _switchBtn = [[DWBtnSelectView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), HeadSwitchBtn)];
    _switchBtn.duration = 0.2;
    [_switchBtn btnNameDataWithArr:@[@"近一个月的订单",@"一个月前的订单"] andClickAction:^(NSInteger selectIndex) {
        [self switchBtnSelectEvent:selectIndex];
    }];
    
    [self.view addSubview:_switchBtn];
    
    CGRect tableFrame = CGRectMake(0, HeadSwitchBtn, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - HeadSwitchBtn);
    
    UITableView * tableV = [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStylePlain];
    self.tableVOrder = tableV;
    tableV.delegate = self;
    tableV.dataSource = self;
    tableV.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:tableV];
}

#pragma mark 切换订单选项
- (void)switchBtnSelectEvent:(NSInteger)index
{
    NSLog(@"%d",index);
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
    OrderCell * cell = (OrderCell *)[tableView dequeueReusableCellWithIdentifier:indentifyStr];
    if(!cell)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"OrderCell" owner:nil options:nil];
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
