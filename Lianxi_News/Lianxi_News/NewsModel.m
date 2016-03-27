//
//  NewsModel.m
//  Lianxi_News
//
//  Created by 万治民 on 16/3/27.
//  Copyright © 2016年 cn.sanminzhi. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel
+(instancetype)newsModelWithDict:(NSDictionary *)dict{
    NewsModel *news = [[NewsModel alloc]init];
    //字典转模型
    [news setValuesForKeysWithDictionary:dict];
    
    return news;
}
//重写方法，不super这样当遍历到没有的属性时就不会蹦
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
@end
