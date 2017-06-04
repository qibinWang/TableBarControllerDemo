//
//  IWBadgeButton.m
//  IWeBo
//
//  Created by Administrator on 16/2/29.
//  Copyright © 2016年 Administrator. All rights reserved.
//

#import "IWBadgeButton.h"

@implementation IWBadgeButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        self.hidden = YES;
        self.userInteractionEnabled = NO;
        self.titleLabel.font = IWBadgeTitleFont;
    }
    return self;
}

-(void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = [badgeValue copy];
    
    if (badgeValue == nil) {
        self.hidden = YES;
    }
    else
    {
        //设置文字
        [self setTitle:badgeValue forState:UIControlStateNormal];
        self.hidden = NO;
        //设置Frame
        
        CGRect frame = self.frame;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        if(badgeValue.length > 1)
        {
            CGSize textMaxSize = CGSizeMake(200, MAXFLOAT);
//            badgeW = [badgeValue sizeWithFont:IWBadgeTitleFont maxSize:textMaxSize].width + 10;
        }
        frame.size.width = badgeW;
        frame.size.height = badgeH;
        self.frame = frame;
    }
}

@end
