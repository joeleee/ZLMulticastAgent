//
//  ZLMulticastAgent.h
//
//  Created by Zhuocheng.Lee on 14-4-3.
//  Copyright (c) 2014年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZLMulticastAgent : NSObject

// Set the listenerID with protocol-selecter Key-Values
- (void)setListenerIDToSelecterDict:(NSDictionary *)listenerIDToSelector;

// Get all the listeners of the key with the block
- (void)listenersForKey:(NSString *)key withBlock:(void (^)(id listener))block;

// Add a listener to this Multicast-Agent
- (BOOL)addListener:(id)listener;

// Remove a listener to this Multicast-Agent
- (BOOL)removeListener:(id)listener;

@end