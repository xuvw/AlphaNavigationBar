//
//  HKNavigationController.h
//  SoYoungMobile40
//
//  Created by heke on 24/2/16.
//  Copyright © 2016年 mhk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HKNavigationController : UINavigationController

@property (nonatomic, strong) UIView *customBackgroundView;
@property (nonatomic, assign) CGFloat navigationBarAlpha;

- (void)showNavigationBarBottomLine;
- (void)hideNavigationBarBottomLine;
- (void)showNavigationBar;
- (void)hideNavigationBar;

@end
