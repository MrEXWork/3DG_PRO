//
//  ListScrollView.h
//  PRJ_3DG
//
//  Created by linxg on 14-4-8.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ListScrollViewDelegate <NSObject>

-(void)listCellActionWithIndexPath:(int)indexPath;

@end

@interface ListScrollView : UIScrollView

@property (strong, nonatomic) NSMutableArray * titles;
@property (weak, nonatomic) id<ListScrollViewDelegate>listDelegate;

-(id)initWihtFrame:(CGRect)frame withTitles:(NSMutableArray *)titles;

@end
