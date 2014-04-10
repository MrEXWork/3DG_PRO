//
//  RootViewController.m
//  3Dgo
//
//  Created by mac on 14-3-31.
//  Copyright (c) 2014年 LNN. All rights reserved.
//

#import "SettingViewController.h"
#import "OrderViewController.h"
#import "CollectViewController.h"
#import "PrivilegeViewController.h"
#import "ShipingAddressVC.h"
#import "PasswordViewController.h"

@interface SettingViewController ()
{
    NSDictionary * _dataShow;
}
@end

@implementation SettingViewController

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
    
    _dataShow = @{@"0": @[@"我的订单",@"收藏夹",@"优惠劵"],@"1":@[@"修改收货地址",@"修改账户密码"],@"2":@[@"更多"],@"3":@[@"退出"]};
    
    UITableView * tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStyleGrouped];
    self.tableV = tableV;
    tableV.delegate = self;
    tableV.dataSource = self;
    tableV.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:tableV];
}

#pragma mark tableviewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 3;
            break;
        case 1:
            return 2;
            
        default:
            return 1;
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * indentifyStr = @"indentifyCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifyStr];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifyStr];
    }
    
    NSArray * titlArr = [_dataShow objectForKey:[NSString stringWithFormat:@"%d",indexPath.section]];
    
    cell.textLabel.text = titlArr[indexPath.row];
    
    if(indexPath.section != 3)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.section)
    {
        case 0:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    //订单界面
                    OrderViewController * orderVC = [[OrderViewController alloc]initWithNibName:@"OrderViewController" bundle:nil];
                    
                    [orderVC setHidesBottomBarWhenPushed:YES];
                    [self.navigationController pushViewController:orderVC animated:YES];
                }
                    break;
                case 1:
                {
                    //收藏夹
                    CollectViewController * collectVC = [[CollectViewController alloc]init];
                    [collectVC setHidesBottomBarWhenPushed:YES];
                    [self.navigationController pushViewController:collectVC animated:YES];
                }
                    break;
                case 2:
                {
                    //优惠劵
                    PrivilegeViewController * privilegeVC = [[PrivilegeViewController alloc]init];
                    [privilegeVC setHidesBottomBarWhenPushed:YES];
                    [self.navigationController pushViewController:privilegeVC animated:YES];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    //修改收货地址
                    ShipingAddressVC * shipingAddVC = [[ShipingAddressVC alloc]init];
                    [shipingAddVC setHidesBottomBarWhenPushed:YES];
                    [self.navigationController pushViewController:shipingAddVC animated:YES];
                }
                    break;
                case 1:
                {
                    //修改密码
                    PasswordViewController * passwordVC = [[PasswordViewController alloc]init];
                    [passwordVC setHidesBottomBarWhenPushed:YES];
                    [self.navigationController pushViewController:passwordVC animated:YES];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
        
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
