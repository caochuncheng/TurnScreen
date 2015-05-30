//
//  MJRefreshConst.h
//  MJRefresh
//
//  Created by mj on 14-1-3.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#ifdef DEBUG
#define MJLog(...) NSLog(__VA_ARGS__)
#else
#define MJLog(...)
#endif

#define MJRefreshFooterPullToRefresh NSLocalizedString(@"mjrefresh.footer.pull_to_refresh", @"")
#define MJRefreshFooterReleaseToRefresh NSLocalizedString(@"mjrefresh.footer.release_to_refresh", @"")
#define MJRefreshFooterRefreshing NSLocalizedString(@"mjrefresh.footer.refreshing", @"")

#define MJRefreshHeaderPullToRefresh NSLocalizedString(@"mjrefresh.header.pull_to_refresh", @"")
#define MJRefreshHeaderReleaseToRefresh NSLocalizedString(@"mjrefresh.header.release_to_refresh", @"")
#define MJRefreshHeaderRefreshing NSLocalizedString(@"mjrefresh.header.refreshing", @"")

#define MJRefreshHeaderToday NSLocalizedString(@"mjrefresh.header.today", @"")
#define MJRefreshHeaderLastUpdate NSLocalizedString(@"mjrefresh.header.last.update", @"")

// 文字颜色
#define MJRefreshLabelTextColor [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0]

extern const CGFloat MJRefreshViewHeight;
extern const CGFloat MJRefreshAnimationDuration;

extern NSString *const MJRefreshBundleName;
#define kSrcName(file) [MJRefreshBundleName stringByAppendingPathComponent:file]


extern NSString *const MJRefreshHeaderTimeKey;

extern NSString *const MJRefreshContentOffset;
extern NSString *const MJRefreshContentSize;