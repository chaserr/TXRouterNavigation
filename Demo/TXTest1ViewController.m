//
//  TXTest1ViewController.m
//  LouYouTest
//
//  Created by 童星 on 2017/6/27.
//  Copyright © 2017年 童星. All rights reserved.
//

#import "TXTest1ViewController.h"
@interface TXTest1ViewController ()
@property (nonatomic, copy) NSString *paramStr;
@end

@implementation TXTest1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = NSLocalizedString(@"Test1",  nil);

    self.paramStr = self.params[kTXNavigatorParameterUserInfo][@"TX"];
    NSLog(@"%@", self.paramStr);
    
    UIButton *bu = [UIButton new];
    bu.frame = (CGRect){CGPointMake(100, 200),CGSizeMake(100, 100)};
    [bu setTitle:@"点我" forState:(UIControlStateNormal)];
    [bu addTarget:self action:@selector(roterTo2:) forControlEvents:(UIControlEventTouchUpInside)];
    bu.backgroundColor = [UIColor redColor];
    [self.view addSubview:bu];
}
- (void)roterTo2:(id)sender {
    TXOpenURL(kTXTest2ViewController, @{@"block":^(NSString * text){
        NSLog(@"%@", text);
    }});
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
