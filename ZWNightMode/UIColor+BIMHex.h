//
//  UIColor+Hex.h
//  ZWNightMode
//
//  Created by ziwen on 2017/12/6.
//  Copyright © 2017年 ABC.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SepColor      [UIColor colorWithHexString:@"#e8e8e8"]
// 颜色 r,g,b
#define BIM_RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
// 颜色 r,g,b,a
#define BIM_RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
// 随机颜色
#define BIM_RANDOM_COLOR [UIColor colorWithRed:arc4random_uniform(256)/255.0f green:arc4random_uniform(256)/255.0f blue:arc4random_uniform(256)/255.0f alpha:1.0f]

@interface UIColor (BIMHex)
#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor
/**
 *
 *
 *  @param color 十六进制颜色字符串,
 *   使用 0x123456 0X123456 #123456 ffffff 四种格式都可以
 *
 *  @return
 */
+ (UIColor *)bim_RGBColorWithHexString:(NSString *)color;

/**
 *
 *  @param rgb 如：ox56789A
 *
 *  @return 颜色值
 */
+ (UIColor *)bim_RGBColorWithHexRGB:(NSInteger )rgb;

/**
 *
 *  @param r     红色：0-255（10）
 *  @param g     绿色：0-255（10）
 *  @param b     蓝色：0-255（10）
 *  @param alpha 透明度：0-1.0
 *
 *  @return 颜色值
 */
+ (UIColor*)bim_RGBColorwithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b alpha:(CGFloat)alpha;
@end
