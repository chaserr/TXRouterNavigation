//
//  RouteManager.m
//  LouYouTest
//
//  Created by 童星 on 2017/6/27.
//  Copyright © 2017年 童星. All rights reserved.
//

#import "RouteManager.h"
@implementation RouteManager

+ (void)mapViewControllers {
    /**
     * map your viewcontroller with jump url and class from string . note: url should be defined in AppViewControllerMapURLConfig
     for example:   [self mapViewControllersWithMapURLsArray:@[
     TFTestDetailURL,
     ...
     ]];
     
     */
    TXNavigation *shareNavigator = [TXNavigation navigator];
    for (Class vcClass in [UIViewController tx_subClasses]) {
        [shareNavigator map:NSStringFromClass(vcClass) toControllerClass:vcClass];
    }
}

#pragma mark 注册tableviewListType和请求url、datamanager,dataSource
+ (void)mapTableViewListType {
    /**
     *  map your tableview list type with List type (note: defined in AppPublicProperty) , dataSourceClass string (note: "" means "TFTableViewDataSource"), dataManagerClass string , request url (note: defined in AppInterfaceConfig)
     for example :
     [self mapTableViewListTypeWithMappingInfo:@{
     @(ListTypeDemoList):
     @{
     kTFTableViewDataRequestURLKey:kDemoListUrl,
     kTFTableViewDataSourceClassKey:@"TFDemoListDataSource",
     kTFTableViewDataManagerClassKey:@"TFDemoListDataManager",
     },
     ...
     }];
     
     */
    
//    [self mapTableViewListTypeWithMappingInfo:@{
//                                                
//                                                @(ListTypeMinePostDetails):@{
//                                                        kTFTableViewDataRequestURLKey: kPCDMinePostDetailsInterfaceUrl,
//                                                        kTFTableViewDataManagerClassKey:@"PCDMinePostDetailsDataManager",
//                                                        kTFTableViewDataSourceClassKey:@"PCDBaseTableViewDataSource"
//                                                        },
//                                                
//                                                }];
}

#pragma mark 注册vc公共方法

+ (void)mapViewControllerWithURL:(NSString *)url class:(Class)class {
    [[TXNavigation navigator] map:url toControllerClass:class];
}

+ (void)mapViewControllersWithMapURLsArray:(NSArray *)urlsArr {
    TXNavigation *shareNavigator = [TXNavigation navigator];
    for (NSString *mapUrl in urlsArr) {
        Class class = NSClassFromString(mapUrl);
        NSAssert(class, @"map url of viewcontroller shoule be equal to the name of viewcontroller");
        [shareNavigator map:mapUrl toControllerClass:class];
    }
}

@end
