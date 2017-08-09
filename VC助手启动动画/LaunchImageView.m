//
//  LaunchImageView.m
//  VC助手启动动画
//
//  Created by WangXueqi on 17/8/3.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "LaunchImageView.h"

//判断目前机型的宏定义
#define UI_IS_IPHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define IPHONE4      (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height < 568.0)
#define IPHONE5      (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define IPHONE6      (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
#define IPHONE6P     (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0 || [[UIScreen mainScreen] bounds].size.width == 736.0) // Both orientations

#define K_ScreenWidth   CGRectGetWidth([[UIScreen mainScreen] bounds])// 当前屏幕宽
#define K_ScreenHeight  CGRectGetHeight([[UIScreen mainScreen] bounds])// 当前屏幕高
#define k_labelHeight   150
@implementation LaunchImageView

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        [self loadLunchImage];
    }
    return self;
}

- (void)loadLunchImage {

    self.backGround = [[UIImageView alloc]initWithImage:[self getBackGroundImage]];
    [self addSubview:self.backGround];
    [self.backGround addSubview:self.label];
    
    [UIView animateWithDuration:2.0 animations:^{
        self.label.frame = CGRectMake(0, (K_ScreenHeight-k_labelHeight)/2, K_ScreenWidth, k_labelHeight);
    }];
}

- (UILabel *)label {

    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, (K_ScreenHeight-k_labelHeight)/2, 0, k_labelHeight)];
        _label.backgroundColor = [UIColor whiteColor];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

- (UIImage *)getBackGroundImage
{
    NSString *launchImageName = @"LaunchImage";
    if (IPHONE5)
    {
        launchImageName = @"LaunchImage-568h";
    }
    else if(IPHONE6)
    {
        launchImageName = @"LaunchImage-800-667h";
    }
    else if (IPHONE6P)
    {
        launchImageName = @"LaunchImage-800-Portrait-736h";
    }
    return [UIImage imageNamed:launchImageName];
}

@end
