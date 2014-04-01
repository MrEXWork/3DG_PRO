//
//  BaseViewController.m
//  Temp_pro
//
//  Created by MacPro-Mr.Lu on 13-10-30.
//  Copyright (c) 2013年 MacPro-Mr.Lu. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
{
    __strong UIActivityIndicatorView * activityIndicatorView;
}

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(void)loadView
{
    UIView * view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    self.view = view;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configuration];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)configuration
{
    self.navigationController.navigationBar.translucent = NO;
    
    if (SYSTEM_VERSION_MORE_THAN(7.0)) {
       [self setAutomaticallyAdjustsScrollViewInsets:NO];
    }
    
    //设置导航栏颜色
    if (SYSTEM_VERSION_LESS_THAN(7.0)) {
        [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    }
    else
        [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
//    if (SYSTEM_VERSION_MORE_THAN(7.0)) {
//        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.0/255.0 green:130.0/255.0 blue:250.0/255.0 alpha:1];
//        [self.navigationController.navigationBar setBackgroundImage:[[UIImage imageNamed:@"bar_navigation_64"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)] forBarPosition:UIBarPositionTop  barMetrics:UIBarMetricsDefault];
//    }

}

-(void)showActiveView:(UIView *)view
{
    if (activityIndicatorView == nil) {
        activityIndicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityIndicatorView.center = view.center;
        [view addSubview:activityIndicatorView];
    }
    [activityIndicatorView bringSubviewToFront:[view.subviews objectAtIndex:0]];
    [activityIndicatorView startAnimating];
}

-(void)hideActiveView
{
    [activityIndicatorView stopAnimating];
}

-(void)setUpView
{
    
}

-(void)requestData
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 横屏支持
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return interfaceOrientation == UIInterfaceOrientationPortrait;
}

#pragma ios6横屏支持
- (NSUInteger)supportedInterfaceOrientations
{
	return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate
{
	return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
	return UIInterfaceOrientationPortrait;
}

@end
