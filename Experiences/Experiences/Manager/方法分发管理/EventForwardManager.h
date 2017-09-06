//
//  EventForwardManager.h
//  SZYiZhangTong
//
//  Created by zhs on 2017/7/10.
//  Copyright © 2017年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, EventForwardId) {
    EventForwardType1,
    EventForwardType2,
    EventForwardType3,
    EventForwardType4,
    EventForwardType5,
    
};
@interface EventForwardManager : NSObject

/**
 事件分发

 @param moduleId moduleID
 @param parmas 参数字典
 @param callback 事件回调
 */
+ (void)eventModuleId:(EventForwardId)moduleId
               parmas:(NSDictionary *)parmas
             callBack:(void(^)(id data))callback;

@end
