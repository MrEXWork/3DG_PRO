//
//  UIAlertView+utils.h
//  Btn_HQHD_2.0
//
//  Created by MacPro-Mr.Lu on 14-3-20.
//  Copyright (c) 2014年 XMGD_Mr.Lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (utils)

/**
 *	显示提醒框
 *
 *	@param	title	标题
 *	@param	tag	标签
 *	@param	cancelTitle	按钮标题
 *	@param	ensureTitle	按钮标题
 *	@param	delegate	代理
 */
+(void)showAlertViewWithTitle:(NSString *)title tag:(int)tag cancelTitle:(NSString *)btnTitle ensureTitle:(NSString *)ensureTitle delegate:(id<UIAlertViewDelegate>)delegate;

/**
 *	显示提醒框
 *
 *	@param	title	标题
 *	@param	message	信息
 *	@param	cancelTitle	按钮标题
 */
+(void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)btnTitle;

@end
