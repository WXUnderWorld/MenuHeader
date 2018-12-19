//
//  DrawerView.h
//  MenuHeader
//
//  Created by wangxiaolei on 2018/12/18.
//  Copyright © 2018年 wxl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DrawerDelegate <NSObject>

- (void)sendChooseDataArray:(NSArray *)array;

@end

@interface DrawerView : UIView

@property (nonatomic,weak) id <DrawerDelegate> delegate;
//是否支持手势 默认NO
@property (nonatomic,assign) BOOL supportPan;
- (void)showRightView;

@end

NS_ASSUME_NONNULL_END
