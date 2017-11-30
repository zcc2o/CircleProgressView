//
//  ZCCCircleProgressView.m
//  MOSOBOStudent
//
//  Created by mac on 2017/10/23.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCCircleProgressView.h"
#import "UIView+EXTENSION.h"

@interface ZCCCircleProgressView()

@property (nonatomic, strong)UILabel *bottomLabel;

@property (nonatomic, strong)CAGradientLayer *gradientLayer;
//进度圆环
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation ZCCCircleProgressView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)addCircleWithColor:(UIColor *)color{
    
    //圆路径
//    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.width / 2, self.height / 2) radius:(self.width - 20)/2 startAngle:M_PI / 4 + M_PI / 2 endAngle:M_PI / 4 clockwise:YES];
    
    
//    NSLog(@"center:%@", NSStringFromCGPoint(self.center));
    
//    NSLog(@"bounds:%@",NSStringFromCGPoint(self.bounds.origin));
    
    //先画一个背景环
    
    
    CAShapeLayer *bgLayer = [CAShapeLayer layer];
    bgLayer.frame = self.bounds;
//    bgLayer.position = self.center;
    bgLayer.fillColor = [UIColor clearColor].CGColor;//填充色 -  透明色
    bgLayer.lineWidth = 20.f;
    bgLayer.strokeColor = ZCCRGBColor(212, 212, 212, 1.0).CGColor;//线条颜色
    bgLayer.strokeStart = 0;
    bgLayer.strokeEnd = 1;
    bgLayer.lineCap = kCALineCapRound;
    bgLayer.path = circlePath.CGPath;
    [self.layer addSublayer:bgLayer];
    
    
    //一个红色进度
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.frame = self.bounds;
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer.lineWidth = 20.f;
    _shapeLayer.lineCap = kCALineCapRound;
//    _shapeLayer.strokeColor = color.CGColor;
    _shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    _shapeLayer.strokeStart = 0;
    _shapeLayer.strokeEnd = 0;
    _shapeLayer.path = circlePath.CGPath;
    [self.layer addSublayer:_shapeLayer];
    
    //gradientLayer 上左边从下到上放一个渐变色 右边 从上到下放一个就按变色  最上面为中间值   中间颜色 和 起始颜色 还有结束颜色都从创建的时候传过来
    //这里黄色  255 255 0 到 红色 255  0  0  所以中间色是  255 255/2 0
    
    self.gradientLayer = [CAGradientLayer layer];
    
    //左边的渐变图层
    CAGradientLayer *leftGradientLayer = [CAGradientLayer layer];
    leftGradientLayer.frame = CGRectMake(0, 0, self.width / 2, self.height);
    [leftGradientLayer setColors:[NSArray arrayWithObjects:(id)ZCCRGBColor(255, 255, 0, 1).CGColor, (id)ZCCRGBColor(255, 255.0/2, 0, 1).CGColor, nil]];
    [leftGradientLayer setLocations:@[@0,@0.9]];
    [leftGradientLayer setStartPoint:CGPointMake(0, 1)];
    [leftGradientLayer setEndPoint:CGPointMake(1, 0)];
    [_gradientLayer addSublayer:leftGradientLayer];


    CAGradientLayer *rightGradientLayer = [CAGradientLayer layer];
    rightGradientLayer.frame = CGRectMake(self.width / 2, 0, self.width / 2, self.height);
    [rightGradientLayer setColors:[NSArray arrayWithObjects:(id)ZCCRGBColor(255, 255.0 / 2, 0, 1.0).CGColor, (id)ZCCRGBColor(255, 0, 0, 1.0).CGColor, nil]];
    [rightGradientLayer setLocations:@[@0.1, @1]];
    [rightGradientLayer setStartPoint:CGPointMake(0.5, 0)];
    [rightGradientLayer setEndPoint:CGPointMake(0.5, 1)];
    [_gradientLayer addSublayer:rightGradientLayer];
     
    [self.gradientLayer setMask:_shapeLayer];
    
    self.gradientLayer.frame = self.bounds;
    //渐变图层映射到进度条路径上面
    
    [self.layer addSublayer:self.gradientLayer];
    
}


- (void)addLabelWithStr:(NSString *)str{
    
    self.bottomLabel.text = str;
}

- (UILabel *)bottomLabel{
    
    if(_bottomLabel == nil){
        //半径
        CGFloat width = self.width / 2;
        
        _bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.width - width * 1.414) / 2, width / 1.414 + width, width * 1.414, 20)];
        
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
        
        _bottomLabel.font = ZCCFontPingFangSCLight(14);
        
        _bottomLabel.textColor = DefaultColor68Gray;
        
        [self addSubview:_bottomLabel];
        
    }
    return _bottomLabel;
}

- (void)animateToProgress:(CGFloat)progress{
    
//    NSLog(@"增加到progress%lf", progress);
    
    if(_shapeLayer.strokeEnd != 0){
        [self animateToZero];
    }
    
    __weak typeof(self)weakSelf = self;
    
    NSLog(@"-----%lf",_shapeLayer.strokeEnd);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_shapeLayer.strokeEnd * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
        [weakSelf deleteTimer];
        
        NSString *progressStr = [NSString stringWithFormat:@"%lf",progress];
        
        NSDictionary *userInfo = @{@"progressStr":progressStr};
        
        weakSelf.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:weakSelf selector:@selector(animate:) userInfo:userInfo repeats:YES];
    });
    
}

- (void)animate:(NSTimer *)time{
    
    CGFloat progress = [[time.userInfo objectForKey:@"progressStr"]  floatValue];
    
    if(_shapeLayer.strokeEnd <= progress)
    {
        _shapeLayer.strokeEnd += 0.01;
    }else{
        [self deleteTimer];
    }
}
//回滚到0  先判断 timer 有没有存在 存在 就把timer 删除
- (void)animateToZero{
    
//    NSLog(@"删除到0");
    
    [self deleteTimer];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(animateReset) userInfo:nil repeats:YES];
}

- (void)animateReset{
    
    if(_shapeLayer.strokeEnd > 0){
        _shapeLayer.strokeEnd -= 0.01;
    }else{
        [self deleteTimer];
    }
    
}

- (void)deleteTimer{
    [self.timer invalidate];
    self.timer = nil;
}


@end
