//
//  ZLMulticastAgentDemo.m
//  ZLMulticastAgent
//
//  Created by Lee on 14-4-3.
//  Copyright (c) 2014年 ZhuochengLee. All rights reserved.
//

#import "ZLMulticastAgentDemo.h"

@implementation ZLMulticastAgentDemo

+ (ZLMulticastAgentDemo *)instance
{
    static ZLMulticastAgentDemo *_instance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _instance = [[ZLMulticastAgentDemo alloc] init];
    });

    return _instance;
}

- (id)init
{
    if (self = [super init]) {
        // You should register your delegate key and method
        [self setListenerKeyToSelecterDict:@{@"delegateKey0":NSStringFromSelector(@selector(method0)),
                                             @"delegateKey1":NSStringFromSelector(@selector(method1)),
                                             @"delegateKey2":NSStringFromSelector(@selector(method2)),
                                             @"delegateKey3":NSStringFromSelector(@selector(method3))}];
    }

    return self;
}

- (void)doSomething
{
    // Get all listener of delegateKey0
    [self listenersForKey:@"delegateKey0" withBlock:^(id<ZLMulticastAgentProtocolDemo> listener) {
        // We guarantee that the listener can perform the protocol method, even it is a @optional method
        [listener method0];
    }];

    [self listenersForKey:@"delegateKey2" withBlock:^(id<ZLMulticastAgentProtocolDemo> listener) {
        // We guarantee that the listener can perform the protocol method, even it is a @optional method
        [listener method2];
    }];
}

// You'd better guarantee the listener is implemented your protocol, but also you can call the super method directly
- (BOOL)addListener:(id<ZLMulticastAgentProtocolDemo>)listener
{
    return [super addListener:listener];
}

@end