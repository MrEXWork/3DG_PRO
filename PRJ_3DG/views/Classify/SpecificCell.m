//
//  SpecificCell.m
//  PRJ_3DG
//
//  Created by linxg on 14-4-8.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "SpecificCell.h"

@implementation SpecificCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self creatViews];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)creatViews
{
    UIImageView * iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 50, 50)];
    self.icon = iconImageView;
    [self.contentView addSubview:iconImageView];
    
    UILabel * selledNumberLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 60, 50, 20)];
    selledNumberLab.backgroundColor = [UIColor clearColor];
    selledNumberLab.textAlignment = NSTextAlignmentLeft;
    selledNumberLab.font = AppFont(12);
    self.selledNumber = selledNumberLab;
    [self.contentView addSubview:selledNumberLab];
    
    UILabel * detailContentLab = [[UILabel alloc] initWithFrame:CGRectMake(65, 5, 255, 40)];
    detailContentLab.backgroundColor = [UIColor clearColor];
    detailContentLab.textAlignment = NSTextAlignmentLeft;
    detailContentLab.font = AppBoldFont(15);
    detailContentLab.numberOfLines = 0;
    self.detailContent = detailContentLab;
    [self.contentView addSubview:detailContentLab];
    
    UILabel * priceLab = [[UILabel alloc] initWithFrame:CGRectMake(65, 40, 250, 20)];
    priceLab.backgroundColor = [UIColor clearColor];
    priceLab.textAlignment = NSTextAlignmentLeft;
    priceLab.font = AppFont(12);
    self.price = priceLab;
    [self.contentView addSubview:priceLab];
    
    UILabel * otherLab = [[UILabel alloc] initWithFrame:CGRectMake(65, 60, 250, 20)];
    otherLab.backgroundColor = [UIColor clearColor];
    otherLab.textAlignment = NSTextAlignmentLeft;
    otherLab.font = AppFont(12);
    otherLab.text = @"[包邮][限时购]";
    [self.contentView addSubview:otherLab];
}

@end
