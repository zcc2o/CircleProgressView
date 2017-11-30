//
//  ViewController.m
//  ZCCCircleProgressViewProject
//
//  Created by mac on 2017/11/29.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ViewController.h"
#import "ZCCCircleProgressView.h"

@interface ViewController ()

@property (nonatomic, weak)ZCCCircleProgressView *circleProgress;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //git@github.com:zcc2o/CircleProgressView.git
    
    [self addViews];
    
}

- (void)addViews{
    
    ZCCCircleProgressView *circleProgress = [[ZCCCircleProgressView alloc] initWithFrame:CGRectMake(50, 100, SCREENWIDTH - 100, SCREENWIDTH - 100)];
    
    self.circleProgress = circleProgress;
    
    [self.view addSubview:circleProgress];
    
    [circleProgress addCircleWithColor:[UIColor purpleColor]];
    
//    
    [circleProgress animateToProgress:0.8];
    
    UIButton *startAnimatebtn = [[UIButton alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(circleProgress.frame) + 50, 100, 30)];
    [startAnimatebtn setTitle:@"开始动画" forState:UIControlStateNormal];
    [startAnimatebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    startAnimatebtn.layer.borderWidth = 1;
    startAnimatebtn.layer.borderColor = [UIColor blueColor].CGColor;
    [startAnimatebtn addTarget:self action:@selector(startAnimated) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startAnimatebtn];
    
    UIButton *turnToZeroBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREENWIDTH - 50 - 100, CGRectGetMaxY(circleProgress.frame) + 50, 100, 30)];
    [turnToZeroBtn setTitle:@"归零" forState:UIControlStateNormal];
    [turnToZeroBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    turnToZeroBtn.layer.borderWidth = 1;
    turnToZeroBtn.layer.borderColor = [UIColor blueColor].CGColor;
    [turnToZeroBtn addTarget:self action:@selector(turnToZero) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:turnToZeroBtn];
    
}

- (void)startAnimated{
    [self.circleProgress animateToProgress:0.8];
    
//    - (void)addLabelWithStr:(NSString *)str;
    [self.circleProgress addLabelWithStr:@"完成80%"];
    
}

- (void)turnToZero{
    [self.circleProgress animateToZero];
    [self.circleProgress addLabelWithStr:@"回退到0%"];
}


@end
