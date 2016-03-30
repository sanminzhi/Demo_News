//
//  NewsTableViewController.m
//  Lianxi_News
//
//  Created by 万治民 on 16/3/27.
//  Copyright © 2016年 cn.sanminzhi. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsModel.h"
#import "NewsCell.h"
//#import <AFNetworking.h>

@interface NewsTableViewController ()
@property(nonatomic,strong)NSArray * newsList;
@end

@implementation NewsTableViewController

-(void)setNewsList:(NSArray *)newsList{
    _newsList = newsList;
    //刷新表格
    [self.tableView reloadData];
    [self addObserver:self forKeyPath:@"highlighted" options:0 context:nil]; 
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *urlString = @"T1348647853363/0-20.html";
    __weak typeof(self) weakSelf = self;
    [NewsModel loadNewsListWithURLString:@"T1348647853363/0-40.html" finished:^(NSArray *newList) {
        weakSelf.newsList = newList;
    }];
    
  //自动计算行高
    self.tableView.estimatedRowHeight = 90;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsModel *n = self.newsList[indexPath.row];
     NSString *ID = [NewsCell cellIdentifier:n];
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    cell.model = n;

    return cell;
}



@end
