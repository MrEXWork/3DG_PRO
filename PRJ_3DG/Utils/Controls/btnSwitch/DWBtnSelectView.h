//  DWBtnSelectView.h
//  tianxian
//
//  Created by Lin NN on 13-7-29.
//  Copyright (c) 2013年 NNN. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HeadSwitchBtn 44

typedef void(^BtnSelectBlock) (NSInteger selectIndex);

@interface DWBtnSelectView : UIView
{
    NSArray * _btnArr;
    
    float   _btnLength;
    BtnSelectBlock _clickBlock;
}
@property (retain, nonatomic) UIView * selcetBGV;
@property (retain, nonatomic) UIView * btnsBGV;     //背景色
@property (assign, nonatomic) float scale_x;    //x的缩放倍数
@property (assign, nonatomic) float scale_y;    //y的缩放倍数

@property (assign, nonatomic) NSUInteger index;    //

@property (assign, nonatomic) NSInteger selectIndex;

@property (assign, nonatomic) float duration;


- (void)btnNameDataWithArr:(NSArray *)nameArr andClickAction:(BtnSelectBlock)clickBlock;

- (void)btnSelectOrigionAtIndex:(NSInteger)index;
-(void) reloadData;

- (UIButton *)getBtnIndex:(NSInteger)index;

@end
