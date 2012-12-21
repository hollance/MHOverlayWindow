
/*
 * A window that appears on top of everything else, including the status bar.
 *
 * To add controls to this window, create a new UIViewController and set it
 * as the window's rootViewController. That will automatically take care of 
 * rotation events, and so on.
 *
 * The MHOverlayWindow object keeps itself (and the root view controller) alive
 * until dismissed.
 */
@interface MHOverlayWindow : UIWindow

- (void)showAnimated:(BOOL)animated;
- (void)dismissAnimated:(BOOL)animated;

@end
