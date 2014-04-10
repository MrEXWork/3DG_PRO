//
//  GoodDetailsViewController.m
//  PRJ_3DG
//
//  Created by linxg on 14-4-9.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "GoodDetailsViewController.h"
#import "AppDelegate.h"

#define buttonHeight 20

@interface GoodDetailsViewController ()

@end

@implementation GoodDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         self.isOpen = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self setNavigation];
    [self createButtons];
    
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

-(void)createButtons
{
    self.introduction = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, kDeviceWidth/3.0-1, buttonHeight)];
    [self.introduction setTitle:@"商品简介" forState:UIControlStateNormal];
    [self.introduction setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.introduction addTarget:self action:@selector(introductionButAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.introduction];
    
    self.details = [[UIButton alloc]initWithFrame:CGRectMake(kDeviceWidth/3.0, 5, kDeviceWidth/3.0-1, buttonHeight)];
    [self.details setTitle:@"图文详情" forState:UIControlStateNormal];
    [self.details setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.details addTarget:self action:@selector(detailsButAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.details];
    
    self.evaluation = [[UIButton alloc]initWithFrame:CGRectMake(kDeviceWidth/3.0*2, 5, kDeviceWidth/3.0-1, buttonHeight)];
    [self.evaluation setTitle:@"用户评价" forState:UIControlStateNormal];
    [self.evaluation setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.evaluation addTarget:self action:@selector(evaluationButAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.evaluation];
}

-(void)introductionButAction:(UIButton *)sender
{
    
}

-(void)detailsButAction:(UIButton *)sender
{
    
}

-(void)evaluationButAction:(UIButton *)sender
{

}

-(void)setNavigation
{
    
    self.title = @"商品详情";
    
    UIButton * leftBut = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [leftBut setBackgroundImage:[UIImage imageNamed:@"u4_normal.png"] forState:UIControlStateNormal];
    [leftBut addTarget:self action:@selector(leftBarButtonItemAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBut];
    
    UIButton * listBut = [[UIButton alloc] initWithFrame:CGRectMake(256, 0, 32, 32)];
    [listBut setBackgroundImage:[UIImage imageNamed:@"u114_normal.png"] forState:UIControlStateNormal];
    [listBut addTarget:self action:@selector(rightBarButtonItemAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:listBut];
}

-(void)leftBarButtonItemAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBarButtonItemAction:(UIButton *)sender
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
