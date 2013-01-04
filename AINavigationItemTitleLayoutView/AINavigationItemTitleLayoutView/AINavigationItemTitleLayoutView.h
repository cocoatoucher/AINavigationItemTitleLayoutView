//
//  AINavigationItemTitleLayoutView.h
//  AINavigationItemTitleLayoutView
//
//  Created by CocoaToucher on 12/18/12.
//  Copyright (c) 2012 CocoaToucher. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 This class is intended to be a super class for your navigation item's custom title view
 UINavigationBar internally alters title view space according to its bar buttons' width and during push/pop view controller animations
 AINavigationItemTitleLayoutView correctly handles layout of its subviews according to changing space provided by a UINavigationBar
 The basic idea is to keep subviews horizontally centered to UINavigationBar where possible
 By using this class you don't have to write your own custom UINavigationBar to be able to freely layout its subviews
 */
@interface AINavigationItemTitleLayoutView : UIView

@end
