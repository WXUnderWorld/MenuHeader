//
//  MenuModel.m
//  MJRefreshExample
//
//  Created by wangxiaolei on 2018/12/14.
//  Copyright © 2018年 小码哥. All rights reserved.
//

#import "MenuModel.h"

@implementation MenuModel

- (instancetype)init
{
    if (self = [super init]) {
        _state = @"0";
        _defaultColor = [UIColor darkGrayColor];
        _selectedColor = [UIColor orangeColor];
        _fontSize = 14;
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    if ([title rangeOfString:@"综合"].length) {
         _title = @"综合";
    }
    if ([title rangeOfString:@"距离"].length) {
        _title = @"距离";
    }
    if ([title rangeOfString:@"新品"].length) {
        _title = @"新品";
    }
    if ([title rangeOfString:@"评价"].length) {
        _title = @"评价";
    }
    
}


- (NSString *)imageNameWithState:(NSString *)state imageType:(ButtonImageType)imageType
{
    NSString *imageName = @"";
    switch (imageType) {
        case ImageTypeList:
            if ([state isEqualToString:@"0"]) {
                imageName = @"xia_moren";
            }else if ([state isEqualToString:@"1"]){
                imageName = @"xia_xuanzhong";
            }else if ([state isEqualToString:@"2"]){
                imageName = @"shang_xuanzhong";
            }else if ([state isEqualToString:@"3"]){
                imageName = @"shang_moren"; //这种状态暂时没用
            }
            break;
        case ImageTypeUpAndDown:
            if ([state isEqualToString:@"0"]) {
                imageName = @"shangxia";
            }else if ([state isEqualToString:@"1"]){
                imageName = @"shang_xia_shang";
            }else{
                imageName = @"shang_xia_xia";
            }
            break;
        case ImageTypeChoose:
            if ([state isEqualToString:@"0"]) {
                imageName = @"shaixuan_moren";
            }else{
                imageName = @"shaixuan_xuanzhong";
            }
            break;
            
        default:
            break;
    }
    return imageName;
}


- (UIColor *)colorWithState:(NSString *)state
{
    UIColor *color = self.selectedColor;
    if ([state isEqualToString:@"0"] || [state isEqualToString:@"3"]) {
        color = self.defaultColor;
    }
    return color;
}


@end
