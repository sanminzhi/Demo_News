//
//  NetworkTools.m
//  Lianxi_News
//
//  Created by 万治民 on 16/3/28.
//  Copyright © 2016年 cn.sanminzhi. All rights reserved.
//

#import "NetworkTools.h"
#import <AFNetworking.h>

@implementation NetworkTools
+(instancetype)sharedNetworkTools{
    static NetworkTools * instance;
    //创建单例
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/"];
        instance = [[self alloc]initWithBaseURL:url];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];

    });
    return instance;
}
@end
