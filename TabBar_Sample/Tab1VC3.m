//
//  Tab1VC3.m
//  TabBarSmple
//
//  Created by KentarOu on 2015/04/18.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import "Tab1VC3.h"
#import "SplashView.h"

@interface Tab1VC3 ()

@end

@implementation Tab1VC3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ナビタイトル設定
    self.navigationItem.title = @"Tab1VC3";
    
    // ナビボタン設定
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Modal" style:UIBarButtonItemStyleDone target:self action:@selector(presentModalView)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // スプラッシュ非表示
    [[SplashView sharedManager] hideSplash:YES];
}


// 画面遷移
- (void)presentModalView {
    [self performSegueWithIdentifier:@"ToTab1MVC1" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
