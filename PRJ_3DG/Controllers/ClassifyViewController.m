//
//  ClassifyViewController.m
//  PRJ_3DG
//
//  Created by MacPro-Mr.Lu on 14-4-2.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "ClassifyViewController.h"
#import "JSONKit.h"
#import "ClassifyCell.h"
#import "ClassifyIndexViewController.h"


@interface ClassifyViewController ()

@end

@implementation ClassifyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSMutableArray * datas = [[NSMutableArray alloc]init];
        self.datas = datas;
        [self loadingData];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(SYSTEM_VERSION_MORE_THAN(7))
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.title = @"商品类目";
    
    PullingRefreshTableView * classifyList = [[PullingRefreshTableView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight) pullingDelegate:self];
    classifyList.delegate = self;
    classifyList.dataSource = self;
    [self.view addSubview:classifyList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadingData
{
    NSURL * url = [NSURL URLWithString:@""];
    ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
}





#pragma mark -
#pragma mark - tableViewDelegate dataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
    return self.datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClassifyCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil)
    {
        cell = [[ClassifyCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    cell.className.text = @"服装内衣";
    cell.detailedInfo.text = @"女士上衣 女士裤装 女士内衣...";
    cell.icon.image = [UIImage imageNamed:@"nav_classify_pic@2x"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ClassifyIndexViewController * indexViewController = [[ClassifyIndexViewController alloc] init];
    [self.navigationController pushViewController:indexViewController animated:NO];
}



#pragma mark -
#pragma mark - ASIHTTPRequestDelegate

-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSData * responseData = [request responseData];
    JSONDecoder * jd = [[JSONDecoder alloc] init];
    NSDictionary * ret = [jd objectWithData:responseData];
    if(self.datas)
    {
        self.datas = nil;
    }
    self.datas = [ret objectForKey:@""];
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"error");
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
