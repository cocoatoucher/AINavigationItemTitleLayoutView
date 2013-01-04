//
//  AISampleNavItemLayoutView.m
//  AINavigationItemTitleLayoutView
//
//  Created by CocoaToucher on 12/18/12.
//  Copyright (c) 2012 CocoaToucher. All rights reserved.
//

#import "AISampleNavItemLayoutView.h"
#import "AINavigationItemTitleLayoutView_Protected.h"

@interface AISampleNavItemLayoutView ()

@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *subtitleLabel;
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic) CGFloat titleLabelWidth;
@property(nonatomic) CGFloat subtitleLabelWidth;
@property(nonatomic) CGFloat maxLabelWidth;

@end

@implementation AISampleNavItemLayoutView

- (void)dealloc {
#if !(__has_feature(objc_arc))
	[_titleLabel release];
	_titleLabel = nil;
	[_subtitleLabel release];
	_subtitleLabel = nil;
	[_imageView release];
	_imageView = nil;
	[_title release];
	_title = nil;
	[_subtitle release];
	_subtitle = nil;
	[_image release];
	_image = nil;
	
	[super dealloc];
#endif
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self setBackgroundColor:[UIColor clearColor]];
		
		_titleLabel = [[UILabel alloc] init];
		
		[_titleLabel setNumberOfLines:1];
		[_titleLabel setBackgroundColor:[UIColor clearColor]];
		[_titleLabel setAdjustsFontSizeToFitWidth:YES];
		[_titleLabel setTextAlignment:UITextAlignmentCenter];
		[_titleLabel setTextColor:[UIColor whiteColor]];
		[_titleLabel setLineBreakMode:UILineBreakModeMiddleTruncation];
		[_titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
		[_titleLabel setMinimumFontSize:10.0f];
		
		[self addSubview:_titleLabel];
		
		_subtitleLabel = [[UILabel alloc] init];
		
		[_subtitleLabel setNumberOfLines:1];
		[_subtitleLabel setBackgroundColor:[UIColor clearColor]];
		[_subtitleLabel setAdjustsFontSizeToFitWidth:YES];
		[_subtitleLabel setTextAlignment:UITextAlignmentCenter];
		[_subtitleLabel setTextColor:[UIColor redColor]];
		[_subtitleLabel setLineBreakMode:UILineBreakModeMiddleTruncation];
		[_subtitleLabel setFont:[UIFont systemFontOfSize:12.0f]];
		[_subtitleLabel setMinimumFontSize:10.0f];
		
		[self addSubview:_subtitleLabel];
		
		_imageView = [[UIImageView alloc] init];
		[self addSubview:_imageView];
    }
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	if (_subtitle.length) {
		CGRect titleRect = self.titleLabel.frame;
		titleRect.size.height = floorf(self.bounds.size.height / 2.0f);
		[self.titleLabel setFrame:titleRect];
		
		CGRect subtitleRect = self.subtitleLabel.frame;
		subtitleRect.origin.y = titleRect.size.height;
		subtitleRect.size.height = self.bounds.size.height - titleRect.size.height;
		[self.subtitleLabel setFrame:subtitleRect];
	} else {
		CGRect titleRect = self.titleLabel.frame;
		titleRect.size.height = self.bounds.size.height;
		[self.titleLabel setFrame:titleRect];
	}
}

- (void)layoutTitleViews {
	[super layoutView:self.titleLabel forMaxWidth:_maxLabelWidth];
	[super layoutView:self.subtitleLabel forMaxWidth:_maxLabelWidth];
	
	[super layoutViewToCenter:self.imageView];
}

- (void)setTitle:(NSString *)inTitle {
	if (_title != inTitle) {
#if !(__has_feature(objc_arc))
		[_title release];
		_title = [inTitle retain];
#else
		_title = inTitle;
#endif
	}
	
	[self.titleLabel setText:_title];
	self.titleLabelWidth = [_title sizeWithFont:self.titleLabel.font].width;
	
	[self setNeedsLayout];
}

- (void)setSubtitle:(NSString *)inSubtitle {
	if (_subtitle != inSubtitle) {
#if !(__has_feature(objc_arc))
		[_subtitle release];
		_subtitle = [inSubtitle retain];
#else
		_subtitle = inSubtitle;
#endif
	}
	
	[self.subtitleLabel setText:_subtitle];
	
	self.subtitleLabelWidth = [_subtitle sizeWithFont:self.subtitleLabel.font].width;
	
	[self setNeedsLayout];
}

- (void)setImage:(UIImage *)inImage {
	if (_image != inImage) {
#if !(__has_feature(objc_arc))
		[_image release];
		_image = [inImage retain];
#else
		_image = inImage;
#endif
	}
	
	[self.imageView setImage:_image];
	
	CGRect imageRect = self.imageView.frame;
	imageRect.size = _image.size;
	self.imageView.frame = imageRect;
	
	[self setNeedsLayout];
}

- (void)setTitleLabelWidth:(CGFloat)titleLabelWidth {
	_titleLabelWidth = titleLabelWidth;
	
	self.maxLabelWidth = MAX(_titleLabelWidth, _subtitleLabelWidth);
}

- (void)setSubtitleLabelWidth:(CGFloat)subtitleLabelWidth {
	_subtitleLabelWidth = subtitleLabelWidth;
	
	self.maxLabelWidth = MAX(_titleLabelWidth, _subtitleLabelWidth);
}

@end
