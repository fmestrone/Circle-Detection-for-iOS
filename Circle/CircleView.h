//
//  CircleView.h
//  Circle
//
//  Created by jeff on 4/28/09.
//  Copyright 2009 Jeff LaMarche. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCircleClosureAngleVariance     45.0
#define kCircleClosureDistanceVariance  50.0
#define kMaximumCircleTime              2.0
#define kRadiusVariancePercent          25.0
#define kOverlapTolerance               3
@interface CircleView : UIView {
    NSArray *points;
    CGPoint center;
    CGFloat radius;
    UILabel *label;
}
@property (nonatomic, retain) IBOutlet UILabel * label;
- (void)eraseText;
@end
