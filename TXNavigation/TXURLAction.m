//
//  TXURLAction.m
//  LouYouTest
//
//  Created by 童星 on 2017/6/27.
//  Copyright © 2017年 童星. All rights reserved.
//

#import "TXURLAction.h"

@interface TXURLAction ()
@property (nonatomic ,assign) BOOL animated;

@end

@implementation TXURLAction


+ (id)actionWithURLPath:(NSString*)urlPath userInfo:(NSDictionary *)userInfo{
    return [[self alloc] initWithURLPath:urlPath userInfo:userInfo];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithURLPath:(NSString*)urlPath userInfo:(NSDictionary *)userInfo{
    if (self = [super init]) {
        self.urlPath  = urlPath;
        self.animated = YES;
        self.userInfo = userInfo;
    }
    
    return self;
}

- (TXURLAction*)applyAnimated:(BOOL)animated {
    self.animated = animated;
    return self;
}

- (void)dealloc {
    self.actionCompletionBlock = nil;
    self.transitioningDelegate = nil;
    self.userInfo = nil;
}

@end
