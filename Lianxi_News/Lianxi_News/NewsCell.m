//
//  NewsCell.m
//  Lianxi_News
//
//  Created by 万治民 on 16/3/29.
//  Copyright © 2016年 cn.sanminzhi. All rights reserved.
//

#import "NewsCell.h"
#import "NewsModel.h"
// AFN 针对 UIImageView 的分类
#import <UIImageView+AFNetworking.h>

@interface NewsCell ()
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyLabel;

@end

@implementation NewsCell

//重写set方法
-(void)setModel:(NewsModel *)model{
    self.titleLabel.text = model.title;
    self.digestLabel.text = model.digest;
    self.replyLabel.text = [NSString stringWithFormat:@"%d跟帖",model.replyCount];
    
     // 设置图像 - AFN的图像分类不支持 GIF，绝大多数还是应该用 SDWebImage [self.iconView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    [self.pictureView setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    
    //这个方法只能获取本地路径的图片
//    self.pictureView.image = [UIImage imageNamed:model.imgsrc];
}

- (void)awakeFromNib {
    // xib加载的时候被调用
    //设置行宽度，摘要的文字比较多所以设置一些行宽
    self.digestLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - CGRectGetMaxX(self.pictureView.frame) - 16;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
