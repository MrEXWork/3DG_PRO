//
//  NSString+utils.m
//  Btn_HQHD_2.0
//
//  Created by MacPro-Mr.Lu on 14-3-20.
//  Copyright (c) 2014年 XMGD_Mr.Lu. All rights reserved.
//

#import "NSString+utils.h"

@implementation NSString (utils)

+(NSString *)getStrByNil:(NSString *)str{
    if (str==nil||[str isKindOfClass:[NSNull class]]) {
        return @"";
    }
    return str;
}

@end
