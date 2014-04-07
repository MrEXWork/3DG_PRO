//
//  AppDelegate.h
//  Temp_Pro
//
//  Created by MacPro-Mr.Lu on 14-3-26.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *mainNC;
@property (strong, nonatomic) UITabBarController *mainTC;
@property (strong, nonatomic) Reachability *reachability;

+(AppDelegate *)shareDelegate;

@end
