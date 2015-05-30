//
//  CommonMisc.m
//  TurnScreen
//
//  Created by ccc on 15/5/27.
//  Copyright (c) 2015年 www.cccapp.com. All rights reserved.
//

#import "CommonMisc.h"

@implementation CommonMisc


/**
 *  得到本机现在用的语言
 *  en:英文  zh-Hans:简体中文   zh-Hant:繁体中文    ja:日本  ......
 *  @return <#return value description#>
 */
+(NSString *)getPreferredLanguage
{
    NSArray* languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    NSString* preferredLang = [languages objectAtIndex:0];
    if ([preferredLang isEqualToString:@"en"]
        || [preferredLang isEqualToString:@"zh-Hans"]
        || [preferredLang isEqualToString:@"zh-Hant"]) {
        return preferredLang;
    }
    return @"zh-Hans";
}
/**
 *  计算字符显示的宽度
 *
 *  @param content 显示字符
 *  @param font    显示字体
 *  @param height  显示的高度
 *
 *  @return <#return value description#>
 */
+(float)calcContentWidth:(NSString *)content font:(UIFont *)font height:(float)height
{
    CGSize size = CGSizeMake(0, 0);
    if (isIOS7Later) {
        size = [content boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName: font}
                                     context:nil].size;
    }else{
        size = [content sizeWithFont:font
                   constrainedToSize:CGSizeMake(MAXFLOAT, height)
                       lineBreakMode:kLineBreakWordWrap];
    }
    return size.width + 1.0f;
}
/**
 *  计算字符显示的高度
 *
 *  @param content 显示字符
 *  @param font    字符显示字体
 *  @param width   显示的宽度
 *
 *  @return <#return value description#>
 */
+(float)calcContentHeight:(NSString *)content font:(UIFont *)font width:(float)width
{
    CGSize size = CGSizeMake(0, 0);
    if (isIOS7Later) {
        size = [content boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName: font}
                                     context:nil].size;
    }else{
        size = [content sizeWithFont:font
                   constrainedToSize:CGSizeMake(width, MAXFLOAT)
                       lineBreakMode:kLineBreakWordWrap];
    }
    return size.height + 1.0f;
}

@end
