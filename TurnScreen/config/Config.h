//
//  config.h
//  TurnScreen
//
//  Created by ccc on 14-3-27.
//  Copyright (c) 2015年 www.cccapp.com. All rights reserved.
//

#ifndef TurnScreen_config_h
#define TurnScreen_config_h

// 字体 中文使用 “黑体” 此字体为ios预装字体不需要另外下载字体库
#define kBoldFontName (isSystemFontZhHant ? @"STHeitiTC-Medium" : @"STHeitiSC-Medium")
#define kFontName (isSystemFontZhHant ? @"STHeitiTC-Light" : @"STHeitiSC-Light")
#define kFontSize (isIPad ? 16.0f : 12.0f)

#define kTitleFont [UIFont fontWithName:kBoldFontName size:(isIPad ? 24.0f : 24.0f)]
#define kSystemFont [UIFont systemFontOfSize:kFontSize]

// @"PortraitViewController" or @"LandscapeViewController"
#define kAppHomeViewController @"LandscapeViewController"


#endif
