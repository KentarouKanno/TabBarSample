//
//  AppDelegate.h
//  TabBarSmple
//
//  Created by KentarOu on 2015/04/18.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TabBarViewController *tabBarVC;
@property (nonatomic,assign) BOOL isSCreen;

@end

