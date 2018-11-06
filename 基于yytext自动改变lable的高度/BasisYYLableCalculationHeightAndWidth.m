//
//  BasisYYLableCalculationHeightAndWidth.m
//  my
//
//  Created by 税鸽飞腾 on 2018/8/10.
//  Copyright © 2018年 LWJ. All rights reserved.
//

#import "BasisYYLableCalculationHeightAndWidth.h"
#import <YYText.h>
@implementation BasisYYLableCalculationHeightAndWidth

+ (CGFloat)getLableHeight:(NSString *)message yyLabel:(YYLabel *)lable lineSpacing:(CGFloat)lineSpace stringFont:(UIFont *)font;
{
    NSMutableAttributedString *introText = [[NSMutableAttributedString alloc] initWithString:message];
    introText.yy_font = font;
    introText.yy_lineSpacing = lineSpace;//行间距
    lable.attributedText = introText;
    CGSize introSize = CGSizeMake(lable.frame.size.width, CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:introSize text:introText];
    lable.textLayout = layout;
    CGFloat introHeight = layout.textBoundingSize.height;
    return introHeight;
}
+ (CGFloat)getLableWidth:(NSString *)message yyLabel:(YYLabel *)lable stringFont:(UIFont *)font;
{
    NSMutableAttributedString *introText = [[NSMutableAttributedString alloc] initWithString:message];
    introText.yy_font = font;
    lable.attributedText = introText;
    CGSize introSize = CGSizeMake(CGFLOAT_MAX, lable.frame.size.height);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:introSize text:introText];
    lable.textLayout = layout;
    CGFloat introWidth = layout.textBoundingSize.width;
    return introWidth;
}
@end
