//
//  AINavigationItemTitleLayoutView.m
//  AINavigationItemTitleLayoutView
//
//  Created by CocoaToucher on 12/18/12.
//  Copyright (c) 2012 CocoaToucher. All rights reserved.
//

#import "AINavigationItemTitleLayoutView.h"
#import "AINavigationItemTitleLayoutView_Protected.h"
#import <QuartzCore/QuartzCore.h>


@interface AINavigationItemTitleLayoutView ()

@end

@implementation AINavigationItemTitleLayoutView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
	}
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	if (self.layer.opacity != 1.0f) {
		return;
	}
	
	[self layoutTitleViews];
}

- (void)setFrame:(CGRect)frame {
	[super setFrame:frame];
	
	[self setNeedsLayout];
}

- (UINavigationBar *)navigationBarForView:(UIView *)inView {
	if ([inView.superview isKindOfClass:[UINavigationBar class]])
		return (UINavigationBar *)inView.superview;
	else if (inView.superview == nil) {
		return nil;
	} else return [self navigationBarForView:inView.superview];
}

- (void)layoutTitleViews {
	//super does nothing
}

- (void)layoutView:(UIView *)subview forMaxWidth:(CGFloat)inMaxWidth {
	CGRect viewRect = subview.frame;
	
	UINavigationBar *navBar = [self navigationBarForView:self];
	
	CGFloat convertedX = [self convertPoint:CGPointMake(floorf((navBar.frame.size.width - inMaxWidth) / 2.0f), 0.0f)
								   fromView:navBar].x;
	
	if (convertedX + inMaxWidth <= self.bounds.size.width) {
		viewRect.origin.x = convertedX;
		viewRect.size.width = inMaxWidth;
	} else {
		viewRect.origin.x  = 0.0f;
		viewRect.size.width = self.bounds.size.width;
	}
	
	subview.frame = viewRect;
}

- (void)layoutViewToCenter:(UIView *)subview {
	CGRect newRect = subview.frame;
	
	UINavigationBar *navBar = [self navigationBarForView:self];
	CGFloat convertedX = [self convertPoint:CGPointMake(floorf((navBar.frame.size.width - newRect.size.width) / 2.0f), 0.0f)
								   fromView:navBar].x;
	newRect.origin.x = convertedX;
    newRect.origin.y = floorf((self.bounds.size.height - newRect.size.height) / 2.0f);
	[subview setFrame:newRect];
}

@end
