//
//  WFProgressLayer.h
//  WFPhotoBroswerProject
//
//  Created by PRD_01 on 2018/2/5.
//  Copyright © 2018年 PRD_01. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

typedef  NS_ENUM(NSInteger,WFProgressStyle){
    WFProgressStyleNormal = 0,
    WFProgressStyleMessage = 1,
    WFProgressStyleProgress = 2
};

@interface WFProgressLayer : CAShapeLayer

/**
 加载框显示样式
 */
@property (nonatomic,assign) WFProgressStyle progressStyle;

/**
 加载提示信息
 */
@property (nonatomic,strong) NSString *message;

/**
 加载进度
 */
@property (nonatomic,assign) CGFloat progress;

-(instancetype)initWithFrame:(CGRect)frame;

//-(instancetype)initWithFrame:(CGRect)frame message:(NSString *)message;

-(void)showProgress;

-(void)hideProgress;

+(WFProgressLayer *)showInView:(UIView *)view;

//+(WFProgressLayer *)showMessageInView:(UIView *)view message:(NSString *)message;




@end
