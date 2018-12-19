//
//  ButtonItem.h
//  MJRefreshExample
//
//  Created by wangxiaolei on 2018/12/13.
//  Copyright © 2018年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuModel.h"


NS_ASSUME_NONNULL_BEGIN



@interface MenuButton : UIButton

@property (nonatomic,strong) NSString *title;
@property (nonatomic,assign) NSInteger titleFont;
@property (nonatomic,strong) UIColor *titleColor;
@property (nonatomic,strong) MenuModel *model;

@end

NS_ASSUME_NONNULL_END
