//
//  NetworkTools.h
//  Lianxi_News
//
//  Created by 万治民 on 16/3/28.
//  Copyright © 2016年 cn.sanminzhi. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NetworkTools : AFHTTPSessionManager
//全局访问入口
+(instancetype)sharedNetworkTools;
@end
