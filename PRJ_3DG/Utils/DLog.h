//
//  DLog.h
//  Temp_Pro
//
//  Created by MacPro-Mr.Lu on 14-3-26.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG
#define DLog( s, ...) NSLog(@"<%@ :%d> %@",[[NSString stringWithUTF8String:__FILE__]lastPathComponent],__LINE__,[NSString stringWithFormat:(s),##__VA_ARGS__]);
#else
#define DLog(s,...)
#endif
