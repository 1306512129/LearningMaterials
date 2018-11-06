//
//  BasisYYLableCalculationHeightAndWidth.h
//  my
//
//  Created by 税鸽飞腾 on 2018/8/10.
//  Copyright © 2018年 LWJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYText.h>
@interface BasisYYLableCalculationHeightAndWidth : NSObject
/**
 *  @param message lable.text
 *  @param lable (YYLabel *)label
 *  @return lable的高度
 */
+ (CGFloat)getLableHeight:(NSString *)message yyLabel:(YYLabel *)lable lineSpacing:(CGFloat)lineSpace stringFont:(UIFont *)font;
/**
 *  @param message lable.text
 *  @param lable (YYLabel *)label
 *  @return lable的宽度
 */
+ (CGFloat)getLableWidth:(NSString *)message yyLabel:(YYLabel *)lable stringFont:(UIFont *)font;
@end
