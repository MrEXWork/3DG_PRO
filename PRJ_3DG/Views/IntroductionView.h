//
//  IntroductionView.h
//  PRJ_3DG
//
//  Created by linxg on 14-4-9.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroductionView : UIView
@property (strong, nonatomic) UIButton * pic;
@property (strong, nonatomic) UILabel * content;
@property (strong, nonatomic) UIButton * zan;
@property (strong, nonatomic) UIButton * share;
@property (strong, nonatomic) UILabel * originalPrice;
@property (strong, nonatomic) UILabel * discount;
@property (strong, nonatomic) UILabel * address;
@property (strong, nonatomic) UILabel * courier;
@property (strong, nonatomic) UILabel * totalSales;
@property (strong, nonatomic) UIImageView * icon;
@property (strong, nonatomic) UILabel * storeName;
@property (strong, nonatomic) NSArray * stars;
@property (strong, nonatomic) UILabel * circle_praiseRate;
@property (strong, nonatomic) UILabel * circle_sales;
@property (strong, nonatomic) UILabel * numb;

@end
