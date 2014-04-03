//
//  ZLViewController.m
//  ZLMulticastAgent
//
//  Created by Lee on 14-4-3.
//  Copyright (c) 2014年 ZhuochengLee. All rights reserved.
//

#import "ZLViewController.h"

#import "ZLMulticastAgentDemo.h"

@interface ZLViewController () <ZLMulticastAgentProtocolDemo>

@end

@implementation ZLViewController

- (id)init
{
    if (self = [super init]) {
        [[ZLMulticastAgentDemo instance] addListener:self];
    }

    return self;
}

- (void)dealloc
{
    [[ZLMulticastAgentDemo instance] removeListener:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[ZLMulticastAgentDemo instance] doSomething];
}

#pragma mark - ZLMulticastAgentProtocolDemo
- (void)method2
{
    NSLog(@"Oh, I am one of the listener in the ZLMulticastAgentDemo.");
}

@end
