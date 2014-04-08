//
//  SpecificViewController.h
//  PRJ_3DG
//
//  Created by linxg on 14-4-8.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "BaseViewController.h"
#import "PullingRefreshTableView.h"
#import "ListScrollView.h"

@interface SpecificViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,PullingRefreshTableViewDelegate,ListScrollViewDelegate>

@property (strong, nonatomic) UIButton * salesBut;
@property (strong, nonatomic) UIButton * priceBut;
@property (strong, nonatomic) UIButton * shelvesTimeBut;
@property (strong, nonatomic) ListScrollView * list;

@property (strong, nonatomic) NSMutableArray * datas;
@property (assign, nonatomic) BOOL isOpen;

@end
