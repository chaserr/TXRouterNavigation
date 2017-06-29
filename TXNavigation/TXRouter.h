//
//  TXRouter.h
//  LouYouTest
//
//  Created by 童星 on 2017/6/27.
//  Copyright © 2017年 童星. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UIWindow+TXNavigator.h"

typedef NS_ENUM (NSInteger, TFRouteType) {
    TFRouteTypeNone = 0,
    TFRouteTypeViewController = 1,
    TFRouteTypeBlock = 2
};
typedef id (^TFRouterBlock)(NSDictionary *params);


@interface TXRouter : NSObject

+ (instancetype)router;

- (void)map:(NSString *)route toControllerClass:(Class)controllerClass;
- (void)mapWith:(NSDictionary *)param toControllerClass:(Class)controllerClass;
- (UIViewController *)matchController:(NSString *)route;
- (UIViewController *)matchController:(NSString *)route userInfo:(NSDictionary *)userInfo;
- (UIViewController *)matchController:(NSString *)route storyboardName:(NSString *)storyboardName userInfo:(NSDictionary *)userInfo;

- (void)map:(NSString *)route toBlock:(TFRouterBlock)block;
- (TFRouterBlock)matchBlock:(NSString *)route;
- (id)callBlock:(NSString *)route;

- (TFRouteType)canRoute:(NSString *)route;

@end
