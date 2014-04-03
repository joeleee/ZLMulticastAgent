//
//  ZLMulticastAgentDemo.h
//  ZLMulticastAgent
//
//  Created by Lee on 14-4-3.
//  Copyright (c) 2014年 ZhuochengLee. All rights reserved.
//

#import "ZLMulticastAgent.h"

@protocol ZLMulticastAgentProtocolDemo <NSObject>

@optional
- (void)method0;
- (void)method1;
- (void)method2;
- (void)method3;

@end

@interface ZLMulticastAgentDemo : ZLMulticastAgent

+ (ZLMulticastAgentDemo *)instance;

- (BOOL)addListener:(id<ZLMulticastAgentProtocolDemo>)listener;

- (void)doSomething;

@end