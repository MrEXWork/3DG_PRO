//
//  ClassifyIndexViewController.m
//  PRJ_3DG
//
//  Created by linxg on 14-4-6.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "ClassifyIndexViewController.h"


@interface ClassifyIndexViewController ()

@end

@implementation ClassifyIndexViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSMutableArray * array = [[NSMutableArray alloc] initWithObjects:@"服装内衣",@"鞋服配饰",@"运动户外",@"珠宝手表", nil];
        self.ClassTitles = array;
        
        NSMutableArray * contents = [[NSMutableArray alloc]initWithObjects:@"全部",@"针织品",@"衬衫",@"连衣裙",@"套装/职业装/OL",@"短外套",@"雪纺衫",@"T恤",@"针织品",@"衬衫",@"连衣裙",@"套装/职业装/OL",@"短外套",@"雪纺衫",@"T恤",@"针织品",@"衬衫",@"连衣裙",@"套装/职业装/OL",@"短外套",@"雪纺衫", nil];
        self.contentDatas = contents;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self creatIndexList];
    
    UIImageView * arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(70, 5, 20, 20)];
    arrowImageView.image = [UIImage imageNamed:@""];
    [self.view addSubview:arrowImageView];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 15;
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
    
    UICollectionView *classifyList = [[UICollectionView alloc]initWithFrame:CGRectMake(90, 0, kDeviceWidth-100-5, kDeviceHeight) collectionViewLayout:layout];
    [classifyList setBackgroundColor:[UIColor grayColor]];
    classifyList.delegate = self;
    classifyList.dataSource = self;
    [classifyList registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    [self.view addSubview:classifyList];
    


}


-(void)creatIndexList
{
    ClassifyIndexView * indexList = [[ClassifyIndexView alloc]initWithFrame:CGRectMake(0, 0, 70, 300)];
    indexList.titles = self.ClassTitles;
    indexList.delegate = self;
    [indexList creatButtons];
    [self.view addSubview:indexList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark - ClassifyIndexButtonAction


-(void)indexButtonAction:(int)tag
{
    
}

#pragma mark -
#pragma mark -collectionView


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor blueColor]];
    cell.accessibilityLabel = [self.contentDatas objectAtIndex:indexPath.row];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.contentDatas.count;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize labsize = CGSizeZero;
    NSString * strString = [self.contentDatas objectAtIndex:indexPath.row];
    UIFont * font = AppFont(13);
    if (SYSTEM_VERSION_LESS_THAN(7.0)) {
        labsize = [strString sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, 30) lineBreakMode:NSLineBreakByWordWrapping];
    }
    else
    {
        labsize = [strString boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 20) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil].size;
    }
     NSLog(@"%f",labsize.width);
    if(labsize.width >40)
    {
        labsize.width = 95;
        labsize.height = 20;
    }
    else
    {
        labsize.width = 40;
        labsize.height = 20;
    }
    return labsize;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"#%d#",indexPath.row);
}



@end
