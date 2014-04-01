//
//  BaseViewController.h
//  Temp_pro
//
//  Created by MacPro-Mr.Lu on 13-10-30.
//  Copyright (c) 2013年 MacPro-Mr.Lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
{
    
}
-(void)setUpView; //配置视图

-(void)requestData; //请求数据

-(void)showActiveView:(UIView *)view; //显示加载视图

-(void)hideActiveView; //隐藏加载视图


@end
