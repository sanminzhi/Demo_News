//
//  NewsModel.m
//  Lianxi_News
//
//  Created by 万治民 on 16/3/27.
//  Copyright © 2016年 cn.sanminzhi. All rights reserved.
//

#import "NewsModel.h"
#import "NetworkTools.h"

@implementation NewsModel
+(instancetype)newsModelWithDict:(NSDictionary *)dict{
    NewsModel *news = [[NewsModel alloc]init];
    //字典转模型
    [news setValuesForKeysWithDictionary:dict];
    
    return news;
}

//-(NSString *)description{
//
//}
//重写方法，不super这样当遍历到没有的属性时就不会蹦
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

+(void)loadNewsListWithURLString:(NSString *)urlString finished:(void (^)(NSArray *))finished{
    NSAssert(finished != nil, @"必须传入完成回调");
  [[NetworkTools sharedNetworkTools] GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
      
  } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      NSDictionary *dict = responseObject;
      NSArray *array = dict[dict.keyEnumerator.nextObject];
      //遍历数组，字典转模型
      NSMutableArray *tempArray = [NSMutableArray array];
      for (NSDictionary *dict in array) {
         NewsModel *model = [NewsModel newsModelWithDict:dict];
          [tempArray addObject:model];
      }
      finished(tempArray.copy);
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
      NSLog(@"失败了");
      NSLog(@"%@",error);
  }];
    


}
@end
