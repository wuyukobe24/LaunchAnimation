//
//  LaunchViewController.h
//  VC助手启动动画
//
//  Created by WangXueqi on 17/8/3.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LaunchViewController : UIViewController
@property(nonatomic,copy)void(^launchBlock)();
@end
