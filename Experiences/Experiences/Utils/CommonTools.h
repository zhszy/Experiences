//
//  CommonTools.h
//  SZYiZhangTong
//
//  Created by Joenny on 17/2/17.
//  Copyright © 2017年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface CommonTools : NSObject

/**
 aes128+base64加密

 @param content 需加密字符串
 @param key 用以加密密钥
 @return 返回加密后字符串
 */
+ (NSString *)encryptAES:(NSString *)content key:(NSString *)key;

/**
 aes128+base64解密
 
 @param content 需解密字符串
 @param key 用以解密密钥
 @return 返回解密后字符串
 */
+ (NSString *)decryptAES:(NSString *)content key:(NSString *)key;


/**
 md5加密

 @param input 输入字符串
 @return 返回加密后字符串
 */
+ (NSString *) md5:(NSString *) input;

/**
 base64字符串加密
 
 @param str 需要被加密的base64字符串
 @return 加密后的base64字符串
 */
+ (NSString *)base64encodeWithString:(NSString *)str;

/**
 SHA256加密

 @param encrypt 需加密字符串
 @return 返回加密后字符串
 */
+ (NSString*) sha256:(NSString *)encrypt;

/**
 计算两点之间的距离

 @param lat1 lat1
 @param lat2 lat2
 @param lng1 lng1
 @param lng2 lng2
 @return 距离
 */
+ (double)distanceFromStartPointLat:(double)lat1 lng:(double)lng1 endPointLat:(double)lat2 lng:(double)lng2;


@end
