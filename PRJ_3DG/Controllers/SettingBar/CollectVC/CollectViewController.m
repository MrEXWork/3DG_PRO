//
//  CollectViewController.m
//  3Dgo
//
//  Created by mac on 14-3-31.
//  Copyright (c) 2014年 LNN. All rights reserved.
//

#import "CollectViewController.h"
#import "DWBtnSelectView.h"

#import "CollectMerchandiseCell.h"
#import "StoreTableViewCell.h"

@interface CollectViewController ()
{
    DWBtnSelectView * _switchBtn;
    
    NSArray * _dataArr;
    
    Collect_Type _collectType;
}
@end

@implementation CollectViewController

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
    
    self.title = @"收藏夹";
    
    // Do any additional setup after loading the view from its nib.
    _switchBtn = [[DWBtnSelectView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), HeadSwitchBtn)];
    _switchBtn.duration = 0.2;
    [_switchBtn btnNameDataWithArr:@[@"商家",@"店铺"] andClickAction:^(NSInteger selectIndex) {
        [self switchBtnSelectEvent:selectIndex];
    }];
    
    //    _switchBtn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin;
    
    [self.view addSubview:_switchBtn];
    
    CGRect tableFrame = CGRectMake(0, HeadSwitchBtn, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - HeadSwitchBtn);
    
    self.tableVCollect.frame = tableFrame;
    
    _dataArr = @[@"ssfds",@"8ashf3",@"askfhej",@"asfs",@"dsfsd",@"9090",@"sdgd"];
}

#pragma mark 切换订单选项
- (void)switchBtnSelectEvent:(NSInteger)index
{
    NSLog(@"%d",index);
//    switch (index) {
//        case 1:
//            _collectType = Collect_Type_Merch;
//            break;
//        case 2:
//            _collectType = Collect_Type_Store;
//            break;
//        default:
//            break;
//    }
    [self.tableVCollect reloadData];
}

#pragma mark tableView Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 86;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArr count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * indentifyMerch = @"indentifyMerchandise";
    static NSString * indentifyStore = @"indentifyStore";
    
    CollectMerchandiseCell * cellMerch = (CollectMerchandiseCell *)[tableView dequeueReusableCellWithIdentifier:indentifyMerch];
    StoreTableViewCell * cellStore = (StoreTableViewCell *)[tableView dequeueReusableCellWithIdentifier:indentifyStore];
    
    if(!cellMerch)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CollectMerchandiseCell" owner:nil options:nil];
        cellMerch = [nib objectAtIndex:0];
    }
    if(!cellStore)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"StoreTableViewCell" owner:nil options:nil];
        cellStore = [nib objectAtIndex:0];
    }
    
    //    cell.textLabel.text = _dataArr[indexPath.row];
    
    switch (_switchBtn.selectIndex)
    {
        case 1:
            return cellMerch;
            break;
        case 2:
            return cellStore;
        default:
            return nil;
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
