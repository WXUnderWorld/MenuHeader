//
//  RightView.h
//  MenuHeader
//
//  Created by wangxiaolei on 2018/12/18.
//  Copyright © 2018年 wxl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RightViewDelegate <NSObject>

- (void)confirmWithDataArray:(NSArray *)array;
- (void)resetWithDataArray:(NSArray *)array;

@end

@interface RightView : UIView

@property (nonatomic,weak) id <RightViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
