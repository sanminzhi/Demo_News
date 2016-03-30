//
//  NewsCell.h
//  Lianxi_News
//
//  Created by 万治民 on 16/3/29.
//  Copyright © 2016年 cn.sanminzhi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsModel;
@interface NewsCell : UITableViewCell
@property(nonatomic,strong) NewsModel *model;

// 可重用标示符号
+ (NSString *)cellIdentifier:(NewsModel *)news;
@end
