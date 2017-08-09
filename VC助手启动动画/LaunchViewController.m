//
//  LaunchViewController.m
//  VC助手启动动画
//
//  Created by WangXueqi on 17/8/3.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "LaunchViewController.h"
#import "LaunchImageView.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    LaunchImageView * lunch = [[LaunchImageView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:lunch];
    
    //执行后主要队列延迟
    double delayInSeconds = 2;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        if (_launchBlock) {
            _launchBlock();
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
