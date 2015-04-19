//
//  TabBarViewController.m
//  TabBarSmple
//
//  Created by KentarOu on 2015/04/18.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()<UITabBarControllerDelegate>
{
    int selectTab;
    UIViewController *selectViewController;
}

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    selectViewController = self.viewControllers[0];
    selectTab = 0;
    self.delegate = self;
}

-(void)resetSelectIndex {
    selectViewController = self.viewControllers[0];
    selectTab = 0;
}


#pragma mark- UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    // 選択中のタブを押下時にrootに戻さない為の処理
    if ([viewController isEqual:selectViewController]) {
        return NO;
    }
    
    selectViewController = viewController;
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
