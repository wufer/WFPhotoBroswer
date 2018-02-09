//
//  ViewController.m
//  WFPhotoBroswerProject
//
//  Created by PRD_01 on 2018/2/5.
//  Copyright © 2018年 PRD_01. All rights reserved.
//

#import "ViewController.h"
#import "WFProgressLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WFProgressLayer *progressLayer = [[WFProgressLayer alloc]init];
    progressLayer.strokeColor = [UIColor blackColor].CGColor;
    progressLayer.fillColor = [UIColor cyanColor].CGColor;
    progressLayer.lineWidth = 8;
    progressLayer.strokeStart = 0;
    progressLayer.strokeEnd = .75;
    [self.view.layer addSublayer:progressLayer];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)];
    progressLayer.path = path.CGPath;
    [path moveToPoint:CGPointMake(100, 200)];
   
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 10.0f;
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.repeatCount = 100;
    [progressLayer addAnimation:animation forKey:@"strokeEndAnimation"];
    
    
    
   
    // Do any additional setup after loading the view, typically from a nib.
}

-(UIBezierPath *)startPoint:(CGPoint)start endPoint:(CGPoint)end controlPoint:(CGPoint)control{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:start];
    [path addQuadCurveToPoint:end controlPoint:control];
    return path;
}

-(WFProgressLayer *)createShapeLayer:(UIColor *)color{
    WFProgressLayer *layer = [WFProgressLayer layer];
    [self.view.layer addSublayer:layer];
    return layer;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
