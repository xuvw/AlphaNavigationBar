//
//  ViewController.m
//  AlphaNavigationBarDemo
//
//  Created by heke on 24/2/16.
//  Copyright © 2016年 mhk. All rights reserved.
//

#import "ViewController.h"
#import "HKNavigationController.h"

@interface ViewController ()
<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak)   HKNavigationController *hkNavigationController;
@property (nonatomic, assign) CGFloat currentNaviBarAlpha;

@end

@implementation ViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"alphaNaviBar";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    if ([self.navigationController isKindOfClass:[HKNavigationController class]]) {
        self.hkNavigationController = (HKNavigationController *)self.navigationController;
        self.currentNaviBarAlpha = 0;
        self.hkNavigationController.navigationBarAlpha = self.currentNaviBarAlpha;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.hkNavigationController.navigationBarAlpha = self.currentNaviBarAlpha;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.hkNavigationController.navigationBarAlpha = 1;
}


#pragma mark - setter & getter 
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - TableView delegate & Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"#############%li",(long)indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ViewController *vc = [[ViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat YContentOffset = scrollView.contentOffset.y;
    
    CGFloat alpha = YContentOffset *(1/400.0);
    if (alpha>1) {
        alpha = 1;
    }
    
    if (alpha<0) {
        alpha = 0;
    }
    
    self.currentNaviBarAlpha = alpha;
    self.hkNavigationController.navigationBarAlpha = self.currentNaviBarAlpha;
}

@end
