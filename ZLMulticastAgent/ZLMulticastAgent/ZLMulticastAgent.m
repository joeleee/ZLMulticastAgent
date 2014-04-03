//
//  ZLMulticastAgent.h
//
//  Created by Zhuocheng.Lee on 14-4-3.
//  Copyright (c) 2014年 Lee. All rights reserved.
//

#import "ZLMulticastAgent.h"

#pragma mark - MAListenerPackingObject

@interface MAListenerPackingObject : NSObject

@property (nonatomic, weak) id listener;

+ (MAListenerPackingObject *)listenerPackingObject:(id)listener;

@end

@implementation MAListenerPackingObject

+ (MAListenerPackingObject *)listenerPackingObject:(id)listener
{
    MAListenerPackingObject *packingObject = [[MAListenerPackingObject alloc] init];
    packingObject.listener = listener;
    return packingObject;
}

@end


#pragma mark - ZLMulticastAgent

@interface ZLMulticastAgent ()

@property (nonatomic, strong) NSDictionary *listeners;
@property (nonatomic, strong) NSDictionary *listenerKeyToSelector;

@end

@implementation ZLMulticastAgent

- (void)setListenerKeyToSelecterDict:(NSDictionary *)listenerKeyToSelector
{
    [self removeAllListeners];
    self.listenerKeyToSelector = listenerKeyToSelector;

    NSMutableDictionary *listeners = [NSMutableDictionary dictionary];
    for (NSString *key in [listenerKeyToSelector allKeys]) {
        [listeners setObject:[NSMutableSet set] forKey:key];
    }
    self.listeners = listeners;
}

- (void)listenersForKey:(NSString *)key withBlock:(void(^)(id listener))block
{
    NSMutableSet *listenerSet = [_listeners objectForKey:key];
    for (MAListenerPackingObject *listenerObject in listenerSet) {
        NSAssert(listenerObject.listener, @"Do you forgot to remove listener when you dealloc the delegate?");
        EXECUTE_BLOCK_SAFELY(block,listenerObject.listener);
    }
}

- (BOOL)addListener:(id)listener
{
    BOOL result = NO;

    MAListenerPackingObject *packingObject = [MAListenerPackingObject listenerPackingObject:listener];
    result = [self addListenerPackingObject:packingObject];

    return result;
}

- (BOOL)removeListener:(id)listener
{
    BOOL result = NO;

    for (NSString *key in [_listenerKeyToSelector allKeys]) {
        NSSet *listenerSet = [NSSet setWithSet:[_listeners objectForKey:key]];
        for (MAListenerPackingObject *listenerObject in listenerSet) {
            if (listenerObject.listener == listener) {
                result = [self removeListenerPackingObject:listenerObject];
                return result;
            } else if (!listenerObject.listener) {
                [self removeListenerPackingObject:listenerObject];
            }
        }
    }

    return result;
}

#pragma mark - private method

- (BOOL)addListenerPackingObject:(MAListenerPackingObject *)packingObject
{
    BOOL result = NO;

    for (NSString *key in [_listenerKeyToSelector allKeys]) {
        NSString *selectorName = [_listenerKeyToSelector objectForKey:key];
        if ([packingObject.listener respondsToSelector:NSSelectorFromString(selectorName)]) {
            if (!result) {
                result = YES;
            }
            [[_listeners objectForKey:key] addObject:packingObject];
        }
    }
    return result;
}

- (BOOL)removeListenerPackingObject:(MAListenerPackingObject *)packingObject
{
    BOOL result = NO;

    for (NSString *key in [_listenerKeyToSelector allKeys]) {
        if ([[_listeners objectForKey:key] containsObject:packingObject]) {
            result = YES;
            [[_listeners objectForKey:key] removeObject:packingObject];
        }
    }
    return result;
}

- (void)removeAllListeners
{
    NSMutableSet *listenerSet = [NSMutableSet set];
    for (NSString *key in [_listenerKeyToSelector allKeys]) {
        [listenerSet addObjectsFromArray:[_listeners objectForKey:key]];
    }

    for (id listener in listenerSet) {
        [self removeListener:listener];
    }
}

@end