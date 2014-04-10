//
//  ClassifyCell.m
//  PRJ_3DG
//
//  Created by linxg on 14-4-6.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "ClassifyCell.h"

@implementation ClassifyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self creatChildrenView];
    }
    return self;
}

-(void)creatChildrenView
{
    UIImageView * iconView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 70, 70)];
    [iconView setBackgroundColor:[UIColor blackColor]];
    [iconView.layer setMasksToBounds:YES];
    [iconView.layer setCornerRadius:5.0];
    self.icon = iconView;
    [self.contentView addSubview:iconView];
    
    UILabel * classNameLab = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, kDeviceWidth - 85, 20)];
    [classNameLab setBackgroundColor:[UIColor clearColor]];
    [classNameLab setTextColor:[UIColor blackColor]];
    classNameLab.textAlignment = NSTextAlignmentLeft;
    classNameLab.font = AppBoldFont(15);
    self.className = classNameLab;
    [self.contentView addSubview:classNameLab];
    
    UILabel * detailInfoLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 50, kDeviceWidth - 85, 15)];
    [detailInfoLab setBackgroundColor:[UIColor clearColor]];
    [detailInfoLab setTextColor:[UIColor blackColor]];
    detailInfoLab.textAlignment = NSTextAlignmentLeft;
    detailInfoLab.font = AppFont(13);
    self.detailedInfo = detailInfoLab;
    [self.contentView addSubview:detailInfoLab];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
