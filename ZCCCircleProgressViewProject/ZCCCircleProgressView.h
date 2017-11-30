//
//  ZCCCircleProgressView.h
//  MOSOBOStudent
//
//  Created by mac on 2017/10/23.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCCCommon.h"

@interface ZCCCircleProgressView : UIView

@property (nonatomic, strong)NSTimer *timer;

- (void)addCircleWithColor:(UIColor *)color;

- (void)deleteTimer;

- (void)addLabelWithStr:(NSString *)str;
//跳到进度
- (void)animateToProgress:(CGFloat)progress;
//进度为0
- (void)animateToZero;

@end
