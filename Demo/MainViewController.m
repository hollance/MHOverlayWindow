
#import "MainViewController.h"
#import "MHOverlayWindow.h"
#import "RootViewController.h"

@implementation MainViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)buttonPressed:(id)sender
{
	NSLog(@"%@", [UIApplication sharedApplication].windows);

	RootViewController *controller = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];

	MHOverlayWindow *overlayWindow = [[MHOverlayWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	overlayWindow.rootViewController = controller;
	[overlayWindow showAnimated:YES];

	//[self performSelector:@selector(hideOverlayWindow:) withObject:overlayWindow afterDelay:3];
}

- (void)hideOverlayWindow:(MHOverlayWindow *)overlayWindow
{
	[overlayWindow dismissAnimated:YES];
}

@end
