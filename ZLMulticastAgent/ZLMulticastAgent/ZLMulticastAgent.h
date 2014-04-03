//
//  ZLMulticastAgent.h
//
//  Created by Zhuocheng.Lee on 14-4-3.
//  Copyright (c) 2014年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef MAGLOBALDEFINITIONS_H
  #define MAGLOBALDEFINITIONS_H

  #define EXECUTE_BLOCK_SAFELY(block, ...) { \
        if (block) {                         \
            block(__VA_ARGS__);              \
        }                                    \
}
#endif /* ifndef MAGLOBALDEFINITIONS_H */

@interface ZLMulticastAgent : NSObject

- (void)setListenerKeyToSelecterDict:(NSDictionary *)listenerKeyToSelector;

- (void)listenersForKey:(NSString *)key withBlock:(void (^)(id listener))block;

- (BOOL)addListener:(id)listener;

- (BOOL)removeListener:(id)listener;

@end