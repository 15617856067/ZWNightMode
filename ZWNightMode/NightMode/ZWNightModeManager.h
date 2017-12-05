//
//  ZWNightModeManager.h
//  ZWNightMode
//
//  Created by ziwen on 28/11/2017.
//  Copyright © 2017年 ABC.com. All rights reserved.
//

#import <Foundation/Foundation.h>
//////////////////////////////////////////////
//       夜间模式管理类
//////////////////////////////////////////////
@interface ZWNightModeManager : NSObject
+ (instancetype)shareInstance;
/*
 *  是否置顶
 */
- (BOOL)isNightMode;
/*
 *  开启夜间模式
 *  param animated 是否显示动画
 */
- (void)openNightMode:(BOOL)animated;
/*
 *  关闭夜间模式
 *  param animated 是否显示动画
 */
- (void)closeNightMode:(BOOL)animated;
@end
