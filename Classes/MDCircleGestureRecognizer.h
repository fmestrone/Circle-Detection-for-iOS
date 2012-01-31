//
//  MDCircleGestureRecognizer.h
//  Circle
//
//  Created by Federico Mestrone on 28/01/2012.
//  Copyright (c) 2012 Moodsdesign Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

CGFloat distanceBetweenPoints (CGPoint first, CGPoint second);
CGFloat angleBetweenPoints(CGPoint first, CGPoint second);
CGFloat angleBetweenLines(CGPoint line1Start, CGPoint line1End, CGPoint line2Start, CGPoint lin2End);

@interface MDCircleGestureRecognizer : UIGestureRecognizer
{
    NSMutableArray *points_;
    CGPoint firstTouch_;
    NSTimeInterval firstTouchTime_;
}

@property CGFloat circleClosureAngleVariance;
@property CGFloat circleClosureDistanceVariance;
@property CGFloat maximumCircleTime;
@property CGFloat radiusVariancePercent;
@property NSInteger overlapTolerance;

@property (readonly) CGPoint center;
@property (readonly) CGFloat radius;
@property (readonly) NSArray *points;

@end
