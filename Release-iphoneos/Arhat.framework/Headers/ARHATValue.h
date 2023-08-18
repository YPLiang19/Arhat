//
//  ARHATValue .h
//  Arhat
//
//  Created by jerry on 2018/2/28.
//  Copyright © 2018年 jerry. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

__attribute__((visibility("default")))
@interface ARHATValue : NSObject

- (BOOL)isSubtantial;
- (BOOL)isObject;
- (BOOL)isNumber;
- (BOOL)isBaseValue;

- (uint64_t)c2uintValue;
- (int64_t)c2integerValue;
- (double)c2doubleValue;
- (nullable id)c2objectValue;
- (void *)c2pointerValue;

+ (instancetype)defaultValueWithTypeEncoding:(const char *)typeEncoding;
+ (instancetype)voidValueInstance;
+ (instancetype)valueInstanceWithBOOL:(BOOL)boolValue;
+ (instancetype)valueInstanceWithUint:(uint64_t)uintValue;
+ (instancetype)valueInstanceWithInt:(int64_t)intValue;
+ (instancetype)valueInstanceWithDouble:(double)doubleValue;
+ (instancetype)valueInstanceWithObject:(nullable id)objValue;
+ (instancetype)valueInstanceWithBlock:(nullable id)blockValue;
+ (instancetype)valueInstanceWithClass:(nullable Class)clazzValue;
+ (instancetype)valueInstanceWithSEL:(SEL)selValue;
+ (instancetype)valueInstanceWithCstring:(nullable const char *)cstringValue;
+ (instancetype)valueInstanceWithPointer:(nullable void *)pointerValue;
+ (instancetype)valueInstanceWithStruct:(void *)structValue typeEncoding:(const char *)typeEncoding copyData:(BOOL)copyData;

- (instancetype)nsStringValue;

@end
NS_ASSUME_NONNULL_END
