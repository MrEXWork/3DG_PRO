//
//  ClassifyIndexView.h
//  PRJ_3DG
//
//  Created by linxg on 14-4-6.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import <UIKit/UIKit.h>
#define lineSpace 15
#define lableHeight 20

@protocol ClassifyIndexButtonAction <NSObject>

-(void)indexButtonAction:(int)tag;

@end

@interface ClassifyIndexView : UIView

@property (strong, nonatomic) NSArray * titles;
@property (weak, nonatomic) id<ClassifyIndexButtonAction>delegate;

-(void)creatButtons;

@end
