//
//  GoodDetailsViewController.h
//  PRJ_3DG
//
//  Created by linxg on 14-4-9.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "BaseViewController.h"
#import "ListScrollView.h"

@interface GoodDetailsViewController : BaseViewController<ListScrollViewDelegate>

@property (assign, nonatomic) BOOL isOpen;
@property (strong, nonatomic) ListScrollView * list;
@property (strong, nonatomic) UIButton * introduction;
@property (strong, nonatomic) UIButton * details;
@property (strong, nonatomic) UIButton * evaluation;

@end
