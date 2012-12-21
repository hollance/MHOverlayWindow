
#import "MHOverlayWindow.h"

@implementation MHOverlayWindow
{
	MHOverlayWindow *_keepAlive;
	UIWindow *_previousKeyWindow;
}

- (id)initWithFrame:(CGRect)frame
{
	if ((self = [super initWithFrame:frame]))
	{
		self.windowLevel = UIWindowLevelStatusBar + 1.0f;
		self.userInteractionEnabled = YES;
		self.backgroundColor = [UIColor clearColor];
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	}
	return self;
}

- (UIWindow *)findKeyWindow
{
	for (UIWindow *window in [UIApplication sharedApplication].windows)
	{
		if (window.windowLevel == UIWindowLevelNormal && ![[window class] isEqual:[self class]])
			return window;
	}
	return nil;
}

- (void)showAnimated:(BOOL)animated
{
	_keepAlive = self;

	if (![self isKeyWindow])
	{
		_previousKeyWindow = [self findKeyWindow];
		[self makeKeyAndVisible];
	}

	if (animated)
	{
		self.alpha = 0.0f;
		[UIView animateWithDuration:0.2 animations:^
		{
			self.alpha = 1.0f;
		}];
	}
}

- (void)dismissAnimated:(BOOL)animated
{
	if (animated)
	{
		[UIView animateWithDuration:0.2 animations:^
		{
			self.alpha = 0.0f;
		}
		completion:^(BOOL finished)
		{
			[self dismissDidComplete];
		}];
	}
	else
	{
		[self dismissDidComplete];
	}
}

- (void)dismissDidComplete
{
	[_previousKeyWindow makeKeyWindow];
	_keepAlive = nil;
}

- (void)drawRect:(CGRect)rect 
{
	CGContextRef context = UIGraphicsGetCurrentContext();

	const CGFloat components[8] = { 0.0f, 0.0f, 0.0f, 0.2f, 0.0f, 0.0f, 0.0f, 0.55f };
	const CGFloat locations[2] = { 0.0f, 1.0f };

	CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
	CGGradientRef gradient = CGGradientCreateWithColorComponents(space, components, locations, 2);
	CGColorSpaceRelease(space);

	CGPoint center = CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.height/2.0f);
	float radius = MIN(self.bounds.size.width, self.bounds.size.height);
	CGContextDrawRadialGradient(context, gradient, center, 0, center, radius, kCGGradientDrawsAfterEndLocation);
	CGGradientRelease(gradient);
}

@end
