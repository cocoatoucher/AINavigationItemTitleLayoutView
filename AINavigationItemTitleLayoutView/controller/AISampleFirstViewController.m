//
//  AISampleFirstViewController.m
//  AINavigationItemTitleLayoutView
//
//  Created by CocoaToucher on 12/18/12.
//  Copyright (c) 2012 CocoaToucher. All rights reserved.
//

#import "AISampleFirstViewController.h"
#import "AISampleSecondViewController.h"

@interface AISampleFirstViewController ()

- (IBAction)barButtonToggleButtonTap:(id)sender;

@end

@implementation AISampleFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.title = NSLocalizedString(@"First view controller with long title", nil);
	self.subtitle = NSLocalizedString(@"and its subtitle", nil);
	
	UIBarButtonItem *btnBack = [[UIBarButtonItem alloc] initWithTitle:@"<"
																style:UIBarButtonItemStyleBordered
															   target:nil
															   action:nil];
	self.navigationItem.backBarButtonItem = btnBack;
#if !(__has_feature(objc_arc))
	[btnBack release];
#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)barButtonToggleButtonTap:(id)sender {
	if (self.navigationItem.rightBarButtonItem != nil) {
		[self.navigationItem setRightBarButtonItem:nil animated:YES];
	} else {
		
		UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithTitle:@"Push Next"
																	style:UIBarButtonItemStyleBordered
																   target:self
																   action:@selector(pushNext:)];
		[self.navigationItem setRightBarButtonItem:barBtn animated:YES];
#if !(__has_feature(objc_arc))
		[barBtn release];
#endif
	}
}

- (void)pushNext:(id)sender {
	AISampleSecondViewController *controller = [[AISampleSecondViewController alloc] init];
	[self.navigationController pushViewController:controller
										 animated:YES];
#if !(__has_feature(objc_arc))
	[controller release];
#endif
}

@end
