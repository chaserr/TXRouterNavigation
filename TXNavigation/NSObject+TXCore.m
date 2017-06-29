//
//  NSObject+TXCore.m
//  LouYouTest
//
//  Created by 童星 on 2017/6/27.
//  Copyright © 2017年 童星. All rights reserved.
//

#import "NSObject+TXCore.h"
#import <objc/runtime.h>
@implementation NSObject (TXCore)

+ (NSArray *)tx_subClasses {
    int numClasses = objc_getClassList(NULL, 0);
    Class *classes = (Class*)malloc(sizeof(Class) * numClasses);
    
    numClasses = objc_getClassList(classes, numClasses);
    
    NSMutableArray *result = [NSMutableArray array];
    for(NSInteger i=0; i<numClasses; i++) {
        Class cls = classes[i];
        do{
            cls = class_getSuperclass(cls);
        }while(cls && cls != [self class]);
        
        if(cls){
            [result addObject:classes[i]];
        }
    }
    free(classes);
    return [result copy];
}


@end
