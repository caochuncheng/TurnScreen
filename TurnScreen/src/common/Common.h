//
//  common.h
//  TurnScreen
//
//  Created by ccc on 14-3-31.
//  Copyright (c) 2015年 www.cccapp.com. All rights reserved.
//

#ifndef TurnScreen_Common_h
#define TurnScreen_Common_h

/**
 *  define DEBUG() for logger
 */

#if DEBUG

#ifndef DLog
#define DLog(x, ...) NSLog(x, ## __VA_ARGS__)
#define DLogStr(str,var) NSLog(@"%@=%@",str,var)
#define DLogBool(str,isVal) NSLog(@"%@=%@",str,(isVal ? @"YES" : @"NO"))
#define DLogRect(str,rc) NSLog(@"%@ {x=%f,y=%f,w=%f,h=%f}",str,rc.origin.x,rc.origin.y,rc.size.width,rc.size.height)
#endif

#else

#ifndef DLog
#define DLog(x, ...)
#define DLogStr(str,var)
#define DLogRect(str,rc)
#define DLogBool(str,isVal)
#endif

#endif

#ifndef DEBUG_LOG
#define DEBUG_LOG 2
#endif



/**
 *  common define
 */

#define isIPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define isIPhone4 (isIPad ? NO : [[UIScreen mainScreen] bounds].size.height == 480)
#define isIPhone5 (isIPad ? NO : [[UIScreen mainScreen] bounds].size.height == 568)
#define isIPhone6 (isIPad ? NO : [[UIScreen mainScreen] bounds].size.height == 667)
#define isIPhonePlus (isIPad ? NO : [[UIScreen mainScreen] bounds].size.height == 736)


#define isIOS8  ([[[UIDevice currentDevice] systemVersion] intValue] >= 8)
#define isIOS7  (!isIOS8 && [[[UIDevice currentDevice] systemVersion] intValue] >= 7 )
#define isIOS7Later (isIOS8 ? YES : (isIOS7 ? YES : NO))
#define IOS_OFFSET (isIOS7Later ? 20.0f : 0.0f) //IOS页头校正值

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
#define kTextAlignmentCenter NSTextAlignmentCenter
#define kTextAlignmentRight NSTextAlignmentRight
#define kTextAlignmentLeft NSTextAlignmentLeft
#define kLineBreakWordWrap NSLineBreakByWordWrapping
#else
#define kTextAlignmentCenter UITextAlignmentCenter
#define kTextAlignmentRight UITextAlignmentRight
#define kTextAlignmentLeft UITextAlignmentLeft
#define kLineBreakWordWrap UILineBreakModeWordWrap
#endif

#define PI 3.14159265358979323846

/**
 *  common function
 */

#define DegreesToRadians(degrees) (degrees * M_PI / 180)

#define RGB_COLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBA_COLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define HSV_COLOR(h,s,v) [UIColor colorWithHue:(h) saturation:(s) value:(v) alpha:1]
#define HSVA_COLOR(h,s,v,a) [UIColor colorWithHue:(h) saturation:(s) value:(v) alpha:(a)]



/*!
 * @function Singleton GCD Macro
 * https://gist.github.com/lukeredpath/1057420
 */
#ifndef SINGLETON_GCD
#define SINGLETON_GCD(classname)                        \
\
+ (classname *)shared##classname {                      \
\
static dispatch_once_t pred;                            \
__strong static classname * shared##classname = nil;    \
dispatch_once( &pred, ^{                                \
shared##classname = [[self alloc] init]; });            \
return shared##classname;                               \
}
#endif

/**
 *  common import
 */
#import "AppCommand.h"
#import "CommonDelegate.h"
#import "CommonMisc.h"

// 判断当前IOS的系统语言是繁体
#define isSystemFontZhHant [[CommonMisc getPreferredLanguage] isEqualToString:@"zh-Hant"]

#endif
