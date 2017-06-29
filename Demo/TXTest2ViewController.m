//
//  TXTest2ViewController.m
//  LouYouTest
//
//  Created by 童星 on 2017/6/27.
//  Copyright © 2017年 童星. All rights reserved.
//

#import "TXTest2ViewController.h"
typedef void(^TestBlock)(NSString *str);

@interface TXTest2ViewController ()
@property (nonatomic, copy) TestBlock testBlock;

@end

@implementation TXTest2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.title = NSLocalizedString(@"Test2",  nil);

    self.testBlock = self.params[kTXNavigatorParameterUserInfo][@"block"];
    UIButton *bu = [UIButton new];
    bu.frame = (CGRect){CGPointMake(100, 200),CGSizeMake(100, 100)};
    [bu setTitle:@"点我" forState:(UIControlStateNormal)];
    [bu addTarget:self action:@selector(test2Action:) forControlEvents:(UIControlEventTouchUpInside)];
    bu.backgroundColor = [UIColor redColor];
    [self.view addSubview:bu];
}
- (void)test2Action:(id)sender {
    self.testBlock(@"我点了测试控制器2上面的 button");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
