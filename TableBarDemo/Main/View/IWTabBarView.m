//
//  IWTabBarView.m
//  IWeBo
//
//  Created by Administrator on 16/2/25.
//  Copyright © 2016年 Administrator. All rights reserved.
//

#import "IWTabBarView.h"
#import "IWTabBarButton.h"
@interface IWTabBarView()

@property (nonatomic, strong) IWTabBarButton * selectedButton;

@end

@implementation IWTabBarView

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        if(!IOS7)
        {
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Tab Bar-bg@2x"]];
        }
    }
    return self;
}

-(void)initWithTabBarItem:(UITabBarItem *)tabBarItem{
    //创建按钮
    IWTabBarButton * button = [[IWTabBarButton alloc]init];
    [self addSubview:button];
    
    //设置数据
    button.item = tabBarItem;
    
    //创建监听事件
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
    
    //选中默认Item0
    if(self.subviews.count == 1)
    {
        button.tag = 0;
        [self buttonClicked:button];
    }
}
/**
 *  监听事件
 */
-(void)buttonClicked:(IWTabBarButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(IWTabBarViewTo:)]) {
        [self.delegate IWTabBarViewTo:sender.tag];
    }
    
    self.selectedButton.selected = NO;
    sender.selected = YES;
    self.selectedButton = sender;
    if (sender.tag == 0) {
        NSNotification *notification =[NSNotification notificationWithName:@"tongzhi" object:nil userInfo:nil];
        //通过通知中心发送通知
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat ItemH = self.frame.size.height;
    CGFloat ItemW = self.frame.size.width/self.subviews.count;
    CGFloat ItemY = 0;
    
    for (int index = 0; index < self.subviews.count; index++) {
        IWTabBarButton * button = self.subviews[index];
        button.tag = index;
        CGFloat ItemX = index * ItemW;
        button.frame = CGRectMake(ItemX, ItemY, ItemW, ItemH);
    }
}


@end
