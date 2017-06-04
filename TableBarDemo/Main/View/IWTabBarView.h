//
//  IWTabBarView.h
//  IWeBo
//
//  Created by Administrator on 16/2/25.
//  Copyright © 2016年 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IWTabBarView.h"
typedef void(^blockBtn)();
@protocol IWTabBarViewDalegate <NSObject>

@optional

-(void)IWTabBarViewTo:(long)to;

@end

@interface IWTabBarView : UIView

-(void)initWithTabBarItem:(UITabBarItem *)tabBarItem;
@property (nonatomic,copy) blockBtn blockBtn;
@property(nonatomic,strong)id <IWTabBarViewDalegate>delegate;
@end
