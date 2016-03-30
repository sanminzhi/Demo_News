//
//  NewsModel.h
//  Lianxi_News
//
//  Created by 万治民 on 16/3/27.
//  Copyright © 2016年 cn.sanminzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
//主标题
@property(nonatomic,copy) NSString* title;
//跟帖数
@property(nonatomic,assign)int replyCount;
//摘要
@property(nonatomic,copy) NSString* digest;
//图片链接
@property(nonatomic,copy) NSString* imgsrc;
//来源
@property(nonatomic,copy) NSString * source;
//多图模式的存储图片的数组（两张）
@property(nonatomic,strong)NSArray * imgextra;
//判断是否为大图
@property(nonatomic,assign,getter=isBigImage)BOOL imgType;
//字典转模型方法
+(instancetype)newsModelWithDict:(NSDictionary *)dict;
//加载指定网路数据方法
+(void)loadNewsListWithURLString:(NSString *)urlString finished:(void(^)(NSArray *newList))finished; 
@end
