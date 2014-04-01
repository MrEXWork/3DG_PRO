//
//  UIImage+CutImage.m
//  WPWProject
//
//  Created by Mr.Lu on 13-7-2.
//  Copyright (c) 2013年 Mr.Lu. All rights reserved.
//

#import "UIImage+CutImage.h"
//#import "UIImage+Compress.h"
@implementation UIImage (CutImage)

+ (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect
{
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    CGImageRelease(newImageRef);
    return newImage;
}

//捕获图片内容
+(UIImage *)captureContextToImage:(UIView *)view
{
    CGRect rect = view.frame;
    //开始图片内容
    UIGraphicsBeginImageContext(rect.size);
    //获取视图内容
    CGContextRef contecxt = UIGraphicsGetCurrentContext();
    //在层上渲染的内容
    [view.layer renderInContext:contecxt];
    //从内容中获取图片
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    //结束图片内容
    UIGraphicsEndImageContext();
    
//    UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);
    
    return img;
}

//剪切图片
-(UIImage *)cutImageWithRect:(CGRect)rect scale:(float)scale
{
    CGImageRef imageRef = self.CGImage;
    
    CGRect rectNew = CGRectMake(rect.origin.x, rect.origin.y,rect.size.width, rect.size.height);
    
    DLog(@"%f,%f,%f,%f",rectNew.origin.x,rectNew.origin.y,rectNew.size.width,rectNew.size.height);
    
    CGImageRef imageRefRect = CGImageCreateWithImageInRect(imageRef, rect);
    
    UIImage *imageRect = [[UIImage alloc] initWithCGImage:imageRefRect];
    
    return imageRect;
}


-(UIImage *)getImageFromImageWithRect:(CGRect)rect{
    
    CGImageRef subImageRef = self.CGImage;
    CGRect smallBounds = CGRectMake(0, CGImageGetHeight(subImageRef)/3, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef)/3);
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
//    smallImage = [smallImage imageByScalingAndCroppingForSize:CGSizeMake(320, 160)];
    return smallImage;
}


@end
