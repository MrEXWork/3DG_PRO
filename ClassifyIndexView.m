//
//  ClassifyIndexView.m
//  PRJ_3DG
//
//  Created by linxg on 14-4-6.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "ClassifyIndexView.h"

@implementation ClassifyIndexView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       
    }
    return self;
}


-(void)creatButtons
{
    for(int i=0;i<self.titles.count;i++)
    {
        int x = 0;
        int y = 5+(lineSpace + lableHeight)*i;
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, self.frame.size.width, lableHeight)];
        [button setTitle:[self.titles objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = AppFont(13);
        button.tag = 100+i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}
-(void)buttonAction:(UIButton *)sender
{
    for(int i=0;i<self.titles.count;i++)
    {
        UIButton * button = (UIButton *)[self viewWithTag:(100+i)];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    if([self.delegate respondsToSelector:@selector(indexButtonAction:)])
    {
        [self.delegate indexButtonAction:sender.tag];
    }
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
