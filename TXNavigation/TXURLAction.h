//
//  TXURLAction.h
//  LouYouTest
//
//  Created by 童星 on 2017/6/27.
//  Copyright © 2017年 童星. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class TXURLAction;
typedef void(^TXActionCompletionBlock)(__kindof TXURLAction *action);


@interface TXURLAction : NSObject

@property (nonatomic ,copy) NSString *urlPath;
@property (nonatomic ,strong) NSString *storyboardName;
@property (nonatomic ,strong) NSDictionary *userInfo;
/**
 *  弹出模式
 */
@property (nonatomic ,assign) BOOL presentModel;
/**
 *  弹出模式回调
 */
@property (nonatomic, copy) TXActionCompletionBlock actionCompletionBlock;
/**
 *  转场动画代理
 */
@property (nonatomic, weak) id <UIViewControllerTransitioningDelegate> transitioningDelegate;

/**
 *  一般用于模态时，包装传入的viewController
 */
@property (nonatomic , assign) Class navigationViewControllerClass;
/**
 *  根据url 与 userinfo 构建 TXURLAction
 *
 *  @param urlPath  路由路径
 *  @param userInfo 自定义信息
 *
 *  @return N/A
 */
+ (id)actionWithURLPath:(NSString*)urlPath userInfo:(NSDictionary *)userInfo;

- (id)initWithURLPath:(NSString*)urlPath userInfo:(NSDictionary *)userInfo;

- (TXURLAction*)applyAnimated:(BOOL)animated;


@end
