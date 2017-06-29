//
//  TXNavigation.h
//  LouYouTest
//
//  Created by 童星 on 2017/6/27.
//  Copyright © 2017年 童星. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIWindow+TXNavigator.h"

///////////////////////////////////////////////////////////////////////////////////////////////////

static NSString *kOpenURLViewControllerIndexKey = @"OpenURLViewControllerIndex";///<替换某个viewcontroller的索引
UIViewController * TXOpenURL(NSString *URL ,NSDictionary *userInfo);
UIViewController * TXOpenStoryboardURL(NSString *URL , NSString * storyboardName ,NSDictionary *userInfo);

@class TXURLAction;

@interface TXNavigation : NSObject

+ (instancetype)navigator;
/**
 *  注册Controller
 *
 *  @param route route
 *  @param controllerClass controllerClass
 */
- (void)map:(NSString *)route toControllerClass:(Class)controllerClass;
/**
 *  注册app webview controller
 *
 *  @param route           路由
 *  @param controllerClass Class
 */
- (void)registeredWebViewController:(NSString *)route toControllerClass:(Class)controllerClass;

- (UIViewController *)openURLAction:(TXURLAction *)action;

- (UIViewController *)matchController:(NSString *)route;

- (UIViewController *)matchController:(NSString *)route userInfo:(NSDictionary *)userInfo;

- (UIViewController *)matchController:(NSString *)route storyboardName:(NSString *)storyboardName userInfo:(NSDictionary *)userInfo;


@end
