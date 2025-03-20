//
//  ARHATContext.h
//  Arhat
//
//  Created by jerry on 2017/12/25.
//  Copyright © 2017年 jerry. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <Arhat/ARHATValue.h>

NS_ASSUME_NONNULL_BEGIN

__attribute__((visibility("default")))
@interface ARHATContext : NSObject

@property (nonatomic, assign, readonly)BOOL isValid;;

- (instancetype)initKey1:(NSString *)key1 key2:(NSString *)key2 token:(NSString *)token NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

- (void)runWithData:(NSData *)data;

- (ARHATValue *)objectForKeyedSubscript:(id)key;

- (void)setObject:(ARHATValue *)value forKeyedSubscript:(NSObject <NSCopying> *)key;

- (NSString *)version;

@end

NS_ASSUME_NONNULL_END
