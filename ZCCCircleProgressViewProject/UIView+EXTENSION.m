//
//  UIView+EXTENSION.m
//  01 - sinaweibo
//
//  Created by 梁剑义 on 2016/12/7.
//  Copyright © 2016年 梁剑义. All rights reserved.
//

#import "UIView+EXTENSION.h"

@implementation UIView (EXTENSION)

- (void)setSize:(CGSize)size
{
    self.frame = (CGRect){{self.frame.origin.x, self.frame.origin.y}, size};
}

- (void)setOrigin:(CGPoint)origin
{
    self.frame = (CGRect){origin, {self.frame.size.width, self.frame.size.height}};
}

- (void)setX:(CGFloat)x
{
    self.frame = (CGRect){{x, self.frame.origin.y}, self.frame.size};
}

- (void)setY:(CGFloat)y
{
    self.frame = (CGRect){{self.frame.origin.x, y}, self.frame.size};
}

- (void)setWidth:(CGFloat)width
{
    self.frame = (CGRect){self.frame.origin, {width, self.frame.size.height}};
}

- (void)setHeight:(CGFloat)height
{
    self.frame = (CGRect){self.frame.origin, {self.frame.size.width, height}};
}

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGSize)size
{
    return self.frame.size;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return  self.frame.origin.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)centerY
{
    return self.center.y;
}

@end
