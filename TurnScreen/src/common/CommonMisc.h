//
//  CommonMisc.h
//  TurnScreen
//
//  Created by ccc on 15/5/27.
//  Copyright (c) 2015年 www.cccapp.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonMisc : NSObject

+(NSString *)getPreferredLanguage;

+(float)calcContentWidth:(NSString *)content font:(UIFont *)font height:(float)height;
+(float)calcContentHeight:(NSString *)content font:(UIFont *)font width:(float)width;

@end
