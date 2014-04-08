//
//  AppDelegate.m
//  Temp_Pro
//
//  Created by MacPro-Mr.Lu on 14-3-26.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+utils.h"

#import "HomePageViewController.h"
#import "ClassifyViewController.h"
#import "ShoppingCartViewController.h"
#import "SettingViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //配置视图
    [self setupView];
    
    
    
    //
    [self.window makeKeyAndVisible];
    
    NSLog(@"WWWW");
    
    return YES;
}

//配置视图
- (void)setupView
{
    self.mainTC = [[UITabBarController alloc]init];
    self.mainNC = [[UINavigationController alloc]initWithRootViewController:self.mainNC];
    
    HomePageViewController * homePageVC = [[HomePageViewController alloc]init];
    homePageVC.title = @"3DG";
    UINavigationController * homePageNavc = [[UINavigationController alloc]initWithRootViewController:homePageVC];
    UITabBarItem *itemHomePage= [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"nav_index_pic.png"]  tag:0];
    homePageNavc.tabBarItem=itemHomePage;
    
    ClassifyViewController * classifyVC = [[ClassifyViewController alloc]init];
    classifyVC.title = @"商品类目";
    UINavigationController * classifyNavc = [[UINavigationController alloc]initWithRootViewController:classifyVC];
    UITabBarItem *itemClassify= [[UITabBarItem alloc] initWithTitle:@"分类" image:[UIImage imageNamed:@"nav_classify_pic.png"]  tag:1];
    classifyNavc.tabBarItem=itemClassify;
    
    ShoppingCartViewController * shoppingCartVC = [[ShoppingCartViewController alloc]init];
    shoppingCartVC.title = @"购物车";
    UINavigationController * shoppingCartNavc = [[UINavigationController alloc]initWithRootViewController:shoppingCartVC];
    UITabBarItem *itemShoppingCart= [[UITabBarItem alloc] initWithTitle:@"购物车" image:[UIImage imageNamed:@"nav_shop_pic.png"]  tag:2];
    shoppingCartNavc.tabBarItem=itemShoppingCart;
    
    //*******设置*******
    SettingViewController * settingVC = [[SettingViewController alloc]init];
    settingVC.title = @"设置";
    UINavigationController * settingNavc = [[UINavigationController alloc]initWithRootViewController:settingVC];
    UITabBarItem *itemSetting= [[UITabBarItem alloc] initWithTitle:@"设置" image:[UIImage imageNamed:@"nav_more_pic.png"]  tag:3];
    settingNavc.tabBarItem=itemSetting;
    
    self.mainTC.viewControllers = @[homePageNavc,classifyNavc,shoppingCartNavc,shoppingCartNavc,settingNavc];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = self.mainTC;
}

+(AppDelegate *)shareDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
