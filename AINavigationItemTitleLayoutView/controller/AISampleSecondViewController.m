//
//  AISampleSecondViewController.m
//  AINavigationItemTitleLayoutView
//
//  Created by CocoaToucher on 12/18/12.
//  Copyright (c) 2012 CocoaToucher. All rights reserved.
//

#import "AISampleSecondViewController.h"
#import "AISampleThirdViewController.h"

@interface AISampleSecondViewController ()

@end

@implementation AISampleSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.title = NSLocalizedString(@"Second one", nil);
	self.subtitle = NSLocalizedString(@"some very long subtitle", nil);
	UIBarButtonItem *btnBack = [[UIBarButtonItem alloc] initWithTitle:@"<"
																style:UIBarButtonItemStyleBordered
															   target:nil
															   action:nil];
	self.navigationItem.backBarButtonItem = btnBack;
#if !(__has_feature(objc_arc))
	[btnBack release];
#endif
	
	UIBarButtonItem *btnRight = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Go to next", nil)
															  style:UIBarButtonItemStyleBordered
															 target:self
															 action:@selector(pushNextVC:)];
	[self.navigationItem setRightBarButtonItem:btnRight];
#if !(__has_feature(objc_arc))
	[btnRight release];
#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushNextVC:(id)sender {
	AISampleThirdViewController *controller = [[AISampleThirdViewController alloc] init];
	[self.navigationController pushViewController:controller animated:YES];
#if !(__has_feature(objc_arc))
	[controller release];
#endif
}

@end
