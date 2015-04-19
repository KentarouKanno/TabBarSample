//
//  Tab4MVC1.m
//  TabBarSmple
//
//  Created by KentarOu on 2015/04/18.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import "Tab4MVC1.h"

@interface Tab4MVC1 ()

@end

@implementation Tab4MVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ナビタイトル設定
    self.navigationItem.title = @"Tab4MVC1";
    
    // ナビボタン設定
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(closeModal)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleDone target:self action:@selector(pushNextView)];
    self.navigationItem.rightBarButtonItem = rightButton;
}


// モーダルを閉じる
- (void)closeModal {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

// 画面遷移
- (void)pushNextView {
    [self performSegueWithIdentifier:@"ToTab4MVC2" sender:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
