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

    self.title = @"商品类目";
    
    PullingRefreshTableView * classifyList = [[PullingRefreshTableView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-88) pullingDelegate:self];
    classifyList.delegate = self;
    classifyList.dataSource = self;
    [self.view addSubview:classifyList];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadingData
{
    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    [NetTool httpPostRequest:@"" WithFormdata:param WithSuccess:^(Response *response) {
//        @property (assign, nonatomic) kEnumRequestState flag;//200
//        @property (copy, nonatomic) NSString *result;//{"":"",} //""
//        @property (copy, nonatomic) NSString *msg;
//        JSONDecoder * jd = [[JSONDecoder alloc] init];
//        NSDictionary * ret = [jd objectWithData:responseData];
        if(self.datas)
        {
            self.datas = nil;
        }
//        self.datas = response.result;
  
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
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
    [self.navigationController pushViewController:indexViewController animated:YES];
}





@end
