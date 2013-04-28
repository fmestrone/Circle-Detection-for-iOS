//
//  CircleViewController.m
//  Circle
//
//  Created by jeff on 4/28/09.
//  Copyright Jeff LaMarche 2009. All rights reserved.
//

#import "CircleViewController.h"
#import "MDCircleGestureRecognizer.h"
#import "CircleSettingsController.h"

@implementation CircleViewController

- (void)openSettings:(id)sender
{
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) {
        if ( popover == nil) {
            //The color picker popover is not showing. Show it.
            popover = [[UIPopoverController alloc] initWithContentViewController:settingsController];
            popover.delegate = self;
            [popover presentPopoverFromRect:((UIView *)sender).frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        } else {
            //The color picker popover is showing. Hide it.
            [popover dismissPopoverAnimated:YES];
        }
    } else {
        settingsController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:settingsController animated:YES completion:NULL];
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    popover = nil;
    [popoverController release];
}

- (void)viewDidLoad
{
    MDCircleGestureRecognizer *gr = [[MDCircleGestureRecognizer alloc] init];
    [gr addTarget:self.view action:@selector(handleGesture:)];
    [self.view addGestureRecognizer:gr];
    gr.delegate = (id<MDCircleGestureFailureDelegate>)self.view;
    [gr release];
    if ( settingsController == nil ) {
        settingsController = [[CircleSettingsController alloc] initWithNibName:nil bundle:nil];
        settingsController.gr = gr;
        settingsController.contentSizeForViewInPopover = CGSizeMake(320.0, 430.0);
    }
}

- (void)viewDidUnload 
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}
- (void)dealloc {
    [super dealloc];
}

@end
