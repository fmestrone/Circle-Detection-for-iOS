//
//  CircleSettingsController.h
//  Circle
//
//  Created by Federico Mestrone on 27/04/2013.
//  Copyright (c) 2013 Moodsdesign Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDCircleGestureRecognizer.h"

@interface CircleSettingsController : UIViewController
{
    IBOutlet UILabel *settingsCnxToleranceLabel;
    IBOutlet UISlider *settingsCnxToleranceSlider;
    IBOutlet UILabel *settingsAngleToleranceLabel;
    IBOutlet UISlider *settingsAngleToleranceSlider;
    IBOutlet UILabel *settingsMinPointsLabel;
    IBOutlet UISlider *settingsMinPointsSlider;
    IBOutlet UILabel *settingsMaxTimeLabel;
    IBOutlet UISlider *settingsMaxTimeSlider;
    IBOutlet UILabel *settingsRadiusLabel;
    IBOutlet UISlider *settingsRadiusSlider;
    IBOutlet UILabel *settingsOverlapLabel;
    IBOutlet UISlider *settingsOverlapSlider;
    IBOutlet UIButton *button;
}

- (IBAction)sliderValueChanged:(UISlider *)sender;
- (IBAction)dismiss:(id)sender;

@property (nonatomic, assign) MDCircleGestureRecognizer *gr;

@end
