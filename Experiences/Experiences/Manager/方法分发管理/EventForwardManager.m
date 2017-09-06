//
//  EventForwardManager.m
//  SZYiZhangTong
//
//  Created by zhs on 2017/7/10.
//  Copyright © 2017年 pingan. All rights reserved.
//

#import "EventForwardManager.h"
#import <objc/message.h>
@implementation EventForwardManager
/**
 方法配置

 @return 类方法列表
 */
+ (NSDictionary *)specialFunctionList{
    NSDictionary *dict = @{@(EventForwardType1)     :@"eventForwardTest1",
                           @(EventForwardType2)     :@"eventForwardTest2:",
                           @(EventForwardType3)     :@"eventForwardTest3CallBack:",
                           @(EventForwardType4)     :@"eventForwardTest4:CallBack:",
                           };
    return dict;
}

+ (void)eventModuleId:(EventForwardId)moduleId
               parmas:(NSDictionary *)parmas
             callBack:(void(^)(id data))callback{
    NSDictionary *functionList = [self specialFunctionList];
    NSNumber *key = [NSNumber numberWithInteger:moduleId];
    NSString *selectorStr = functionList[key];
    SEL selector = NSSelectorFromString(selectorStr);

    if ([[self class] respondsToSelector:selector]) {
        NSArray *tempArray = [selectorStr componentsSeparatedByString:@":"];
        if (tempArray.count-1 ==2) {
            ((void(*)(id, SEL, id, void(^)(id data)))objc_msgSend)(self, selector, parmas, callback);
        }else if(tempArray.count-1 ==1){
            NSString *tempStr = @"CallBack:";
            if ([selectorStr rangeOfString:tempStr].location != NSNotFound) {  //有回调
                ((void(*)(id, SEL,void(^)(id data)))objc_msgSend)(self, selector, callback);
            }else{
                ((void(*)(id, SEL,id))objc_msgSend)(self, selector, parmas);
            }
        }else if(tempArray.count-1 ==0){
            ((void(*)(id, SEL))objc_msgSend)(self, selector);
        }
    }else{
        NSLog(@"当前方法不存在 --- %@",selectorStr);
    }
}

+ (void)eventForwardTest1{
    NSLog(@"%s",__FUNCTION__);
}

+ (void)eventForwardTest2:(NSDictionary *)parms{
    NSLog(@"%s",__FUNCTION__);

}
+ (void)eventForwardTest3CallBack:(void(^)(id data))callback{
    if (callback) {
        callback(@"Test3");
    }
    NSLog(@"%s",__FUNCTION__);

}
+ (void)eventForwardTest4:(NSDictionary *)parms CallBack:(void(^)(id data))callback {
    callback(@"Test4");
    NSLog(@"%s",__FUNCTION__);
}

@end
