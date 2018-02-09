//
//  WFProgressLayer.m
//  WFPhotoBroswerProject
//
//  Created by PRD_01 on 2018/2/5.
//  Copyright © 2018年 PRD_01. All rights reserved.
//

#import "WFProgressLayer.h"

@interface WFProgressLayer ()

@property (nonatomic,assign) BOOL isSpinning;

@end

@implementation WFProgressLayer


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super init];
    if (self) {
        self.frame = frame;
        [self configLayer];
    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame message:(NSString *)message{
    self = [super init];
    if (self) {
        self.frame = frame;
        self.message = message;
        [self configLayerWithMessage];
    }
    return self;
}


+(WFProgressLayer *)showInView:(UIView *)view{
    WFProgressLayer *layer = [[WFProgressLayer alloc] initWithFrame:view.bounds];
    [view.layer addSublayer:layer];
    return layer;
}


+(WFProgressLayer *)showMessageInView:(UIView *)view message:(NSString *)message{
    WFProgressLayer *layer = [[WFProgressLayer alloc] initWithFrame:view.bounds message:message];
    layer.progressStyle = WFProgressStyleMessage;
    [view.layer addSublayer:layer];
    return layer;
}


-(void)configLayer{
    self.cornerRadius = self.frame.size.width/2.0f;
    self.lineWidth = 4;
    self.strokeStart = 0;
    self.strokeEnd = 0.01;
    /**
     kCALineCapButt   该属性值指定不绘制端点， 线条结尾处直接结束。这是默认值。
     kCALineCapRound  该属性值指定绘制圆形端点， 线条结尾处绘制一个直径为线条宽度的半圆
     kCALineCapSquare  该属性值指定绘制方形端点。线条结尾处绘制半个边长为线条宽度的正方形。需要说明的是，这种形状的端点与“butt”形状的端点十分相似，只是采用这种形式的端点的线条略长一点而已
     */
    self.lineCap = kCALineCapRound;//端点形状
    self.fillColor = [UIColor clearColor].CGColor;// 填充路径颜色
    self.strokeColor = [UIColor whiteColor].CGColor;// 描边色
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    //创建路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(self.bounds, 2, 2) cornerRadius:20-2];
    self.path = path.CGPath;
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
}


-(void)configLayerWithMessage{
    
}


-(void)showProgress{
    self.isSpinning = YES;
    [self spinWithAngle:M_PI];
}


-(void)hideProgress{
    self.isSpinning = NO;
    [self removeAllAnimations];
}


-(void)setProgress:(CGFloat)progress{
    
}


- (void)spinWithAngle:(CGFloat)angle {
    self.strokeEnd = 0.33;
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(M_PI-0.5);
    rotationAnimation.duration = 10;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE;
    [self addAnimation:rotationAnimation forKey:nil];
}


- (void)applicationDidBecomeActive:(NSNotification *)notification {
    if (self.isSpinning) {
        [self showProgress];
    }
}


-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
