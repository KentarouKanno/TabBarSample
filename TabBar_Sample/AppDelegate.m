//
//  AppDelegate.m
//  TabBarSmple
//
//  Created by KentarOu on 2015/04/18.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import "AppDelegate.h"
#import "Tab1VC1.h"
#import "SplashView.h"

@interface AppDelegate ()
{
    BOOL isTransition;
}

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // タブバーをプロパティとして保持
    self.tabBarVC = (TabBarViewController*)self.window.rootViewController;
    
    return YES;
}


- (void)screenTransition {
    
    // タブバーの「0番目」のナビコンを取得
    UINavigationController *navi = self.tabBarVC.viewControllers[0];
    // ナビコンの「0番目」のView(Tab1VC1)を取得
    Tab1VC1 *v = navi.viewControllers[0];
    // 画面遷移判定のメソッド呼び出し
    [v screenTransition];
}


-(void)applicationDidBecomeActive:(UIApplication *)application {
    
    if (!isTransition) {
        // スプラッシュを表示
        [[SplashView sharedManager] showSplash];
        // 画面遷移判定
        [self screenTransition];
        isTransition = YES;
    }
}


// URLスキームからの起動
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    // TabBarの0番目のタブを選択する
    self.tabBarVC.selectedIndex = 0;
    
    // 最前面のViewControllerを取得する
    UIViewController *view = [self topMostController];
    
    if (![view isKindOfClass:[UITabBarController class]] ) {
        // 最前面がTabBarでない時(ModalView)モーダルを閉じる
        [self.window.rootViewController dismissViewControllerAnimated:NO completion:^{}];
    }
    
    UINavigationController *navi = self.tabBarVC.viewControllers[0];
    [navi popToRootViewControllerAnimated:NO];
    
    // 選択しているタブを「0番目」にリセットする
    [self.tabBarVC resetSelectIndex];
    
    self.isSCreen = NO;
    
    // スプラッシュを表示
    [[SplashView sharedManager] showSplash];
    // 画面遷移判定
    [self screenTransition];
    
    return YES;
}

// 最前面のViewを取得して返す
- (UIViewController*) topMostController
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    return topController;
}


@end
