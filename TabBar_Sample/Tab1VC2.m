//
//  Tab1VC2.m
//  TabBarSmple
//
//  Created by KentarOu on 2015/04/18.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import "Tab1VC2.h"
#import "AppDelegate.h"
#import "SplashView.h"

@interface Tab1VC2 ()

@property (weak, nonatomic) IBOutlet UIButton *screenChangeButton;
@property (nonatomic) NSUserDefaults *defaults;


@end

@implementation Tab1VC2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ナビタイトル設定
    self.navigationItem.title = @"Tab1VC2";
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleDone target:self action:@selector(pushNextView)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    _defaults = [NSUserDefaults standardUserDefaults];
    
    BOOL isVC2 = [_defaults boolForKey:@"VC2"];
    if (!isVC2) {
        [_screenChangeButton setTitle:@"画面を表示する" forState:UIControlStateNormal];
    } else {
        [_screenChangeButton setTitle:@"画面を表示しない" forState:UIControlStateNormal];
    }
}

// 画面遷移
- (void)pushNextView {
    [self performSegueWithIdentifier:@"ToTab1VC3" sender:self];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    if (delegate.isSCreen) {
        [[SplashView sharedManager] hideSplash:YES];
        return;
    }

    BOOL isVC2 = [_defaults boolForKey:@"VC2"];
    if (isVC2) {
        // ToTab1VC3画面へ遷移
        [self pushNextView];
    } else {
        // スプラッシュ非表示
        [[SplashView sharedManager] hideSplash:YES];
    }
    
    delegate.isSCreen = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)screenChange:(id)sender {
    
    BOOL isVC2 = [_defaults boolForKey:@"VC2"];
    if (isVC2) {
        [_defaults setBool:NO forKey:@"VC2"];
        [_screenChangeButton setTitle:@"画面を表示する" forState:UIControlStateNormal];
    } else {
        [_defaults setBool:YES forKey:@"VC2"];
        [_screenChangeButton setTitle:@"画面を表示しない" forState:UIControlStateNormal];
    }
    [_defaults synchronize];
}


@end
