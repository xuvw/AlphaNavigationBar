//
//  HKNavigationController.m
//  
//
//  Created by heke on 24/2/16.
//  Copyright © 2016年 mhk. All rights reserved.
//

#import "HKNavigationController.h"

@interface HKNavigationController ()

@end

@implementation HKNavigationController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    UINavigationBar *navigationBar = self.navigationBar;
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"onePixel"] forBarMetrics:UIBarMetricsCompact];
    CGRect rt = navigationBar.bounds;
    rt.origin.y = 0;
    rt.size.height = 64;
    self.customBackgroundView = [[UIView alloc] initWithFrame:rt];
    self.customBackgroundView.backgroundColor = [UIColor whiteColor];
    
    [self.view insertSubview:self.customBackgroundView belowSubview:navigationBar];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setNavigationBarAlpha:(CGFloat)navigationBarAlpha {
    self.customBackgroundView.alpha = navigationBarAlpha;
    
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[[UIColor blackColor] colorWithAlphaComponent:navigationBarAlpha]};
    
    if (navigationBarAlpha<1) {
        [self hideNavigationBarBottomLine];
    }else{
        [self showNavigationBarBottomLine];
    }
    _navigationBarAlpha = navigationBarAlpha;
}

- (void)showNavigationBarBottomLine {
    self.navigationBar.layer.masksToBounds = NO;
}

- (void)hideNavigationBarBottomLine {
    self.navigationBar.layer.masksToBounds = YES;
}

- (void)showNavigationBar {
    self.navigationBarAlpha = 1;
}

- (void)hideNavigationBar {
    self.navigationBarAlpha = 0;
}

@end
