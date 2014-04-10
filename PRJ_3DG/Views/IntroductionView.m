//
//  IntroductionView.m
//  PRJ_3DG
//
//  Created by linxg on 14-4-9.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "IntroductionView.h"

@implementation IntroductionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)creatView
{
    UIButton * picButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, kDeviceWidth-20, kDeviceWidth -20)];
    [picButton addTarget:self action:@selector(picAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:picButton];
    self.pic = picButton;
    
    UILabel * contentLab = [[UILabel alloc] initWithFrame:CGRectMake(0, kDeviceWidth -20+5, 230, 40)];
    contentLab.backgroundColor = [UIColor clearColor];
    contentLab.numberOfLines = 0;
    contentLab.font = AppBoldFont(17);
    contentLab.textAlignment = NSTextAlignmentLeft;
    self.content = contentLab;
    [self addSubview:contentLab];
    
    UIButton * zanBut = [[UIButton alloc] initWithFrame:CGRectMake(240, kDeviceWidth -20+5+5, 30, 30)];
    self.zan = zanBut;
    [zanBut addTarget:self action:@selector(zanAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:zanBut];
    
    UIButton * shareBut = [[UIButton alloc] initWithFrame:CGRectMake(280, kDeviceWidth-20+5+5, 30, 30)];
    self.share = shareBut;
    [shareBut addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:shareBut];
    
    UILabel * originalPriceLab = [[UILabel alloc] initWithFrame:CGRectMake(0, kDeviceWidth-20+5+5+40+10, 40, 20)];
    originalPriceLab.backgroundColor = [UIColor clearColor];
    originalPriceLab.textAlignment = NSTextAlignmentLeft;
    originalPriceLab.font = AppFont(13);
    [originalPriceLab setTextColor:[UIColor grayColor]];
    self.originalPrice = originalPriceLab;
    [self addSubview:originalPriceLab];
    
    //划线
    UIImageView * line = [[UIImageView alloc] initWithFrame:CGRectMake(0, kDeviceWidth-20+5+5+40+10, 40, 20)];
    line.image = [UIImage imageNamed:@""];
    [self addSubview:line];
    
    UILabel * discountLab = [[UILabel alloc] initWithFrame:CGRectMake(0, kDeviceWidth-20+5+5+40+5, 60, 25)];
    discountLab.backgroundColor = [UIColor clearColor];
    discountLab.textAlignment = NSTextAlignmentLeft;
    discountLab.font = AppBoldFont(17);
    [discountLab setTextColor:[UIColor blackColor]];
    self.discount = discountLab;
    [self addSubview:discountLab];
    
    UILabel * addressLab = [[UILabel alloc] initWithFrame:CGRectMake(0, kDeviceWidth-20+5+5+40+5+5+25, 100, 20)];
    addressLab.backgroundColor = [UIColor clearColor];
    addressLab.textAlignment = NSTextAlignmentLeft;
    addressLab.textColor = [UIColor blackColor];
    addressLab.font = AppFont(15);
    self.address = addressLab;
    [self addSubview:addressLab];
    
    UILabel * courierLab = [[UILabel alloc] initWithFrame:CGRectMake(100, kDeviceWidth-20+5+5+40+5+5+25, 150, 20)];
    courierLab.backgroundColor = [UIColor clearColor];
    courierLab.textAlignment = NSTextAlignmentLeft;
    courierLab.textColor = [UIColor blackColor];
    courierLab.font = AppFont(15);
    self.courier = courierLab;
    [self addSubview:courierLab];
    
    UILabel * totalSalesLab = [[UILabel alloc] initWithFrame:CGRectMake(kDeviceWidth-100, kDeviceWidth-20+5+5+40+5+5+25, 100, 20)];
    totalSalesLab.backgroundColor = [UIColor clearColor];
    totalSalesLab.textAlignment = NSTextAlignmentLeft;
    totalSalesLab.textColor = [UIColor blackColor];
    totalSalesLab.font = AppFont(15);
    self.totalSales = totalSalesLab;
    [self addSubview:totalSalesLab];
    
    UIImageView * iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, kDeviceWidth-20+5+5+40+5+5+25+10+30, 25, 25)];
    self.icon = iconImageView;
    [self addSubview:iconImageView];
    
    ///
    UILabel * storeNameLab = [[UILabel alloc] initWithFrame:CGRectMake(35, kDeviceWidth-20+5+5+40+5+5+25+10+30, 100, 25)];
    storeNameLab.backgroundColor = [UIColor clearColor];
    storeNameLab.textAlignment = NSTextAlignmentLeft;
    storeNameLab.font = AppFont(15);
    storeNameLab.textColor = [UIColor blackColor];
    self.storeName = storeNameLab;
    [self addSubview:storeNameLab];
    
    //arrow
    UIImageView * arrow = [[UIImageView alloc] initWithFrame:CGRectMake(kDeviceWidth-35, kDeviceWidth-20+5+5+40+5+5+25+10+30, 25, 25)];
    arrow.image = [UIImage imageNamed:@"u68_normal.png"];
    [self addSubview:arrow];
    
    UIImageView * longline = [[UIImageView alloc] initWithFrame:CGRectMake(5, kDeviceWidth-20+5+5+40+5+5+25+10+30+25+2, kDeviceWidth-10, 2)];
    longline.image = [UIImage imageNamed:@"u65_line.png"];
    [self addSubview:longline];
    
    UILabel * c_praiseRate = [[UILabel alloc] initWithFrame:CGRectMake(20, kDeviceWidth-20+5+5+40+5+5+25+10+30+25+2+2+3, 27, 27)];
    [c_praiseRate setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"u93_normal"]]];
    c_praiseRate.textAlignment = NSTextAlignmentCenter;
    c_praiseRate.font = AppFont(13);
    self.circle_praiseRate = c_praiseRate;
    [self addSubview:c_praiseRate];
    
    UILabel * praise = [[UILabel alloc] initWithFrame:CGRectMake(20, kDeviceWidth-20+5+5+40+5+5+25+10+30+25+2+2+3+27+3, 27, 20)];
    [praise setBackgroundColor:[UIColor clearColor]];
    praise.textAlignment = NSTextAlignmentCenter;
    praise.textColor = [UIColor blackColor];
    praise.font = AppFont(13);
    [self addSubview:praise];
    
    UILabel * c_sales = [[UILabel alloc] initWithFrame:CGRectMake(20+100+27, kDeviceWidth-20+5+5+40+5+5+25+10+30+25+2+2+3, 27, 27)];
    c_sales.text = @"好评率";
    [c_sales setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"u93_normal"]]];
    c_sales.textAlignment = NSTextAlignmentCenter;
    c_sales.font = AppFont(13);
    self.circle_sales = c_sales;
    [self addSubview:c_sales];
    
    UILabel * sales = [[UILabel alloc] initWithFrame:CGRectMake(20+100+27, kDeviceWidth-20+5+5+40+5+5+25+10+30+25+2+2+3+27+3, 27, 20)];
    sales.text = @"总销量";
    [sales setBackgroundColor:[UIColor clearColor]];
    sales.textAlignment = NSTextAlignmentCenter;
    sales.textColor = [UIColor blackColor];
    sales.font = AppFont(13);
    [self addSubview:sales];
    
    UILabel * c_numb = [[UILabel alloc] initWithFrame:CGRectMake(20+100+27+100+27, kDeviceWidth-20+5+5+40+5+5+25+10+30+25+2+2+3, 27, 27)];
    [c_numb setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"u93_normal"]]];
    c_numb.textAlignment = NSTextAlignmentCenter;
    c_numb.font = AppFont(13);
    self.circle_numb = c_numb;
    [self addSubview:c_numb];
    
    UILabel * numb = [[UILabel alloc] initWithFrame:CGRectMake(20+100+27+100+27, kDeviceWidth-20+5+5+40+5+5+25+10+30+25+2+2+3+27+3, 27, 20)];
    numb.text = @"商品数";
    [numb setBackgroundColor:[UIColor clearColor]];
    numb.textAlignment = NSTextAlignmentCenter;
    numb.textColor = [UIColor blackColor];
    numb.font = AppFont(13);
    [self addSubview:numb];
    
    UIButton * gotoDetail = [[UIButton alloc] initWithFrame:CGRectMake(0, kDeviceWidth-20+5+5+40+5+5+25+5+30, kDeviceWidth, 80)];
    [gotoDetail setBackgroundImage:[UIImage imageNamed:@"u95_normal.png"] forState:UIControlStateNormal];
    [gotoDetail addTarget:self action:@selector(detailAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:gotoDetail];
    
    UIButton * buy = [[UIButton alloc] initWithFrame:CGRectMake(0, kDeviceWidth-20+5+5+40+5+5+25+5+30+80+5, 150, 30)];
    [buy addTarget:self action:@selector(buyAction:) forControlEvents:UIControlEventTouchUpInside];
    [buy setBackgroundColor:[UIColor grayColor]];
    [buy setTitle:@"立即购买" forState:UIControlStateNormal];
    buy.titleLabel.font = AppBoldFont(20);
    [self addSubview:buy];
    
    UIButton * car = [[UIButton alloc] initWithFrame:CGRectMake(170, kDeviceWidth-20+5+5+40+5+5+25+5+30+80+5, 150, 30)];
    [car addTarget:self action:@selector(carAction:) forControlEvents:UIControlEventTouchUpInside];
    [car setBackgroundColor:[UIColor grayColor]];
    [car setTitle:@"加入购物车" forState:UIControlStateNormal];
    car.titleLabel.font = AppBoldFont(20);
    [self addSubview:car];
    
    
    
    
    
}

-(void)picAction:(UIButton *)sender
{

}

-(void)zanAction:(UIButton *)sender
{

}

-(void)shareAction:(UIButton *)sender
{

}

-(void)detailAction:(UIButton *)sender
{

}

-(void)buyAction:(UIButton *)sender
{

}

-(void)carAction:(UIButton *)sender
{

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
