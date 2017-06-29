//
//  ViewController.m
//  LouYouTest
//
//  Created by 童星 on 2017/6/22.
//  Copyright © 2017年 童星. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"首页",  nil);
    
    UIButton *bu = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [bu setTitle:@"点我" forState:(UIControlStateNormal)];
    bu.frame = (CGRect){CGPointMake(100, 200),CGSizeMake(100, 100)};
    [bu addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
    bu.backgroundColor = [UIColor redColor];
    [self.view addSubview:bu];
}

- (void)action:(id)sender {
    
//    [self.navigationController pushViewController:[[TXTest1ViewController alloc] init] animated:YES];
    TXOpenURL(kTXTest1ViewController, @{@"TX":@"HAHAHA"});
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
