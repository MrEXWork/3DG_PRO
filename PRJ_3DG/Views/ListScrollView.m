//
//  ListScrollView.m
//  PRJ_3DG
//
//  Created by linxg on 14-4-8.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "ListScrollView.h"
#define cellHeight 30
#define baseTag 10000

@implementation ListScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWihtFrame:(CGRect)frame withTitles:(NSMutableArray *)titles
{
    self = [super initWithFrame:frame];
    self.titles = titles;
    if(self)
    {
        for(int i=0;i<self.titles.count;i++)
        {
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(1, i*cellHeight, frame.size.width-2, cellHeight-1)];
            button.tag = baseTag +i;
            [button setBackgroundColor:[UIColor whiteColor]];
            [button setTitle:[self.titles objectAtIndex:i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(cellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
        }
        self.contentSize = CGSizeMake(frame.size.width, self.titles.count*cellHeight);
        [self setBackgroundColor:[UIColor grayColor]];
    }
    return self;
}

-(void)cellButtonAction:(UIButton *)sender
{
    if([self.listDelegate respondsToSelector:@selector(listCellActionWithIndexPath:)])
    {
        [self.listDelegate listCellActionWithIndexPath:sender.tag];
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
