//
//  MenuModel.h
//  MenuHeader
//
//  Created by wangxiaolei on 2018/12/18.
//  Copyright © 2018年 wxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef enum : NSUInteger {
    ImageTypeNone,          //无图标
    ImageTypeList,          //下拉列表
    ImageTypeUpAndDown,     //上下图标
    ImageTypeChoose ,       //筛选
} ButtonImageType;


@interface MenuModel : NSObject
//0- 默认  1- 选中（上）  2- 选中（下） 3- 上 默认
@property (nonatomic,strong) NSString *state;
//分类列表
@property (nonatomic,strong) NSArray *listData;
//图标类型
@property (nonatomic,assign) ButtonImageType imageType;
//分类名称
@property (nonatomic,strong) NSString *title;
//默认颜色
@property (nonatomic,strong) UIColor *defaultColor;
//选中颜色
@property (nonatomic,strong) UIColor *selectedColor;
//字体大小
@property (nonatomic,assign) NSInteger fontSize;
//下标
@property (nonatomic,assign) NSInteger index;
//当前选中下标
@property (nonatomic,assign) NSInteger selectedIndex;

- (NSString *)imageNameWithState:(NSString *)state imageType:(ButtonImageType)imageType;
- (UIColor *)colorWithState:(NSString *)state;

@end

NS_ASSUME_NONNULL_END
