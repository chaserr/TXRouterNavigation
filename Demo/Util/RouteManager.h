//
//  RouteManager.h
//  LouYouTest
//
//  Created by 童星 on 2017/6/27.
//  Copyright © 2017年 童星. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RouteManager : NSObject

/**
 *  注册vcs
 */
+ (void)mapViewControllers;

/**
 *  注册tableviewListType和请求url、datamanager,dataSource
 注：
 1.配置对应的请求url，listType,dataManager,dataSource（可选）
 2.dataManager处理获取的数据，创建对应的tableviewitem以及对应的cell
 3.tftableviewController中给对应的listType赋值。
 */
+ (void)mapTableViewListType;
@end
