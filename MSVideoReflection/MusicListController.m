//
//  MusicListController.m
//  YouCupS
//
//  Created by mr.scorpion on 15/8/26.
//  Copyright (c) 2015年 mr.scorpion. All rights reserved.
//  歌曲列表

#import "MusicListController.h"
#import <MediaPlayer/MediaPlayer.h>

#define FOOT_VIEW @"footView"

@interface MusicListController ()
<
UITableViewDataSource,
UITableViewDelegate,
MPMediaPickerControllerDelegate
>
@property(nonatomic,strong)  UITableView *listTable;
@end

@implementation MusicListController
- (UITableView *)listTable
{
    if (!_listTable) {
        _listTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width,self.view.bounds.size.height) style:UITableViewStylePlain];
        _listTable.delegate = self;
        _listTable.dataSource = self;
        _listTable.tableFooterView = [[UIView alloc] init];
        _listTable.backgroundColor = [UIColor clearColor];
        _listTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listTable.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [_listTable registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:FOOT_VIEW];
    }
    return _listTable;
}

// 获取ipods所有音乐
- (NSArray *)ipodMusic
{
    MPMediaQuery *queue = [[MPMediaQuery alloc]init];
    MPMediaPropertyPredicate *albumNamePredicate = [MPMediaPropertyPredicate predicateWithValue:@(MPMediaTypeMusic) forProperty:MPMediaItemPropertyMediaType];
    [queue addFilterPredicate:albumNamePredicate];
    return queue.items;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"音乐列表";
    //    self.parentTitle = kLCT(@"Music List");
    self.view.backgroundColor = [UIColor redColor];
    // 获取ipods所有音乐
    self.data = [self ipodMusic];
    [self.view addSubview:self.listTable];
}
- (void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - UITabelViewDelegate, UITabelViewDataSource //数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"MusicCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10, 49, tableView.bounds.size.width-10, 0.6)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [cell addSubview:lineView];
    }
    MPMediaItem *item = self.data[indexPath.row];
//    cell.imageView.image = IMG(@"icon_music");
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.albumArtist;
    cell.textLabel.textColor = [UIColor colorWithRed:114.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1.0];
    //cell.imageView.image = [UIImage imageWithContentsOfFile:item.albumArtist];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect headRect = CGRectMake(0, 0, tableView.bounds.size.width, 23);
    UIView *header = [[UIView alloc]initWithFrame:headRect];
    header.backgroundColor = [UIColor whiteColor];
    return header;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController popViewControllerAnimated:YES];
}


//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UITableViewHeaderFooterView *footView = [tableView dequeueReusableCellWithIdentifier:FOOT_VIEW];
//    CGFloat height  = [self tableView:tableView heightForFooterInSection:section];
//    CGRect footerRect = CGRectMake(0, 0, tableView.bounds.size.width, 67);
//    UIView *footer = [[UIView alloc]initWithFrame:footerRect];
////    UIButton *addbtn = [ UIButton buttonWithType:UIButtonTypeCustom];
////    [addbtn setFrame:CGRectMake(tableView.bounds.size.width/2-24, (height-48)/2.0, 48, 48)];
////    [addbtn setTitle:@"音乐" forState:UIControlStateNormal];
////    //[addbtn setCenter:footer.center];
////    //[addbtn setImage:[UIImage imageNamed:@"mode_add_def"] forState:UIControlStateNormal];
////    //[addbtn setImage:[UIImage imageNamed:@"mode_add_pre"] forState:UIControlStateHighlighted];
////    [addbtn addTarget:self action:@selector(addMusic:) forControlEvents:UIControlEventTouchUpInside];
////    [footer addSubview:addbtn];
//    footer.backgroundColor = [UIColor clearColor];
//    return footer;
//}
////增加音乐
//-(void)addMusic:(UIButton *)sender{
//    MPMediaPickerController *pickerController = [[MPMediaPickerController alloc]init];
//    pickerController.delegate = self;
//    //pickerController.allowsPickingMultipleItems = YES;
//    [self presentViewController:pickerController animated:YES completion:nil];
//}
//#pragma mark ------meadeaPicker delegate
//- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection{
//    //MPContentItem
//     NSArray *array = mediaItemCollection.items;
//        for (MPMediaItem *media in mediaItemCollection.items) {
//            NSLog(@"-----%@",media.assetURL);
//        }
////    MPMediaItem *item = mediaItemCollection.items[0];
////    player = [[AVAudioPlayer alloc]initWithContentsOfURL:item.assetURL  error:nil];
////    [player prepareToPlay];
////    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
//    //NSLog(@"------%@",mediaItemCollection);
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
