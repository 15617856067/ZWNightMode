//
//  ZWMainTabBarViewController.m
//  ZWNightMode
//
//  Created by ziwen on 2017/12/6.
//  Copyright © 2017年 ABC.com. All rights reserved.
//

#import "ZWMainTabBarViewController.h"
#import "ZWConversationViewController.h"
#import "ZWAdressBookViewController.h"
#import "ZWDiscoveryViewController.h"
#import "ZWPersonViewController.h"
#import "UIColor+BIMHex.h"
@interface ZWMainTabBarViewController ()

@end

@implementation ZWMainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpController];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpController {
    NSArray *titleArray = @[@"消息",
                            @"通讯录",
                            @"发现",
                            @"我"];
    
    NSArray *imageArray = @[@"tabbar_mainframe_25x23_",
                            @"tabbar_contacts_27x23_",
                            @"tabbar_discover_23x23_",
                            @"tabbar_me_23x23_"];
    
    NSArray *selectImageArray = @[@"tabbar_mainframeHL_25x23_",
                                  @"tabbar_contactsHL_27x23_",
                                  @"tabbar_discoverHL_23x23_",
                                  @"tabbar_meHL_23x23_"];
    
    ZWConversationViewController *conversationsCtrl = [[ZWConversationViewController alloc] init];
    ZWAdressBookViewController *contactsCtrl = [[ZWAdressBookViewController alloc] init];
    ZWDiscoveryViewController *discoverCtrl = [[ZWDiscoveryViewController alloc] init];
    ZWPersonViewController *personCtrl = [[ZWPersonViewController alloc] init];
    NSArray *ctrlArray = @[conversationsCtrl, contactsCtrl, discoverCtrl, personCtrl];
    
    for (NSInteger i = 0; i< titleArray.count; i++) {
        [self setControllersWithController:ctrlArray[i] title:titleArray[i] imageName:imageArray[i] selectImageName:selectImageArray[i]];
    }
}

- (void)setControllersWithController:(UIViewController *)ctrl title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName{
    ctrl.title = title;
    ctrl.tabBarItem.title = title;
    ctrl.tabBarItem.image = [UIImage imageNamed:imageName];
    ctrl.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    ctrl.view.backgroundColor = [UIColor bim_RGBColorWithHexString:@"#f4f4f4"];
    
    [ctrl.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor bim_RGBColorWithHexString:@"#09bb07"]} forState:UIControlStateSelected];
    [ctrl.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor bim_RGBColorWithHexString:@"#888888"]} forState:UIControlStateNormal];
    
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:ctrl];
    //   navCtrl.navigationBar.translucent = NO;
    //    [navCtrl.navigationBar setBackgroundImage:[self createImageWithColor:[UIColor bim_RGBColorWithHexString:@"0x3b3a40"]] forBarMetrics:UIBarMetricsDefault];
    
    [self addChildViewController:navCtrl];
}

#pragma mark - 辅助方法，ui给图后去掉


- (UIViewController *)childViewControllerForStatusBarStyle{
    
    return [self.childViewControllers objectAtIndex:0];
}

@end
