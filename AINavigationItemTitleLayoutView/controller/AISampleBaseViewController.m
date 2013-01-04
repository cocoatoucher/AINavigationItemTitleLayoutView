//
//  AISampleBaseViewController.m
//  AINavigationItemTitleLayoutView
//
//  Created by CocoaToucher on 12/18/12.
//  Copyright (c) 2012 CocoaToucher. All rights reserved.
//

#import "AISampleBaseViewController.h"
#import "AISampleNavItemLayoutView.h"

@interface AISampleBaseViewController ()

@end

@implementation AISampleBaseViewController

- (void)dealloc {
#if !(__has_feature(objc_arc))
	[_subtitle release];
	_subtitle = nil;
	[_titleImage release];
	_titleImage = nil;
	
	[super dealloc];
#endif
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	AISampleNavItemLayoutView *tLayoutView = [[AISampleNavItemLayoutView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
	self.navigationItem.titleView = tLayoutView;
#if !(__has_feature(objc_arc))
	[tLayoutView release];
#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTitle:(NSString *)title {
	[super setTitle:title];
	
	AISampleNavItemLayoutView *titleView = (AISampleNavItemLayoutView *)self.navigationItem.titleView;
	titleView.title = title;
}

- (void)setSubtitle:(NSString *)subtitle {
	if (_subtitle != subtitle) {
#if !(__has_feature(objc_arc))
		[_subtitle release];
		_subtitle = [subtitle retain];
#else
		_subtitle = subtitle;
#endif
	}
	
	AISampleNavItemLayoutView *titleView = (AISampleNavItemLayoutView *)self.navigationItem.titleView;
	titleView.subtitle = _subtitle;
}

- (void)setTitleImage:(UIImage *)titleImage {
	if (_titleImage != titleImage) {
#if !(__has_feature(objc_arc))
		[_titleImage release];
		_titleImage = [titleImage retain];
#else
		_titleImage = titleImage;
#endif
	}
	
	AISampleNavItemLayoutView *titleView = (AISampleNavItemLayoutView *)self.navigationItem.titleView;
	titleView.image = titleImage;
}

@end
