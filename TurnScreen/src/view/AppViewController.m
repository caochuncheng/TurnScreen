//
//  AppViewController.m
//  TurnScreen
//
//  Created by ccc on 15/1/19.
//  Copyright (c) 2015年 www.cccapp.com. All rights reserved.
//

#import "AppViewController.h"

@interface AppViewController ()

@end

@implementation AppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    
    _currentViewClass = nil;
    _viewControllers = [NSMutableDictionary dictionary];
    
    BaseViewController *bvc;
    NSString *key;
    
    bvc = [[NSClassFromString(kAppHomeViewController) alloc]init];
    [bvc willMoveToParentViewController:nil];
    [bvc removeFromParentViewController];
    [self addChildViewController:bvc];
    [bvc didMoveToParentViewController:self];
    bvc.appEventDelegate = self;
    
    key = NSStringFromClass([bvc class]);
    [_viewControllers setObject:bvc forKey:key];
    
    // 默认显示的界面
    self.currentViewController = bvc;
    _currentViewClass = key;
    
    [self initView:self.view.frame];
}
// 预计初始化其它ViewController
-(void)initViewController
{
    
}

// 初始化界面显示对象
- (void)initView:(CGRect)frame
{
    [self.view addSubview:self.currentViewController.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [_viewControllers removeAllObjects];
    _viewControllers = nil;
    _currentViewClass = nil;
    
    self.currentViewController= nil;
}

/**
 *  从后台服务打开应用执行
 */
-(void)applicationDidBecomeActive
{
    BaseViewController *bvc;
    for (NSString *key in [_viewControllers allKeys]) {
        bvc = (BaseViewController *)[_viewControllers objectForKey:key];
        [bvc applicationDidBecomeActive];
    }
}
// 屏幕翻转控制
-(BOOL)shouldAutorotate
{
    return [self.currentViewController shouldAutorotate];
}
// 状态条是否显示
-(BOOL)prefersStatusBarHidden
{
    return [self.currentViewController prefersStatusBarHidden];
}
-(NSUInteger)supportedInterfaceOrientations
{
    return [self.currentViewController supportedInterfaceOrientations];
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.currentViewController preferredInterfaceOrientationForPresentation];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.currentViewController viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.currentViewController willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self.currentViewController didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

#pragma Begin AppEventDelegate
-(void)onClickEvent:(NSInteger)moduleId eventId:(NSInteger)eventId obj:(NSObject *)obj
{
    switch (moduleId) {
        case kAppViewController:
            if (eventId == kAppEventChanged) {
                NSString *viewClass = (NSString *)obj;
                [self showViewController:viewClass];
            }
            break;
        default:
            break;
    }
}
#pragma End AppEventDelegate

-(void)showViewController:(NSString *)viewClass
{
    if (!_viewControllers) {
        return;
    }
    BaseViewController *bvc = nil;
    bvc = (BaseViewController *)[_viewControllers objectForKey:viewClass];
    if (!bvc) {
        bvc = [[NSClassFromString(viewClass) alloc]init];
        [bvc willMoveToParentViewController:nil];
        [bvc removeFromParentViewController];
        
        [self addChildViewController:bvc];
        [bvc didMoveToParentViewController:self];
        bvc.appEventDelegate = self;
        [_viewControllers setObject:bvc forKey:viewClass];
    }
    
    BaseViewController *old = self.currentViewController;
    _currentViewClass = viewClass;
    self.currentViewController = bvc;
    self.currentViewController.view.transform = CGAffineTransformIdentity;
    self.currentViewController.view.layer.transform = CATransform3DIdentity;
    
    UIViewAnimationOptions animationOptionTransition = UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionTransitionFlipFromLeft;
    [self transitionFromViewController:old
                      toViewController:self.currentViewController
                              duration:0.35
                               options:animationOptionTransition
                            animations:^{}
                            completion:^(BOOL finished) {
                                if (finished) {
                                    [self syncInterfaceOrientation];
                                }
                            }];
}
// 屏幕方向变化同步View变化
-(void)syncInterfaceOrientation
{
    UIInterfaceOrientation targetOrientation;
    targetOrientation=[self.currentViewController preferredInterfaceOrientationForPresentation];
    CGRect rc = self.view.frame;
    if (UIInterfaceOrientationIsLandscape(targetOrientation)) {//目标是横屏
        if (rc.size.width < rc.size.height) {
            rc = CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width);
        }
    }
    
    if (UIInterfaceOrientationIsPortrait(targetOrientation)) {//目标是坚屏
        if (rc.size.width > rc.size.height) {
            rc = CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width);
        }
    }
    [self.currentViewController resetViewFrame:rc];
}

-(void)showViewAnimation
{
    [self.currentViewController showViewAnimation];
}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
