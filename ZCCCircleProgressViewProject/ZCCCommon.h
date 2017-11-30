//
//  ZCCCommon.h
//  ApieceZCC
//
//  Created by qx-005 on 2017/4/21.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+EXTENSION.h"

#define ZCCRCOLOR [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#define ZCCRGBColor(a,b,c,al) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:al]

#define DefaultColor245Gray ZCCRGBColor(245, 245, 245, 1.0)

#define DefaultColor30Gray ZCCRGBColor(30, 30, 30, 1.0)

#define DefaultColor68Gray ZCCRGBColor(68, 68, 68, 1.0)

#define DefaultColor180Gray ZCCRGBColor(180, 180, 180, 1.0)

#define DefaultGrayColor(a) ZCCRGBColor(a,a,a,1.0)



#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width

#define SCREENCONTENTHEIGHT [UIScreen mainScreen].bounds.size.height - 64 - 49

#define F(number) [UIFont systemFontOfSize:number]

#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define ZCCFontPingFangSCLight(a) [UIFont fontWithName:@"PingFangSC-Light" size:a]

#define ZCCFontPingFangSCBold(a) [UIFont fontWithName:@"PingFangSC-Medium" size:a]

#define ZCCFontPingFangSCRegular(a) [UIFont fontWithName:@"PingFangSC-Regular" size:a]


@interface ZCCCommon : NSObject


@end
