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
    
    UILabel * storeNameLab = [[UILabel alloc] ]
    
    
    
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
