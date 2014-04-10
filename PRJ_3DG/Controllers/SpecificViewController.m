//
//  SpecificViewController.m
//  PRJ_3DG
//
//  Created by linxg on 14-4-8.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "SpecificViewController.h"
#import "SpecificCell.h"
#import "AppDelegate.h"
#import "GoodDetailsViewController.h"

#define buttonHeight 20  //buttonHeight是”销量、价格、上架时间“按钮的高度

@interface SpecificViewController ()

@end

@implementation SpecificViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
//        cell.icon.image = [dic objectForKey:@"icon"];
//        cell.selledNumber.text = [dic objectForKey:@"selledNumber"];
//        cell.detailContent.text = [dic objectForKey:@"detailContent"];
//        cell.price.text = [dic objectForKey:@"price"];
        
        self.datas = [[NSMutableArray alloc] init];
        NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
        [dic setObject:@"error.png" forKey:@"icon"];
        [dic setObject:@"已售12件" forKey:@"selledNumber"];
        [dic setObject:@"Dysmar小宜独家定制2013秋装新款女装 透视长袖T恤 两件套￥347" forKey:@"detailContent"];
        [dic setObject:@"￥68.00" forKey:@"price"];
        for(int i=0;i<20;i++)
        {
            [self.datas addObject:dic];
        }
        NSMutableDictionary * dice = [[NSMutableDictionary alloc] init];
        [dice setObject:@"error.png" forKey:@"icon"];
        [dice setObject:@"已售12件" forKey:@"selledNumber"];
        [dice setObject:@"Dysmar小" forKey:@"detailContent"];
        [dice setObject:@"￥68.00" forKey:@"price"];
        [self.datas addObject:dice];
        
        self.isOpen = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self creatNavigationItem];
    [self createButtons];
    
    PullingRefreshTableView * tableView= [[PullingRefreshTableView alloc] initWithFrame:CGRectMake(0, buttonHeight+6, kDeviceWidth, kDeviceHeight-26-88)];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    NSMutableArray * titles = [[NSMutableArray alloc] initWithObjects:@"首页",@"搜索",@"分类",@"购物车",@"我的", nil];
    ListScrollView * list = [[ListScrollView alloc] initWihtFrame:CGRectMake(210, 0, 100, 150) withTitles:titles];
    list.listDelegate = self;
    list.clipsToBounds = NO;
    list.layer.shadowColor = [UIColor blackColor].CGColor;
    list.layer.shadowOffset = CGSizeMake(5, 5);
    list.layer.shadowOpacity = 1;
    self.list = list;
    [self.view addSubview:list];
    list.hidden = YES;
    
    
}


-(void)creatNavigationItem
{
    UIButton * leftBut = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [leftBut setBackgroundImage:[UIImage imageNamed:@"u4_normal.png"] forState:UIControlStateNormal];
    [leftBut addTarget:self action:@selector(leftBarButtonItemAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBut];

    
    UIButton * listBut = [[UIButton alloc] initWithFrame:CGRectMake(256, 0, 32, 32)];
    [listBut setBackgroundImage:[UIImage imageNamed:@"u114_normal.png"] forState:UIControlStateNormal];
    [listBut addTarget:self action:@selector(rightBarButtonItemAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * listItem = [[UIBarButtonItem alloc] initWithCustomView:listBut];
    
    UIButton * funelBut = [[UIButton alloc] initWithFrame:CGRectMake(288, 0, 32, 32)];
    [funelBut setBackgroundImage:[UIImage imageNamed:@"u99_normal.png"] forState:UIControlStateNormal];
    [funelBut addTarget:self action:@selector(funnelItemAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * funelItem = [[UIBarButtonItem alloc] initWithCustomView:funelBut];

    NSArray * rightItems = [[NSArray alloc] initWithObjects:listItem,funelItem, nil];
    self.navigationItem.rightBarButtonItems = rightItems;
}


-(void)leftBarButtonItemAction:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBarButtonItemAction:(UIBarButtonItem *)sender
{
    if(self.isOpen)
    {
        self.list.hidden = YES;
        self.isOpen = NO;
    }
    else
    {
        self.list.hidden = NO;
        self.isOpen = YES;
    }
}

-(void)funnelItemAction:(UIBarButtonItem *)sender
{
    
}

-(void)createButtons
{
    self.salesBut = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, kDeviceWidth/3.0-1, buttonHeight)];
    [self.salesBut setTitle:@"销量" forState:UIControlStateNormal];
    [self.salesBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.salesBut addTarget:self action:@selector(salesButAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.salesBut];
    
    self.priceBut = [[UIButton alloc]initWithFrame:CGRectMake(kDeviceWidth/3.0, 5, kDeviceWidth/3.0-1, buttonHeight)];
    [self.priceBut setTitle:@"价格" forState:UIControlStateNormal];
    [self.priceBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.priceBut addTarget:self action:@selector(priceButAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.priceBut];
    
    self.shelvesTimeBut = [[UIButton alloc]initWithFrame:CGRectMake(kDeviceWidth/3.0*2, 5, kDeviceWidth/3.0-1, buttonHeight)];
    [self.shelvesTimeBut setTitle:@"上架时间" forState:UIControlStateNormal];
    [self.shelvesTimeBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.shelvesTimeBut addTarget:self action:@selector(shelvesTimeButAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.shelvesTimeBut];
}

-(void)salesButAction:(UIButton *)sender
{

}

-(void)priceButAction:(UIButton *)sender
{

}

-(void)shelvesTimeButAction:(UIButton *)sender
{
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark -tableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return self.datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SpecificCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil)
    {
        cell = [[SpecificCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    NSDictionary * dic = [self.datas objectAtIndex:indexPath.row];
    cell.icon.image = [UIImage imageNamed:@"nav_classify_pic@2x.png"];
    cell.selledNumber.text = [dic objectForKey:@"selledNumber"];
    cell.detailContent.text = [dic objectForKey:@"detailContent"];
    cell.price.text = [dic objectForKey:@"price"];
    return cell;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodDetailsViewController * goodDetailsVC = [[GoodDetailsViewController alloc] init];
    [self.navigationController pushViewController:goodDetailsVC animated:YES];
}

#pragma mark -
#pragma mark -ListScrollViewDelegate

-(void)listCellActionWithIndexPath:(int)indexPath
{
    int tag = indexPath -10000;
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    if(tag == 0)
    {
        delegate.mainTC.selectedIndex = 0;
    }
    else if(tag == 1)
    {
    
    }
    else if(tag == 2)
    {
        delegate.mainTC.selectedIndex = 1;
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else if(tag == 3)
    {
        delegate.mainTC.selectedIndex = 2;
    }
    else if(tag == 4)
    {
        delegate.mainTC.selectedIndex = 3;
    }
    self.list.hidden = YES;
    self.isOpen = NO;
}
@end
