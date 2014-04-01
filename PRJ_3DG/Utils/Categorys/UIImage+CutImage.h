//
//  UIImage+CutImage.h
//  WPWProject
//
//  Created by Mr.Lu on 13-7-2.
//  Copyright (c) 2013年 Mr.Lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CutImage)

/**
 对图像进行裁剪
 */
+(UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect;

/**
 从视图中截取图片
 */
+(UIImage *)captureContextToImage:(UIView *)view;

/**
 对图像进行裁剪，并且压缩
 */
-(UIImage *)cutImageWithRect:(CGRect)rect scale:(float)scale;


-(UIImage *)getImageFromImageWithRect:(CGRect)rect;
@end
