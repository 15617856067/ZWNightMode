//
//  ZWNightModeViewController.m
//  ZWNightMode
//
//  Created by ziwen on 28/11/2017.
//  Copyright © 2017年 ABC.com. All rights reserved.
//

#import "ZWNightModeViewController.h"

#define kZWAlpha 0.6
@interface ZWNightModeViewController ()

@end

@implementation ZWNightModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.userInteractionEnabled = NO;
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat maxSize = screenSize.width > screenSize.height ? screenSize.width : screenSize.height;
    maxSize = maxSize * 2;
    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake((screenSize.width-maxSize)*0.5,
                                                                (screenSize.height-maxSize)*0.5,
                                                                maxSize,
                                                                maxSize)];
    maskView.userInteractionEnabled = NO;
    maskView.backgroundColor = [UIColor colorWithWhite:0 alpha:kZWAlpha];
    [self.view addSubview:maskView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
