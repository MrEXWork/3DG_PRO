//
//  Response.m
//  Temp_Pro
//
//  Created by MacPro-Mr.Lu on 14-3-26.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "Response.h"

@implementation Response

-(id)initWithDictional:(NSDictionary *)dic
{
    kEnumRequestState flag = kEnumRequestStateSuccess;
    NSObject *reslut = nil;
    NSString *msg = @"";
    if ([dic valueForKey:@"flag"]) {
        int f = [[dic valueForKey:@"flag"]intValue];
        switch (f) {
            case 0:
                flag = kEnumRequestStateFailure;
                break;
            case 1:
                flag = kEnumRequestStateSuccess;
            default:
                break;
        }
    }
    
    reslut = [dic objectForKey:@"reslut"];
    msg = [dic valueForKey:@"msg"];

    return [self initWithFlag:flag result:reslut msg:msg];
}

-(id)initWithFlag:(kEnumRequestState)flag result:(NSObject *)result msg:(NSString *)msg
{
    self = [super init];
    if (self) {
        _flag = flag;
        _result = result;
        _msg = msg;
    }
    return self;
}

@end
