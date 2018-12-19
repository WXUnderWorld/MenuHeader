//
//  DrawerView.m
//  MenuHeader
//
//  Created by wangxiaolei on 2018/12/18.
//  Copyright © 2018年 wxl. All rights reserved.
//

#import "DrawerView.h"
#import "RightView.h"
@interface DrawerView ()<UIGestureRecognizerDelegate,RightViewDelegate>

@property (nonatomic,strong) RightView *rightView;
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UIButton *confirmBtn;
@property (nonatomic,strong) UIButton *resetBtn;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,assign) BOOL isNewData;

@end

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define Spacing  50
#define TouchTag 9999
#define Duration 0.4

@implementation DrawerView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.8];
        self.alpha = 0;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideRightView)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
    }
    return self;
}



- (void)showRightView
{
    [self removeFromSuperview];
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self];
    [window addSubview:self.rightView];
    [UIView animateWithDuration:Duration animations:^{
        self.alpha = 1;
        CGRect frame = self.rightView.frame;
        frame.origin.x = Spacing;
        self.rightView.frame = frame;
    }];
}

- (void)hideRightView
{
    [UIView animateWithDuration:Duration animations:^{
        self.alpha = 0;
        CGRect frame = self.rightView.frame;
        frame.origin.x = ScreenWidth;
        self.rightView.frame = frame;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.rightView removeFromSuperview];
    }];
    
    //发送数据
    if (_isNewData) {
        if ([self.delegate respondsToSelector:@selector(sendChooseDataArray:)]) {
            [self.delegate sendChooseDataArray:self.dataArray];
        }
    }
    _isNewData = NO;
}


#pragma mark ---- RightViewDelegate
//点击确定
- (void)confirmWithDataArray:(NSArray *)array
{
    //保存筛选的条件数据
    _isNewData = YES;
    self.dataArray = [NSMutableArray arrayWithArray:array];
    [self hideRightView];
}
//点击重置
- (void)resetWithDataArray:(NSArray *)array
{
    //保存筛选的条件数据
    _isNewData = YES;
    self.dataArray = [NSMutableArray arrayWithArray:array];
}



- (RightView *)rightView
{
    if (!_rightView) {
        _rightView = [[RightView alloc] initWithFrame:CGRectMake(ScreenWidth, 0,ScreenWidth-Spacing , ScreenHeight)];
        _rightView.backgroundColor = [UIColor whiteColor];
        _rightView.tag = TouchTag;
        _rightView.delegate = self;
    }
    return _rightView;
}

//设置手势
- (void)setSupportPan:(BOOL)supportPan
{
    _supportPan = supportPan;
    if (_supportPan) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self.rightView addGestureRecognizer:pan];
    }
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    UIView *panView = pan.view;
    CGPoint moviePoint = [pan translationInView:panView];
    if (pan.state == UIGestureRecognizerStateChanged) {
        CGRect frame = panView.frame;
        frame.origin.x = frame.origin.x + moviePoint.x;
        if (frame.origin.x < Spacing) {
            frame.origin.x = Spacing;
        }
        panView.frame = frame;
        [pan setTranslation:CGPointZero inView:panView];
    }
    
    //最大拖动距离
    CGFloat dis = ScreenWidth - Spacing;
    CGFloat scale = (panView.frame.origin.x - Spacing)/dis;
    self.alpha = 1.0 - scale;
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (panView.frame.origin.x - Spacing > dis/2) {
            [self hideRightView];
        }else{
            [self showRightView];
        }
    }
    
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch  {
 
    if (touch.view.tag == TouchTag) {
        return NO;
    }
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]){
        return NO;
    }
    return  YES;
}




@end
