//
//  Config.h
//  Temp_Pro
//
//  Created by MacPro-Mr.Lu on 14-3-26.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#ifndef Temp_Pro_Config_h
#define Temp_Pro_Config_h

#define KPayMode @"00"                          //00为生产 01为测试
#define kHarpyAppID @"691955620"                //苹果id需要修改  白眼
#define kUmenKey @"52ba407e56240b31b0079293"    //友盟key
#define kWeiXinKey @"wxae8a7e00bf0d67d2"        //微信账号
#define kSinaWeiboKey @""
//[ShareSDK connectSinaWeiboWithAppKey:@"1900248250" appSecret:@"170f942ae0b5c58fe4e4cff913ccce5c"
//                         redirectUri:@"http://58.23.9.219:8080/hdtv/weibo/bind/callback"];
#define kTaoBaoKey @""                          //淘宝账号
#define KFlurrykey @"KDFFKXQS3RWY6B6BQQS5"      //flurrykey
#define kBaiDuMapKey @"7D3280000E5C8BEEDBEF84A874E1ABFF68A7C31B" //百度地图key
#define kBaiDuWebAPIKey @"59e811598044836a49bc592b109e6f18" //百度网页api解析位置 key
#define kBaiDuIpAK @"D3a6bc4a5df4ef907521d7591386f0e9" //百度ip定位 暂时未使用

#define kServerHost  @"http://app.xmbtn.com:8080/" //@"http://58.23.9.220:8080/"   //服务器地址
#define kIPServerHost @"http://58.23.9.219:8080/"  //获取IP服务器地址
#define kDataBaseName @"HQHD_btn"                    //数据库名字
#define KPlistUser @"UserInfo"                       //存储用户数据 plist文件存储
#define BTN_HOST_IP   @"58.23.9.220"  //@"192.168.1.112"   //IP
#define BTN_HOST_PORT 6588            //8080            //post

#define kregistOutTimer 60                      //注册限时
#define kperpagePersonNum 30                    //载入个多时每页的数据量
#define kMaxUploadNum 8                         //做大上传数
#define USERID @"userid"                        //openfire 用户id
#define PASS @"pass"                            //openfire 登录密码
#define SERVER @"server"                        //登录服务器

#define DEVICE_NAME [[UIDevice currentDevice] name] //设备名字
#define APPLICATION_VERSION  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"                               //应用版本
#define SYSTEM_VERSION [[UIDevice currentDevice].systemVersion floatValue]                                                   //IOS版本
#define SYSTEM_VERSION_MORE_THAN(x) ([[UIDevice currentDevice].systemVersion floatValue] >= x) //IOS版本适配
#define SYSTEM_VERSION_LESS_THAN(x) ([[UIDevice currentDevice].systemVersion floatValue] < x) //IOS版本适配
#define SYSTEM_NAME  [NSString stringWithFormat:@"%@ %@ %@",[[UIDevice currentDevice] model],[[UIDevice currentDevice] systemName],[[UIDevice currentDevice] systemVersion]]             //系统名字  手机型号+系统+系统版本

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width      //界面宽度
#define kDeviceHeight ([UIScreen mainScreen].bounds.size.height - 20.0)//界面高度

#define kApp_source @"appStroe"                     //app 下载源
//        #define AppFont  @"Helvetica" //正常字体
#define AppFont(x) [UIFont systemFontOfSize:x] //正常字体 +size
//        #define AppBoldFont  @"Helvetica-Bold" //加粗字体
#define AppBoldFont(x) [UIFont systemFontOfSize:x] //加粗字体 +size
#define KpriceFont @"Hoefler Text Black-Bold"       //价格字体
#define kPhotoHoldOnImage [UIImage imageNamed:@""]  //占位图
#define kDefaultHeadPhoto @""


#endif
