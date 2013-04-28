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

@class MDCircleGestureRecognizer;

@protocol MDCircleGestureFailureDelegate <UIGestureRecognizerDelegate>

- (void) circleGestureFailed:(MDCircleGestureRecognizer *)gr;

@end

typedef enum MDCircleGestureError {
    MDCircleGestureErrorNone,
    MDCircleGestureErrorNotClosed,
    MDCircleGestureErrorTooSlow,
    MDCircleGestureErrorTooShort,
    MDCircleGestureErrorRadiusVarianceTolerance,
    MDCircleGestureErrorOverlapTolerance,
} MDCircleGestureError;

@interface MDCircleGestureRecognizer : UIGestureRecognizer
{
    NSMutableArray *points_;
    CGPoint firstTouch_;
    NSTimeInterval firstTouchTime_;
    MDCircleGestureError error_;
}

@property CGFloat circleClosureAngleVariance;
@property CGFloat circleClosureDistanceVariance;
@property CGFloat maximumCircleTime;
@property CGFloat radiusVariancePercent;
@property NSInteger overlapTolerance;

@property (readonly) CGPoint center;
@property (readonly) CGFloat radius;
@property (readonly) NSArray *points;
@property (readonly) MDCircleGestureError error;

@end
