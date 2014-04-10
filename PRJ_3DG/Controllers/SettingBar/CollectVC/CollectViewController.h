//
//  CollectViewController.h
//  3Dgo
//
//  Created by mac on 14-3-31.
//  Copyright (c) 2014年 LNN. All rights reserved.
//

#import "BaseViewController.h"

typedef enum
{
    Collect_Type_Merch,
    Collect_Type_Store
}Collect_Type;

@interface CollectViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (retain, nonatomic) UITableView *tableVCollect;
@end
