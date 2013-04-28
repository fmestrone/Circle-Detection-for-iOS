//
//  CircleSettingsController.m
//  Circle
//
//  Created by Federico Mestrone on 27/04/2013.
//  Copyright (c) 2013 Moodsdesign Ltd. All rights reserved.
//

#import "CircleSettingsController.h"

#define tagSettingsCnxTolerance         1
#define tagSettingsAngleTolerance       6
#define tagSettingsMinPoints            2
#define tagSettingsMaxTime              3
#define tagSettingsRadius               4
#define tagSettingsOverlap              5

@interface CircleSettingsController ()

@end

@implementation CircleSettingsController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    button.hidden = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

- (void)updateLabels
{
    settingsAngleToleranceLabel.text = [NSString stringWithFormat:@"%0.1f", self.gr.circleClosureAngleVariance];
    settingsCnxToleranceLabel.text = [NSString stringWithFormat:@"%0.1f", self.gr.circleClosureDistanceVariance];
    settingsMaxTimeLabel.text = [NSString stringWithFormat:@"%0.1fs", self.gr.maximumCircleTime];
    settingsMinPointsLabel.text = [NSString stringWithFormat:@"%d", self.gr.minimumNumPoints];
    settingsOverlapLabel.text = [NSString stringWithFormat:@"%d", self.gr.overlapTolerance];
    settingsRadiusLabel.text = [NSString stringWithFormat:@"%0.0f%%", self.gr.radiusVariancePercent];
}

- (void)updateSliders
{
    settingsAngleToleranceSlider.value = self.gr.circleClosureAngleVariance;
    settingsCnxToleranceSlider.value = self.gr.circleClosureDistanceVariance;
    settingsMaxTimeSlider.value = self.gr.maximumCircleTime * 10.0;
    settingsMinPointsSlider.value = self.gr.minimumNumPoints;
    settingsOverlapSlider.value = self.gr.overlapTolerance;
    settingsRadiusSlider.value = self.gr.radiusVariancePercent;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self updateLabels];
    [self updateSliders];
}

- (void)dismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)sliderValueChanged:(UISlider *)sender
{
    switch ( sender.tag ) {
        case tagSettingsAngleTolerance:
            self.gr.circleClosureAngleVariance = sender.value;
            break;
        case tagSettingsCnxTolerance:
            self.gr.circleClosureDistanceVariance = sender.value;
            break;
        case tagSettingsMaxTime:
            self.gr.maximumCircleTime = sender.value / 10.0;
            break;
        case tagSettingsMinPoints:
            self.gr.minimumNumPoints = sender.value;
            break;
        case tagSettingsOverlap:
            self.gr.overlapTolerance = sender.value;
            break;
        case tagSettingsRadius:
            self.gr.radiusVariancePercent = sender.value;
            break;
    }
    [self updateLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
