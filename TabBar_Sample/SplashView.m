//
//  SplashView.m
//  TabBarSmple
//
//  Created by KentarOu on 2015/04/18.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import "SplashView.h"

@implementation SplashView
{
    UIView *splashView;
    UIWindow* window;
    BOOL isLoading;
}

static SplashView* sharedData_ = nil;

+ (SplashView*)sharedManager
{
    // シングルトン作成
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedData_ = [SplashView new];
        
    });
    return sharedData_;
}

- (id)init {
    self = [super init];
    if (self) {
        
        // 初期化処理
        splashView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        splashView.backgroundColor = [UIColor lightGrayColor];
        // インジケーター作成
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [indicator startAnimating];
        indicator.center = splashView.center;
        [splashView addSubview:indicator];
    }
    return self;
}

// スプラッシュ表示中は return YES 非表示時は NO を返す
- (BOOL)showSplash {
    
    if (!isLoading) {
        
        splashView.alpha = 1.0;
        // Window取得
        window = [UIApplication sharedApplication].keyWindow;
        if(!window) {
            window=[[UIApplication sharedApplication].windows objectAtIndex:0];
        }
        // WindowにsplashViewを乗せる
        [window addSubview:splashView];
        isLoading = YES;
    }
    
    return isLoading;
}

// スプラッシュを停止
- (void)hideSplash:(BOOL)animation {
    
    if (isLoading) {
        if (animation) {
            // アニメーション有り
            [UIView animateWithDuration:1.5 animations:^{
                splashView.alpha = 0.0;
            } completion:^(BOOL finished) {
                [splashView removeFromSuperview];
                isLoading = NO;
            }];
        } else {
            // アニメーション無し
            [splashView removeFromSuperview];
        }
    }
}

@end
