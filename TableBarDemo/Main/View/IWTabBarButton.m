//
//  IWTabBarButton.m
//  IWeBo
//
//  Created by Administrator on 16/2/25.
//  Copyright © 2016年 Administrator. All rights reserved.
//
#define IWTabBarButtonTitleColor (IOS7? [UIColor blackColor]:[UIColor whiteColor])
#define IWTabBarButtonTitleSelectedColor IWColor(21, 199, 67)
#define IWTabBarButtonRatio 0.65
#import "IWTabBarButton.h"
#import "IWBadgeButton.h"

@interface IWTabBarButton()

@property (nonatomic, weak)IWBadgeButton * badgeButton;

@end

@implementation IWTabBarButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        if(!IOS7)
        {
            [self setBackgroundImage:[UIImage imageNamed:@"tabbar_slider"] forState:UIControlStateSelected];
        }
        //设置图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        //设置文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //设置字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        //设置字体颜色（选中和未选中状态下）
        [self setTitleColor:IWTabBarButtonTitleSelectedColor forState:UIControlStateSelected];
//        [self setTitleColor:IWTabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

        //添加提醒数字按钮
        IWBadgeButton * badgeButton = [[IWBadgeButton alloc]init];     
        //因为一开始初始化按钮没有frame，在将来有frame值后，设置左边和底部相关联
        badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:badgeButton];
        self.badgeButton = badgeButton;
    }
    return self;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = self.frame.size.height * IWTabBarButtonRatio;
    CGFloat titleH = self.frame.size.height - self.frame.size.height * IWTabBarButtonRatio;
    CGFloat titleW = self.frame.size.width;
    
    return CGRectMake(0, titleY, titleW, titleH);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageH = self.frame.size.height * IWTabBarButtonRatio;
    CGFloat imageW = self.frame.size.width;
    
    return CGRectMake(0, 0, imageW, imageH);
}

-(void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    //KVO 监听属性改变
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

-(void)delloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

/**
 *  监听到某个对象的属性改变了，就会调用
 *
 *  @param keyPath 属性名
 *  @param object  哪个对象的属性被改变
 *  @param change  属性发生的改变
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    //设置提醒数字
    self.badgeButton.badgeValue = self.item.badgeValue;
    
    //设置提醒数字的位置
    CGFloat badgeY = 5;
    CGFloat badgeX = self.frame.size.width - self.badgeButton.frame.size.width -18;
    CGRect badgeFrame = self.badgeButton.frame;
    badgeFrame.origin.x = badgeX;
    badgeFrame.origin.y = badgeY;
    self.badgeButton.frame = badgeFrame;
}

-(void)setHighlighted:(BOOL)highlighted{
}

@end
