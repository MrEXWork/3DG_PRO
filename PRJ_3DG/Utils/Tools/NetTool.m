//
//  NetTool.m
//  Temp_Pro
//
//  Created by MacPro-Mr.Lu on 14-3-27.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "NetTool.h"
#import "AppDelegate.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"
#import "JSONKit.h"
#import "Reachability.h"
#import "SVProgressHUD.h"

@implementation NetTool


+ (BOOL)netWorkIsUseful
{
    return [ASIHTTPRequest isNetworkInUse];
}

+ (void)checkNetworkChange
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addNetworkCheack:) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeNetworkCheack:) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

+ (void)addNetworkCheack:(NSNotification *)notification
{
    // 监测网络状态变化监控
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    [AppDelegate shareDelegate].reachability = [Reachability reachabilityForInternetConnection];
	// 监测网络状态变化监控启动
	[[AppDelegate shareDelegate].reachability startNotifier];
}

+ (void)removeNetworkCheack:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark -- 回调网络状态方法
+ (void)reachabilityChanged:(id)sender
{
	// 检测网络是否存在
	Reachability	*r = [Reachability reachabilityForInternetConnection];
    
	switch ([r currentReachabilityStatus]) {
		case NotReachable:
        {
            [SVProgressHUD showErrorWithStatus:@"网络断开"];
            break;
        }
            
		case ReachableViaWWAN:
        {
            [SVProgressHUD showSuccessWithStatus:@"3G网络开启"];
            break;
        }
            
		case ReachableViaWiFi:
        {
            [SVProgressHUD showSuccessWithStatus:@"wifi网络开启"];
            break;
        }
	}
}

+ (void)handleAsiHttpNetworkError:(NSError *)error
{
    [SVProgressHUD showErrorWithStatus:error.description];
}


+ (void)httpGetRequest:(NSString *)url WithSuccess:(void (^)(Response *))success failure:(void (^)(NSError *))failure
{
    NSURL *rurl = [NSURL URLWithString:url];
    __unsafe_unretained __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:rurl];
    [request setCachePolicy:ASIAskServerIfModifiedCachePolicy|ASIFallbackToCacheIfLoadFailsCachePolicy];
    [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    [request setDownloadCache:[ASIDownloadCache sharedCache]];
    [request setRequestMethod:@"GET"];
    [request setCompletionBlock:^{
        NSString *responseString = [request responseString];
        NSDictionary *jsonDic = [responseString objectFromJSONString];
        Response *response = [[Response alloc]initWithDictional:jsonDic];
        success(response);
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        failure(error);
        [request clearDelegatesAndCancel];
    }];
    [request startAsynchronous];
}

+ (void)httpPostRequest:(NSString *)url WithFormdata:(NSMutableDictionary *)formdata WithSuccess:(void (^)(Response *))success failure:(void (^)(NSError *))failure
{
    NSURL *rurl = [NSURL URLWithString:url];
    __unsafe_unretained __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:rurl];
    for (NSString *key in [formdata allKeys])
    {
        [request setPostValue:[formdata valueForKey:key] forKey:key];
    }
    [request setRequestMethod:@"POST"];
    [request setCompletionBlock:^{
        NSString *responseString = [request responseString];
        NSDictionary *jsonDic = [responseString objectFromJSONString];
        Response *response = [[Response alloc]initWithDictional:jsonDic];
        success(response);
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        failure(error);
        [request clearDelegatesAndCancel];
    }];
    [request startAsynchronous];
}

+ (void)httpPostFileDataRequest:(NSString *)url WithFileFormdata:(NSMutableDictionary *)data withFormdaya:(NSMutableDictionary *)formData WithSuccess:(int (^)(Response *))success failure:(void (^)(NSError *))failure
{
    NSURL *rurl = [NSURL URLWithString:url];
    
    __unsafe_unretained __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:rurl];
    
    NSString *type = [data valueForKey:@"formate"];
    NSString *key = [data valueForKey:@"key"];
    NSArray *fileData = (NSArray *)[data objectForKey:@"data"];
    NSString *name = [data valueForKey:@"name"];
    
    for (int i = 0 ; i < [fileData count]; i++) {
        NSData *pdata = (NSData *)[fileData objectAtIndex:i];
        [request addData:pdata withFileName:name andContentType:type forKey:key];
    }
    
    for (NSString *key in [formData allKeys])
    {
        [request setPostValue:[formData valueForKey:key] forKey:key];
    }
    
    [request setRequestMethod:@"POST"];
    [request setCompletionBlock:^{
        NSString *responseString = [request responseString];
        NSDictionary *jsonDic = [responseString objectFromJSONString];
        Response *response = [[Response alloc]initWithDictional:jsonDic];
        success(response);
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        failure(error);
        [request clearDelegatesAndCancel];
    }];
    [request startAsynchronous];

}

+ (void)httpPostFileAddrRequest:(NSString *)url WithFileFormdata:(NSMutableDictionary *)data withFormdaya:(NSMutableDictionary *)formData WithSuccess:(int (^)(Response *))success failure:(void (^)(NSError *))failure
{
    NSURL *rurl = [NSURL URLWithString:url];
    
    __unsafe_unretained __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:rurl];
    
    NSString *type = [data valueForKey:@"formate"];
    NSString *key = [data valueForKey:@"key"];
    NSArray *fileData = (NSArray *)[data objectForKey:@"data"];
    NSString *name = [data valueForKey:@"name"];
    
    for (int i = 0 ; i < [fileData count]; i++) {
        NSString *pdata = (NSString *)[fileData objectAtIndex:i];
        [request addFile:pdata withFileName:name andContentType:type forKey:key];
    }
    
    for (NSString *key in [formData allKeys])
    {
        [request setPostValue:[formData valueForKey:key] forKey:key];
    }
    
    [request setRequestMethod:@"POST"];
    [request setCompletionBlock:^{
        NSString *responseString = [request responseString];
        NSDictionary *jsonDic = [responseString objectFromJSONString];
        Response *response = [[Response alloc]initWithDictional:jsonDic];
        success(response);
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        failure(error);
        [request clearDelegatesAndCancel];
    }];
    [request startAsynchronous];
    
}


@end
