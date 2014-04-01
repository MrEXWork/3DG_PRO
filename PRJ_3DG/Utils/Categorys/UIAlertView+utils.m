//
//  UIAlertView+utils.m
//  Btn_HQHD_2.0
//
//  Created by MacPro-Mr.Lu on 14-3-20.
//  Copyright (c) 2014年 XMGD_Mr.Lu. All rights reserved.
//

#import "UIAlertView+utils.h"

@implementation UIAlertView (utils)

+(void)showAlertViewWithTitle:(NSString *)title tag:(int)tag cancelTitle:(NSString *)btnTitle ensureTitle:(NSString *)ensureTitle delegate:(id<UIAlertViewDelegate>)delegate
{
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:title message:nil delegate:delegate cancelButtonTitle:btnTitle otherButtonTitles:ensureTitle,nil];
    alertView.tag = tag;
    [alertView show];
}

+(void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)btnTitle
{
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:btnTitle otherButtonTitles:nil];
    [alertView show];
}

@end
