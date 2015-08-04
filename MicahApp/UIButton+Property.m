//
//  UIButton+Property.m
//  Orca
//
//  Created by Thiago Borges Gonçalves Penna on 8/2/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "UIButton+Property.h"
#import <objc/runtime.h>

@implementation UIButton (ButtonWithImage)

static char UIB_PROPERTY_KEY;

@dynamic customImageView;

-(void)setCustomImageView:(UIImageView *)customImageView
{
    objc_setAssociatedObject(self, &UIB_PROPERTY_KEY, customImageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIImageView*)customImageView
{
    return (UIImageView*)objc_getAssociatedObject(self, &UIB_PROPERTY_KEY);
}

@end

