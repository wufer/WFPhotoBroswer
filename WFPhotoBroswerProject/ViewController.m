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
    self.view.backgroundColor = [UIColor blackColor];
    
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    subView.center = self.view.center;
    [self.view addSubview:subView];
    subView.backgroundColor = [UIColor yellowColor];
    
    WFProgressLayer *progressLayer = [[WFProgressLayer alloc]initWithFrame:subView.bounds];
     progressLayer.position = CGPointMake(subView.frame.size.width/2,subView.frame.size.height/2);
    [subView.layer addSublayer:progressLayer];
    [progressLayer showProgress];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
