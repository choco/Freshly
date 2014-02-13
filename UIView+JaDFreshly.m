//
//  UIView+JaDFreshly.m
//  Freshly
//
//  Created by Enrico Ghirardi on 25/12/11.
//  Copyright (c) 2011 !cHoco Code. All rights reserved.
//

#import "UIView+JaDFreshly.h"

@implementation UIView (JaDFreshly)

- (void)setFrameOriginX:(CGFloat)x
{
    [self setFrame:CGRectMake(x, self.frame.origin.x, self.frame.size.width, self.frame.size.height)];
}

- (void)setFrameOriginY:(CGFloat)y
{
    [self setFrame:CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height)];
}

- (void)setFrameSizeWidth:(float)width
{
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height)];
}

- (void)setFrameSizeHeight:(float)height
{
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height)];
}

@end
