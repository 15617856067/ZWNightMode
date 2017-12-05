//
//  ZWConversationViewController.m
//  ZWNightMode
//
//  Created by ziwen on 2017/12/6.
//  Copyright © 2017年 ABC.com. All rights reserved.
//

#import "ZWConversationViewController.h"
#import "ZWNightModeManager.h"
@interface ZWConversationViewController ()
@property (nonatomic, strong)UISwitch *switchView;
@end

@implementation ZWConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    
    _switchView = [UISwitch new];
    _switchView.frame =CGRectMake(50, 100, 40, 40);
    _switchView.on = [[ZWNightModeManager shareInstance] isNightMode];
    [_switchView addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_switchView];
}

- (void)switchClick:(UISwitch *)sender {
    if (sender.isOn) {
        [[ZWNightModeManager shareInstance] openNightMode:YES];
    }else {
        [[ZWNightModeManager shareInstance] closeNightMode:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
