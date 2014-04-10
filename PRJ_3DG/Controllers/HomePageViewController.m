//
//  HomePageViewController.m
//  PRJ_3DG
//
//  Created by MacPro-Mr.Lu on 14-4-2.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "HomePageViewController.h"
#import "PullingRefreshTableView.h"
#import "CycleScrollView.h"

@interface HomePageViewController ()<PullingRefreshTableViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    PullingRefreshTableView * _pullTableV;
    
    CycleScrollView * _headScorllView;
}
@end

@implementation HomePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setUpView];
}

- (void)setUpView
{
    _pullTableV = [[PullingRefreshTableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain pullingDelegate:self];
    
    _pullTableV.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight;
    _pullTableV.dataSource = self;
    _pullTableV.delegate = self;
    [self.view addSubview:_pullTableV];
    
    
    NSMutableArray *viewsArray = [@[] mutableCopy];
    NSArray *colorArray = @[[UIColor cyanColor],[UIColor blueColor],[UIColor greenColor],[UIColor yellowColor],[UIColor purpleColor]];
    for (int i = 0; i < 5; ++i) {
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
        tempLabel.backgroundColor = [(UIColor *)[colorArray objectAtIndex:i] colorWithAlphaComponent:0.5];
        [viewsArray addObject:tempLabel];
    }
    
    _headScorllView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 150) animationDuration:2];
    _headScorllView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.1];
    _headScorllView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
        return viewsArray[pageIndex];
    };
    _headScorllView.totalPagesCount = ^NSInteger(void){
        return 5;
    };
    _headScorllView.TapActionBlock = ^(NSInteger pageIndex){
        NSLog(@"点击了第%d个",pageIndex);
    };

    _pullTableV.tableHeaderView = _headScorllView;
}

#pragma mark tableview delgate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIndentify = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndentify];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentify];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"row == %d",indexPath.row];
    
    return cell;
}

#pragma mark 上啦 下拉
//刷新
-(void)pullingTableViewDidStartRefreshing:(PullingRefreshTableView *)tableView
{
    
}
//加载更多
-(void)pullingTableViewDidStartLoading:(PullingRefreshTableView *)tableView
{

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
