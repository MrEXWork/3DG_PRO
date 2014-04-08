//
//  ClassifyViewController.h
//  PRJ_3DG
//
//  Created by MacPro-Mr.Lu on 14-4-2.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "BaseViewController.h"
#import "PullingRefreshTableView.h"
#import "ASIHTTPRequest.h"

@interface ClassifyViewController : BaseViewController<PullingRefreshTableViewDelegate,UITableViewDataSource,UITableViewDelegate,ASIHTTPRequestDelegate>

@property (strong, nonatomic) NSMutableArray * datas;

@end
