//
//  RightView.m
//  MenuHeader
//
//  Created by wangxiaolei on 2018/12/18.
//  Copyright © 2018年 wxl. All rights reserved.
//

#import "RightView.h"

@interface RightView ()

@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UIButton *confirmBtn;
@property (nonatomic,strong) UIButton *resetBtn;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation RightView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self createSubViews];
    }
    return self;
}


- (void)createSubViews
{
    [self addSubview:self.bottomView];
    [self.bottomView addSubview:self.resetBtn];
    [self.bottomView addSubview:self.confirmBtn];
}


- (void)confirmButtonClicked:(UIButton *)btn
{
    [self.dataArray addObject:@"0"];
    if (self.delegate && [self.delegate respondsToSelector:@selector(confirmWithDataArray:)]) {
        [self.delegate confirmWithDataArray:self.dataArray];
    }
}

- (void)resetButtonClicked:(UIButton *)btn
{
    [self.dataArray removeAllObjects];
    if (self.delegate && [self.delegate respondsToSelector:@selector(resetWithDataArray:)]) {
        [self.delegate resetWithDataArray:self.dataArray];
    }
}



- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (UIButton *)resetBtn
{
    if (!_resetBtn) {
        _resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _resetBtn.frame = CGRectMake(0, 0, self.bounds.size.width/2, self.bottomView.bounds.size.height);
        _resetBtn.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_resetBtn setTitle:@"重置" forState:UIControlStateNormal];
        [_resetBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _resetBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_resetBtn addTarget:self action:@selector(resetButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _resetBtn;
}

- (UIButton *)confirmBtn
{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmBtn.frame = CGRectMake(self.bounds.size.width/2, 0, self.bounds.size.width/2, self.bottomView.bounds.size.height);
        _confirmBtn.backgroundColor = [UIColor orangeColor];
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_confirmBtn addTarget:self action:@selector(confirmButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}

- (UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 44, self.bounds.size.width, 44)];
    }
    return _bottomView;
}

@end
