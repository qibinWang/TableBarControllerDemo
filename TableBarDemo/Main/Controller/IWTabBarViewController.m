//
//  IWTabBarViewController.m
//  IWiBo
//
//  Created by Administrator on 16/2/25.
//  Copyright © 2016年 Administrator. All rights reserved.
//
//#import "CXMessageTableViewController.h"
#import "IWTabBarViewController.h"
//#import "HomeViewController.h"
//#import "SettingViewController.h"
//#import "UIImage+IWJudgeCurrentDevice.h"
#import "IWTabBarView.h"
//#import "HomeSettingViewController.h"
#import "IWNavigationController.h"
//#import "DynamicViewController.h"
//#import "SearchTableViewController.h"
@interface IWTabBarViewController ()<IWTabBarViewDalegate>

@property(nonatomic,strong) IWTabBarView * customTabBar;
@end

@implementation IWTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //将自定义的UIView添加到原先的tabBar上
    [self setupTabBarView];
    
    //创建子控制器
    [self setupAllViewController];
  
}

-(void)setupTabBarView
{
    IWTabBarView * customTabBar = [[IWTabBarView alloc]init];
    
    customTabBar.delegate = self;
    
    customTabBar.frame = self.tabBar.bounds;
    
    [self.tabBar addSubview:customTabBar];
    
    self.customTabBar = customTabBar;
}

-(void)IWTabBarViewTo:(long)to
{
    self.selectedIndex = to;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView * child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
    
//    self.customTabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithNamed:@"tabbar_background"]];
}

/**
 *  创建所有子控制器
 */
-(void)setupAllViewController
{
    //1.首页
    UITableViewController * homeVc = [[UITableViewController alloc]init];
    [self initWithChildViewController:homeVc andTitle:@"动态" andImage:@"Tab-Bar-兴趣圈-未激活" andSelectedImage:@"Tab-Bar-兴趣圈-激活"];
    //2.探索
    UITableViewController * searchVc = [[UITableViewController alloc]init];
    [self initWithChildViewController:searchVc andTitle:@"探索" andImage:@"Tab-Bar-探索-未激活" andSelectedImage:@"Tab-Bar-探索-激活"];
    
    //3.消息
    UITableViewController * discoverVc = [[UITableViewController alloc]init];
    [self initWithChildViewController:discoverVc andTitle:@"消息" andImage:@"Tab-Bar-消息-未激活" andSelectedImage:@"Tab-Bar-消息-激活"];
    
    //4.我
    UITableViewController * meVc = [[UITableViewController alloc]init];
    [self initWithChildViewController:meVc andTitle:@"我" andImage:@"Tab-Bar-我-未激活" andSelectedImage:@"Tab-Bar-我-激活"];
}


/**
 *  初始化一个子控制器
 *
 *  @param Vc            子控制器名称
 *  @param title         标题
 *  @param image         未选中的图标
 *  @param selectedImage 选中的图标
 */
-(void)initWithChildViewController:(UIViewController *)Vc andTitle:(NSString *)title andImage:(NSString *)image andSelectedImage:(NSString *)selectedImage
{
    Vc.title = title;    
    
    if (IOS7) {
        Vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    else{
        Vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
//
    Vc.tabBarItem.image = [UIImage imageNamed:image];
    
    //包装一个导航控制器
    IWNavigationController * VcNav = [[IWNavigationController alloc]initWithRootViewController:Vc];
    [self addChildViewController:VcNav];
    
    //向自定义的UIView中传输数据
    [self.customTabBar initWithTabBarItem:Vc.tabBarItem];
}

@end
