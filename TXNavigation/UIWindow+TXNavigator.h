//
//  UIWindow+TFNavigator.h
//  LouYouTest
//
//  Created by 童星 on 2017/6/27.
//  Copyright © 2017年 童星. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const kTXNavigatorParameterUserInfo;


@interface UIWindow (TXNavigator)

- (UIViewController *)visibleViewController;

@end

@interface UIViewController (TXRouter)
@property (nonatomic, strong) NSDictionary *params;

@end
