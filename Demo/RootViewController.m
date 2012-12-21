
#import "RootViewController.h"
#import "MHOverlayWindow.h"

@implementation RootViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)dismissPressed:(id)sender
{
	[(MHOverlayWindow *)self.view.window dismissAnimated:YES];
}

@end
