//
//  TXNavigation.m
//  LouYouTest
//
//  Created by 童星 on 2017/6/27.
//  Copyright © 2017年 童星. All rights reserved.
//

#import "TXNavigation.h"
#import "TXRouter.h"
#import "TXURLAction.h"
///////////////////////////////////////////////////////////////////////////////////////////////////
UIViewController * TXOpenURL(NSString* URL ,NSDictionary *userInfo) {
    return [[TXNavigation navigator] openURLAction:[TXURLAction actionWithURLPath:URL userInfo:userInfo]];
}

UIViewController * TXOpenStoryboardURL(NSString* URL ,NSString * storyboardName ,NSDictionary *userInfo) {
    TXURLAction *urlAction = [TXURLAction actionWithURLPath:URL userInfo:userInfo];
    urlAction.storyboardName = storyboardName;
    return [[TXNavigation navigator] openURLAction:urlAction];
}

@interface TXNavigation ()

@property (nonnull ,copy) NSString *webViewRouter;

@end
@implementation TXNavigation

+ (instancetype)navigator {
    static TXNavigation *navigator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!navigator) {
            navigator = [[self alloc] init];
        }
    });
    return navigator;
}

#pragma mark - Public

- (void)map:(NSString *)route toControllerClass:(Class)controllerClass {
    [[TXRouter router] map:route toControllerClass:controllerClass];
}

- (void)registeredWebViewController:(NSString *)route toControllerClass:(Class)controllerClass {
    self.webViewRouter = route;
    [[TXRouter router] map:route toControllerClass:controllerClass];
}


- (UIViewController *)openURLAction:(TXURLAction *)action {
    if (action == nil || action.urlPath == nil) {
        return nil;
    }
    //third-party app
    NSURL *URL = [NSURL URLWithString:action.urlPath];
    if ([self isAppURL:URL]) {
        [[UIApplication sharedApplication] openURL:URL options:@{} completionHandler:nil];
        return nil;
    }
    if ([self isWebURL:URL]) {
        //web url check
        if (_webViewRouter) {
            //use registered WebView  open the web url
            TXOpenURL(self.webViewRouter, @{@"url":URL});
        }
        else {
            //use safari open the web url
            [[UIApplication sharedApplication] openURL:URL options:@{} completionHandler:nil];
        }
    }
    UIViewController *viewController;
    if (action.storyboardName.length!=0) {
        viewController = [self matchController:action.urlPath storyboardName:action.storyboardName userInfo:action.userInfo];
    }
    else {
        viewController = [self matchController:action.urlPath userInfo:action.userInfo];
    }
    if (!viewController) {
        return nil;
    }
    //open viewcontroller
    UIViewController *currentController = [[[UIApplication sharedApplication] keyWindow] visibleViewController];
    if (currentController) {
        if (action.transitioningDelegate) {
            viewController.transitioningDelegate = action.transitioningDelegate;
            viewController.modalPresentationStyle = UIModalPresentationCustom;
        }
        if (action.presentModel) {
            UIViewController *vc = nil;
            
            if (viewController.navigationController) {
                vc = viewController;
            }
            else {
                action.navigationViewControllerClass = action.navigationViewControllerClass ? : [UINavigationController class];
                vc = [[action.navigationViewControllerClass alloc] initWithRootViewController:viewController];
            }
            
            [currentController presentViewController:vc
                                            animated:YES
                                          completion:^{
                                              if (action.actionCompletionBlock) {
                                                  action.actionCompletionBlock(action);
                                                  action.actionCompletionBlock = nil;
                                              }
                                          }];
        }
        else {
            viewController.hidesBottomBarWhenPushed = YES;
            NSNumber *replaceIndex = action.userInfo[kOpenURLViewControllerIndexKey];
            if (replaceIndex) {
                NSArray *viewControllersArr = currentController.navigationController.viewControllers;
                viewControllersArr = [viewControllersArr subarrayWithRange:NSMakeRange(0, viewControllersArr.count-[replaceIndex integerValue])];
                
                [currentController.navigationController setViewControllers:[viewControllersArr arrayByAddingObject:viewController] animated:YES];
            }
            else {
                [currentController.navigationController pushViewController:viewController
                                                                  animated:YES];
            }
        }
    }
    return viewController;
}


- (UIViewController *)matchController:(NSString *)route {
    return [self matchController:route userInfo:nil];
}
- (UIViewController *)matchController:(NSString *)route userInfo:(NSDictionary *)userInfo {
    UIViewController *viewController = [[TXRouter router] matchController:route userInfo:userInfo];
    return viewController;
}

- (UIViewController *)matchController:(NSString *)route storyboardName:(NSString *)storyboardName userInfo:(NSDictionary *)userInfo {
    UIViewController *viewController = [[TXRouter router]matchController:route storyboardName:storyboardName userInfo:userInfo];
    return viewController;
}

#pragma mark - Private

///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isAppURL:(NSURL*)URL {
    return [self isExternalURL:URL]
    || ([[UIApplication sharedApplication] canOpenURL:URL]
        && ![self isWebURL:URL]);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isWebURL:(NSURL*)URL {
    return !URL.scheme ? NO : [URL.scheme caseInsensitiveCompare:@"http"] == NSOrderedSame
    || [URL.scheme caseInsensitiveCompare:@"https"] == NSOrderedSame
    || [URL.scheme caseInsensitiveCompare:@"ftp"] == NSOrderedSame
    || [URL.scheme caseInsensitiveCompare:@"ftps"] == NSOrderedSame
    || [URL.scheme caseInsensitiveCompare:@"data"] == NSOrderedSame
    || [URL.scheme caseInsensitiveCompare:@"file"] == NSOrderedSame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isExternalURL:(NSURL*)URL {
    if ([URL.host isEqualToString:@"maps.google.com"]
        || [URL.host isEqualToString:@"itunes.apple.com"]
        || [URL.host isEqualToString:@"phobos.apple.com"]) {
        return YES;
        
    } else {
        return NO;
    }
}

@end
