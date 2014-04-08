//
//  ClassifyViewController.h
//  PRJ_3DG
//
//  Created by MacPro-Mr.Lu on 14-4-2.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "BaseViewController.h"
#import "PullingRefreshTableView.h"
#import "NetTool.h"

@interface ClassifyViewController : BaseViewController<PullingRefreshTableViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray * datas;

@end
