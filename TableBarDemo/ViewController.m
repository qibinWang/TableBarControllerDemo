//
//  ViewController.m
//  TableBarDemo
//
//  Created by wangqibin on 2017/6/4.
//  Copyright © 2017年 wangqibin. All rights reserved.
//

#import "ViewController.h"
#import "IWTabBarViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, 50, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchDown];
    [btn setTitle:@"点击跳转主页" forState:UIControlStateNormal];
    [self.view addSubview:btn];
 }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 }

-(void)clickBtn{
 
    IWTabBarViewController *controller = [[IWTabBarViewController alloc]init];
    [self presentViewController:controller animated:YES completion:^{
        
    }];
}

@end
