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
    [NewsModel loadNewsListWithURLString:@"T1348647853363/0-20.html" finished:^(NSArray *newList) {
        weakSelf.newsList = newList;
    }];
    NSLog(@"%@",self.newsList);
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
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DefaultCell"];
    if (cell == nil) {
        //注册cell
      cell = [[NewsCell alloc]initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"DefaultCell"];
    }

    cell.model = self.newsList[indexPath.row];
    NSLog(@"%@",cell);
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
