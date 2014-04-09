//
//  OrderViewController.h
//  3Dgo
//
//  Created by mac on 14-3-31.
//  Copyright (c) 2014年 LNN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface OrderViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>


@property (retain, nonatomic) UITableView *tableVOrder;

@end
