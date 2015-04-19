//
//  Tab4VC2.m
//  TabBarSmple
//
//  Created by KentarOu on 2015/04/18.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import "Tab4VC2.h"

@interface Tab4VC2 ()

@end

@implementation Tab4VC2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ナビタイトル設定
    self.navigationItem.title = @"Tab4VC2";
    
    // ナビボタン設定
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Modal" style:UIBarButtonItemStyleDone target:self action:@selector(presentModalView)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

// 画面遷移
- (void)presentModalView {
    [self performSegueWithIdentifier:@"ToTab4MVC1" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
