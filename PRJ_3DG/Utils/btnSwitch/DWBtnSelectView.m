//
//  DWBtnSelectView.m
//  tianxian
//
//  Created by Lin NN on 13-7-29.
//  Copyright (c) 2013年 NNN. All rights reserved.
//

#import "DWBtnSelectView.h"

@implementation DWBtnSelectView


#define  HEIGHTBTN  CGRectGetHeight(self.frame)

#define TAG_SPLINE 98

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //_btnArr = [[NSArray alloc]init];
        self.scale_x = 1;
        self.scale_y = 1;
        
        self.duration = 0.3;
    }
    return self;
}


- (void)creatBtnsV
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
    UIView * bgv = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame)*self.scale_x, HEIGHTBTN*self.scale_y)];
    self.btnsBGV = bgv;
    bgv.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin;
    
    bgv.backgroundColor = [UIColor lightGrayColor];
    
    [self addSubview:bgv];

    
    _btnLength = CGRectGetWidth(self.frame)/[_btnArr count];
    
    for (int i = 1; i<[_btnArr count]; i++)
    {
        UIView * spLine = [[UIView alloc]init];
        spLine.backgroundColor = [UIColor whiteColor];
        
        spLine.frame = CGRectMake(_btnLength*i, 0, 1, CGRectGetHeight(self.frame));
        
        spLine.tag = TAG_SPLINE;
        
        spLine.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin;
        
        [self addSubview:spLine];
    }
    
    UIView * v = [[UIView alloc]initWithFrame:CGRectMake(_index * _btnLength, 0, _btnLength*self.scale_x, HEIGHTBTN*self.scale_y)];
    self.selcetBGV = v;
    self.selcetBGV.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin;
    
    self.selcetBGV.backgroundColor = [UIColor brownColor];
    
    [self.btnsBGV addSubview:self.selcetBGV];
    
    for (int i = 0; i<[_btnArr count]; i++)
    {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        btn.backgroundColor = [UIColor clearColor];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.tag = i+1;
        [btn setTitle:[_btnArr objectAtIndex:i] forState:UIControlStateNormal];
        
        btn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin;
        
        if(i == _index)
        {
            btn.selected = YES;
        }
        [self.btnsBGV addSubview:btn];
        [btn addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        if(i == [_btnArr count])
        {
            btn.frame = CGRectMake(_btnLength*i * self.scale_x, 0, CGRectGetWidth(self.frame) - _btnLength*i * self.scale_x, HEIGHTBTN*self.scale_y);
        }
        else
        {
            btn.frame = CGRectMake(_btnLength*i * self.scale_x, 0, _btnLength*self.scale_x, HEIGHTBTN*self.scale_y);
        }
    }
    
    self.selectIndex = 1;
}

- (UIButton *)getBtnIndex:(NSInteger)index
{
    for(UIButton * btn in self.btnsBGV.subviews)
    {
        if(btn.tag == index)
        {
            return btn;
        }
    }
    return nil;
}

#pragma mark 按钮事件
- (void)clickBtnAction:(UIButton *)sender
{
    for(UIView * v in self.btnsBGV.subviews)
    {
        if (v.tag > 0)
        {
            ((UIButton *)v).selected = NO;
        }
    }
    
    [UIView animateWithDuration:self.duration delay:0 options:UIViewAnimationOptionCurveEaseInOut| UIViewAnimationOptionCurveLinear animations:^{
        self.selcetBGV.frame = sender.frame;
    } completion:^(BOOL finished) {

        sender.selected = YES;
    }];
    
    if(self.selectIndex == sender.tag)
    {
        return;
    }
    
    self.selectIndex = sender.tag;
    
    if(_clickBlock)
    {
        _clickBlock(sender.tag);
    }
}

#pragma mark- 按钮的位置
- (void)btnSelectOrigionAtIndex:(NSInteger)index
{
    if(index == 0 || index > [_btnArr count])
    {
        return;
    }
    
    self.selectIndex = index;
    
    for(UIView * v in self.btnsBGV.subviews)
    {
        if (v.tag > 0)
        {
            ((UIButton *)v).selected = NO;
        }
    }
    UIButton * btn = (UIButton *)[self viewWithTag:index];
    btn.selected = YES;
    [UIView animateWithDuration:self.duration animations:^{
        self.selcetBGV.frame = btn.frame;
    }];
}

-(void)btnNameDataWithArr:(NSArray *)nameArr andClickAction:(BtnSelectBlock)clickBlock
{
    _clickBlock = clickBlock;
    _btnArr = [NSArray arrayWithArray:nameArr];
    [self creatBtnsV];
}

-(void) reloadData
{
    [self creatBtnsV];
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
