//
//  ZWNightModeManager.m
//  ZWNightMode
//
//  Created by ziwen on 28/11/2017.
//  Copyright © 2017年 ABC.com. All rights reserved.
//

#import "ZWNightModeManager.h"
#import "ZWNightModeWindow.h"

#define kBIMNightMode @"kBimNightMode"
@interface ZWNightModeManager ()
@property (nonatomic, strong)ZWNightModeWindow *nightModeWindow;
@end

@implementation ZWNightModeManager

+ (instancetype)shareInstance {
    static ZWNightModeManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        _nightModeWindow = nil;
    }
    return self;
}

- (BOOL)isNightMode {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kBIMNightMode];
}

- (void)setNightMode:(BOOL)nightMode {
    [[NSUserDefaults standardUserDefaults] setBool:nightMode forKey:kBIMNightMode];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)openNightMode:(BOOL)animited {
    //has nightModeWindow，can not add a nightModeWindow again
    if (self.nightModeWindow) {
        return;
    }

    //can open , init a nightModeWindow
    self.nightModeWindow = [[ZWNightModeWindow alloc] init];

    if (animited) {
        self.nightModeWindow.alpha = 0;
        self.nightModeWindow.hidden = NO;
        [UIView animateWithDuration:0.25 animations:^{
            self.nightModeWindow.alpha = 1.0;
        }];
    } else {
        self.nightModeWindow.hidden = NO;
    }
    //update nightMode
    [self setNightMode:YES];
}

- (void)closeNightMode:(BOOL)animited {
    //current is not nightMode
        [self setNightMode:NO];
    if (nil == self.nightModeWindow) {
        return;
    }

    if (animited) {
        [UIView animateWithDuration:0.25 animations:^{
            self.nightModeWindow.alpha = 0;
        } completion:^(BOOL finished) {
            self.nightModeWindow.hidden = YES;
            self.nightModeWindow = nil;
        }];
    } else {
        self.nightModeWindow.hidden = YES;
        self.nightModeWindow = nil;
    }

}
@end
