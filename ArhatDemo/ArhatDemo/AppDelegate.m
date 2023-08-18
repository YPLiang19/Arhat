//
//  AppDelegate.m
//  mangoExample
//
//  Created by jerry.yong on 2017/10/31.
//  Copyright © 2017年 yongpengliang. All rights reserved.
//

#import "AppDelegate.h"
#import <Arhat/Arhat.h>
#import <CommonCrypto/CommonCryptor.h>

static NSString * const aes128Key = @"123456";
static NSString * const aes128Iv = @"abcdef";

static NSData *aesEncrypt(NSData *data ,NSString *key, NSString *iv) {
    NSData *ret = nil;
    char keyPtr[kCCKeySizeAES128+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCBlockSizeAES128 + 1];
    bzero(ivPtr, sizeof(ivPtr));
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];

    
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          ivPtr,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        ret = [NSData dataWithBytes:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return ret;
}


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)encryptPlainScirptToDocument {
    NSError *outErr = nil;
    BOOL writeResult = NO;
    

    
    NSURL *scriptUrl = [[NSBundle mainBundle] URLForResource:@"demo" withExtension:@"arhat"];
    NSString *plainScriptString = [NSString stringWithContentsOfURL:scriptUrl encoding:NSUTF8StringEncoding error:&outErr];
    
    if (outErr) {
        NSLog(@"%@", outErr);
        return NO;
    }
    
    NSData *scriptData = [plainScriptString dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encryptedScriptData = aesEncrypt(scriptData, aes128Key, aes128Iv);//[scriptData demo_AES128ParmEncryptWithKey:aes128Key iv:aes128Iv];
    
    NSString * encryptedPath= [(NSString *)[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"demo_encrypted.arhat"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:encryptedPath]) {
        [fileManager createFileAtPath:encryptedPath contents:nil attributes:nil];
    }
    writeResult = [encryptedScriptData writeToFile:encryptedPath options:NSDataWritingAtomic error:&outErr];
    if (outErr) {
        NSLog(@"%@", outErr);
        return NO;
    }
    return writeResult;

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BOOL writeResult = [self encryptPlainScirptToDocument];
    if (!writeResult) {
        return NO;
    }
    
    NSString *token = @"Jo+tw0IDzybTUuis5IZn+E3p3RpoewBelkKbkwD5YZmi+08BaQa+VyQhCKtPVSpa3HLVmWzfZ5vTCHOjn59WQrkypNTfL7+aRCDZn0T5TIbshESC8VfyvZU4BSQG5hFsKVyBS2PmIH707wghrHvYEJ2Aw3XzPveptciyEhQ8qYnvz26sC9xw1AzJV57zs3hPFfigwAZMmVtC2yDF0m5M5sAP3Biw5ZzilIMN3wQquVzWAS2MqTWuTaH2oZmQp/v+ViBEldJ4fGtHkPJwURymOdv0pRq2UcpAsOM2gJjQQpfvL4W/MERo+0oxbR9To3lLy+ZyD+SDYWuj8BuPrRxh7aisFpFUsszf5uA9+ZPiPeo=";
    
    ARHATContext *context = [[ARHATContext alloc] initKey1:aes128Key key2:aes128Iv token:token];

    NSString * encryptedPath= [(NSString *)[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"demo_encrypted.arhat"];

    NSData *encryptedData = [NSData dataWithContentsOfFile:encryptedPath];
    [context runWithData:encryptedData];
	return YES;
}

@end
