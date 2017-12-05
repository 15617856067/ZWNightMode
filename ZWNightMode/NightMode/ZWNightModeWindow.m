//
//  ZWNightModeWindow.m
//  ZWNightMode
//
//  Created by ziwen on 28/11/2017.
//  Copyright © 2017年 ABC.com. All rights reserved.
//

#import "ZWNightModeWindow.h"
#import "ZWNightModeViewController.h"

@implementation ZWNightModeWindow

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setFrame:CGRectZero];
        [self afterinit];
    }
    return self;

}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectZero];
    if (self) {

        [self afterinit];
    }
    return self;
}

//need set CGRectZero
- (void)setFrame:(CGRect)frame {
    [super setFrame:CGRectZero];
}

- (void)afterinit {
    //windowLevel should  UIWindowLevelNormal + 1
    //become iOS 8 level for keyboard is UIWindowLevelNormal + 1,it can not big than it but must big than UIWindowLevelNormal
    // must use integer for iOS 7
    self.windowLevel = UIWindowLevelNormal + 1;
    self.layer.masksToBounds = NO;
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = NO;

    ZWNightModeViewController *vc = [[ZWNightModeViewController alloc] init];
    self.rootViewController = vc;
}

- (BOOL)isKeyWindow {
    return NO; //永远不是keyWindow
}

- (void)becomeKeyWindow {
    [[UIApplication sharedApplication].delegate.window makeKeyWindow];//当前window不接收事件， 成为主window
}

//handle tap event
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return NO;
}



@end
