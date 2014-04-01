//
//  ApiNetClient.h
//  Temp_Pro
//
//  Created by MacPro-Mr.Lu on 14-3-26.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Urls.h"
#import "Model.h"

@interface ApiNetClient : NSObject

/**
 
 @param ?param1= && param2=

 @returns <#retval#>
 @exception <#throws#>
 */
+ (void)httpGetRequest:(NSString *)url  WithSuccess:(void (^)(Response *response))success failure:(void (^)(NSError *error))failure;
/**
 
 {"key":"va", "key":val}
 @param  param1=2,
         param2=1
 @returns <#retval#>
 @exception <#throws#>
 */
+ (void)httpPOSTRequest:(NSString *)url WithFormdata:(NSMutableDictionary *)formdata WithSuccess:(void (^)(Response *response))success failure:(void (^)(NSError *error))failure;


+ (void)httpPOSTRequestFile:(NSString *)url WithFormdata:(NSMutableArray *)data WithSuccess:(void (^)(Response *response))success failure:(void (^)(NSError *error))failure;





@end
