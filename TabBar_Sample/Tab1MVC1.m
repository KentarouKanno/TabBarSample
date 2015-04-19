//
//  ModalVC1.m
//  TabBarSmple
//
//  Created by KentarOu on 2015/04/18.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import "Tab1MVC1.h"

@implementation Tab1MVC1


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ナビタイトル設定
    self.navigationItem.title = @"Tab1MVC1";
    
    // ナビボタン設定
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(closeModal)];
    self.navigationItem.leftBarButtonItem = leftButton;
}


// モーダルを閉じる
- (void)closeModal {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
