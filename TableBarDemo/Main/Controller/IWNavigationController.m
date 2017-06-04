//
//  IWNavigationController.m
//  IWeBo
//
//  Created by Administrator on 16/3/1.
//  Copyright © 2016年 Administrator. All rights reserved.
//

#import "IWNavigationController.h"

@interface IWNavigationController ()

@end

@implementation IWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//系统第一次调用这个类时调用，仅仅一次
+ (void)initialize
{
    //1.设置导航栏主题
    UINavigationBar * navBar = [UINavigationBar appearance];
    
    //设置导航栏返回时箭头的颜色
    //navBar.tintColor = [UIColor colorWithRed:82/255.0 green:159/255.0 blue:88/255.0 alpha:1];
    
        NSString * imageName = @"icon-返回";
        navBar.backIndicatorImage = [UIImage imageNamed:imageName];
    
    
    //
    //    //设置背景图片
    //    [navBar setBackgroundImage:[UIImage imageNamed:imageName] forBarMetrics:UIBarMetricsDefault];
    
    //设置字体样式
    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
    //在字典里放入字体颜色
    attrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:82/255.0 green:159/255.0 blue:88/255.0 alpha:1];
//    attrs[NSFontAttributeName] = IWPostTitleFont;
    [navBar setTitleTextAttributes:attrs];
    
    // 2.设置BarButtonItem的主题
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    // 设置文字颜色
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:111/255.0 green:224/255.0 blue:148/255.0 alpha:1];
//    itemAttrs[NSFontAttributeName] = IWPostTitleFont;
    [item setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
