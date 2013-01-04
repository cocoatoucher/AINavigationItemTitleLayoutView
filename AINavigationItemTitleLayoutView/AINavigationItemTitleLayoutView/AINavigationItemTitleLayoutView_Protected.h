//
//  AINavigationItemTitleLayoutView_Protected.h
//  AINavigationItemTitleLayoutView
//
//  Created by CocoaToucher on 1/4/13.
//  Copyright (c) 2013 CocoaToucher. All rights reserved.
//

#import "AINavigationItemTitleLayoutView.h"

@interface AINavigationItemTitleLayoutView ()

/**
 AINavigationItemTitleLayoutView calls this method within its layoutSubviews method
 when it is appropriate to do a layout, that is while the UINavigationBar is not in the middle of an animation
 Override this method in your subclasses to apply one of the two available layout methods below, or you can apply your own custom layout methods
 Super does nothing within this method
 */
- (void)layoutTitleViews;

/**
 This method first tries to horizontally center the subview to UINavigationBar
 - If given inMaxWidth exceeds the layout view's (that is AINavigationItemTitleLayoutView) width, subview's width is clamped to layout view's width and then horizontally centered to layoutView instead of UINavigationBar
 - Otherwise subview's width is set to inMaxWidth and it is centered to UINavigationBar
 @param subview to apply the layout
 @param inMaxWidth, max width that the subview can have
 */
- (void)layoutView:(UIView *)subview forMaxWidth:(CGFloat)inMaxWidth;

/**
 This method centers the subview to UINavigationBar's width without altering subview's width
 Use this method if you don't want to deal with providing a maximum width and know that the width of the subview won't exceed the layout view's width
 @param subview to apply the layout
 */
- (void)layoutViewToCenter:(UIView *)subview;

@end
