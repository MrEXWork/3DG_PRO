//
//  ClassifyIndexViewController.h
//  PRJ_3DG
//
//  Created by linxg on 14-4-6.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "BaseViewController.h"
#import "ClassifyIndexView.h"

@interface ClassifyIndexViewController : BaseViewController<ClassifyIndexButtonAction,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSMutableArray * ClassTitles;
@property (strong, nonatomic) NSMutableArray * contentDatas;

@end
