//
//  Tab1VC1.m
//  TabBarSmple
//
//  Created by KentarOu on 2015/04/18.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import "Tab1VC1.h"
#import "Tab1VC2.h"
#import "SplashView.h"

@interface Tab1VC1 ()
@property (weak, nonatomic) IBOutlet UIButton *screenChangeButton;
@property (nonatomic) NSUserDefaults *defaults;

@end

@implementation Tab1VC1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ナビタイトル設定
    self.navigationItem.title = @"Tab1VC1";

    _defaults = [NSUserDefaults standardUserDefaults];
    
    // ボタン状態をセット
    BOOL isVC1 = [_defaults boolForKey:@"VC1"];
    [self setButtonName:!isVC1];
    
    // スプラッシュを表示する
    [[SplashView sharedManager] showSplash];
}

- (void)screenTransition {
    
    _defaults = [NSUserDefaults standardUserDefaults];
    BOOL isVC1 = [_defaults boolForKey:@"VC1"];
    BOOL isVC2 = [_defaults boolForKey:@"VC2"];
    
    if (isVC1 || isVC2) {
        // 更に画面遷移させる
        [self performSegueWithIdentifier:@"ToTab1VC2" sender:self];
    } else {
        // スプラッシュ停止
        [[SplashView sharedManager] hideSplash:YES];
    }
}


- (IBAction)screenChange:(id)sender {
    // ボタン状態変更
    BOOL isVC1 = [_defaults boolForKey:@"VC1"];
    [self setButtonName:isVC1];
}

- (void)setButtonName:(BOOL)isDisplay {
    
    if (isDisplay) {
        [_defaults setBool:NO forKey:@"VC1"];
        [_screenChangeButton setTitle:@"画面を表示する" forState:UIControlStateNormal];
    } else {
        [_defaults setBool:YES forKey:@"VC1"];
        [_screenChangeButton setTitle:@"画面を表示しない" forState:UIControlStateNormal];
    }
    [_defaults synchronize];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
