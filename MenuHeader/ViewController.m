//
//  ViewController.m
//  MenuHeader
//
//  Created by wangxiaolei on 2018/12/18.
//  Copyright © 2018年 wxl. All rights reserved.
//

#import "ViewController.h"
#import "MenuHeaderView.h"

@interface ViewController ()<MenuHeaderViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MenuHeaderView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    MenuHeaderView *headerView = [[MenuHeaderView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 44)];
    headerView.drawerCanPan = YES;
    headerView.delegate = self;
    [self.view addSubview:headerView];
    
}

- (NSArray<MenuModel *> *)dataSourceOfView:(MenuHeaderView *)headerView
{
    NSMutableArray *list = [NSMutableArray array];
    NSArray *arr = @[@"综合",@"价格",@"销量",@"筛选"];
    for (int i=0; i<arr.count; i++) {
        MenuModel *model = [[MenuModel alloc] init];
        model.title = arr[i];
        model.index = i;
        if (i==0 ) {
            model.imageType = ImageTypeList;
            model.listData = @[@"综合排序",@"距离排序",@"新品优先",@"评价数量"];
        }
        if (i==1) {
            model.imageType = ImageTypeUpAndDown;
        }
        if (i==2) {
            model.imageType = ImageTypeNone;
        }
        if (i==3) {
            model.imageType = ImageTypeChoose;
        }
        [list addObject:model];
    }
    
    return list;
}

- (void)didSelectedIndexPath:(GXIndexPath *)indexPath imageType:(ButtonImageType)imageType forView:(nonnull MenuHeaderView *)headerView
{
    NSArray *list = [self dataSourceOfView:headerView];
    MenuModel *model = list[indexPath.column];
    if (model.imageType == ImageTypeList) {
        NSLog(@"当前点击的是== %@ ,%@",model.title,model.listData[indexPath.row]);
    }else if (model.imageType == ImageTypeUpAndDown) {
        NSLog(@"当前点击的是== %@ ,%@",model.title,indexPath.row == 0 ? @"上" : @"下");
    }else{
        NSLog(@"当前点击的是== %@",model.title);
    }
   
}

- (void)didChooseCompletionWithData:(NSArray *)array
{
    NSLog(@"筛选条件= %@",array);
}








@end
