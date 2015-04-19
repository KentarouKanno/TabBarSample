//
//  SplashView.h
//  TabBarSmple
//
//  Created by KentarOu on 2015/04/18.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplashView : NSObject

// シングルトン
+ (SplashView*)sharedManager;

// スプラッシュを表示
- (BOOL)showSplash;

// スプラッシュを非表示(アニメーション指定)
- (void)hideSplash:(BOOL)animation;

@end
