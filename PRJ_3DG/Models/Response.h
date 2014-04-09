//
//  Response.h
//  Temp_Pro
//
//  Created by MacPro-Mr.Lu on 14-3-26.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum
{
    kEnumRequestStateSuccess = 200,
    kEnumRequestStateFailure = 404,
}kEnumRequestState;

@interface Response : NSObject

@property (assign, nonatomic) kEnumRequestState flag;//200
@property (copy, nonatomic) NSObject *result;//{"":"",} //""
@property (copy, nonatomic) NSString *msg;

- (id)initWithDictional:(NSDictionary *)dic;
- (id)initWithFlag:(kEnumRequestState)flag result:(NSObject *)result msg:(NSString *)msg;

@end
