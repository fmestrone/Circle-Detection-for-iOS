//
//  CircleViewController.m
//  Circle
//
//  Created by jeff on 4/28/09.
//  Copyright Jeff LaMarche 2009. All rights reserved.
//

#import "CircleViewController.h"
#import "MDCircleGestureRecognizer.h"

@implementation CircleViewController

- (void)openSettings:(id)sender
{
    if ( settingsController == nil ) {
        //settingsController = [[ColorPickerViewController alloc] initWithStyle:UITableViewStylePlain];
    }
    
    if ( popover == nil) {
        //The color picker popover is not showing. Show it.
        popover = [[UIPopoverController alloc] initWithContentViewController:settingsController];
        [popover presentPopoverFromBarButtonItem:(UIBarButtonItem *)sender permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    } else {
        //The color picker popover is showing. Hide it.
        [popover dismissPopoverAnimated:YES];
        popover = nil;
    }
}

- (void)viewDidLoad
{
    MDCircleGestureRecognizer *gr = [[MDCircleGestureRecognizer alloc] init];
    [gr addTarget:self.view action:@selector(handleGesture:)];
    [self.view addGestureRecognizer:gr];
    gr.delegate = (id<MDCircleGestureFailureDelegate>)self.view;
    [gr release];
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
