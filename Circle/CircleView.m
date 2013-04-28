//
//  CircleView.m
//  Circle
//
//  Created by jeff on 4/28/09.
//  Copyright 2009 Jeff LaMarche. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

@synthesize label;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    if ( [points count] > 1 ) {
        CGContextSetLineWidth(context, 2.0);
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
        
        BOOL first = YES;
        for (NSString *onePointString in points) {
            CGPoint nextPoint = CGPointFromString(onePointString);
            if ( first ) {
                first = NO;
                CGRect dotRect = CGRectMake(nextPoint.x - 3.0, nextPoint.y - 3.0, 5.0, 5.0);
                CGContextAddEllipseInRect(context, dotRect);
                CGContextDrawPath(context, kCGPathFillStroke);
                CGContextMoveToPoint(context, nextPoint.x, nextPoint.y);
            } else {
                CGContextAddLineToPoint(context, nextPoint.x, nextPoint.y);
            }
        }
        CGContextStrokePath(context);
        if ( radius > 0 ) {
            CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
            CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);

            CGRect dotRect = CGRectMake(center.x - 3.0, center.y - 3.0, 5.0, 5.0);
            CGContextAddEllipseInRect(context, dotRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            CGContextMoveToPoint(context, center.x, center.y - radius);
            CGContextAddLineToPoint(context, center.x, center.y);
            CGContextAddLineToPoint(context, center.x + radius, center.y);
            CGContextStrokePath(context);
        }
    } else {
        CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor);
        CGContextAddRect(context, self.bounds);
        CGContextFillPath(context);
    }
}

- (void)circleGestureFailed:(MDCircleGestureRecognizer *)gr
{
    label.textColor = [UIColor redColor];
    switch ( gr.error ) {
        case MDCircleGestureErrorNotClosed:
            label.text = @"Failed: Didn't finish close enough to starting point";
            break;
        case MDCircleGestureErrorOverlapTolerance:
            label.text = @"Failed: Points beyond overlap tolerance";
            break;
        case MDCircleGestureErrorRadiusVarianceTolerance:
            label.text = @"Failed: Points outside radius variance tolerance level";
            break;
        case MDCircleGestureErrorTooShort:
            label.text = @"Failed: Not enough points";
            break;
        case MDCircleGestureErrorTooSlow:
            label.text = @"Failed: Took too long to draw";
            break;
        case MDCircleGestureErrorNone:
            label.text = @"";
            break;
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    label.text = @"";
    return touch.view != popoverButton;
}

- (void) handleGesture:(MDCircleGestureRecognizer *)gr
{
    if ( gr.state == UIGestureRecognizerStateEnded ) {
        label.textColor = [UIColor whiteColor];
        label.text = [NSString stringWithFormat:@"Circle Detected: centre %@, radius %f", NSStringFromCGPoint(gr.center), gr.radius];
        center = gr.center;
        radius = gr.radius;
        [self setNeedsDisplay];
    } else if ( gr.state == UIGestureRecognizerStateChanged ) {
        [points release];
        points = [gr.points retain];
        [self setNeedsDisplay];
    } else if ( gr.state == UIGestureRecognizerStateBegan ) {
        [points release];
        points = nil;
        center = CGPointZero;
        radius = -1;
        [self setNeedsDisplay];
    }
}

- (void)dealloc {
    [label release];
    [super dealloc];
}

- (void)eraseText
{
    label.text = @"";
    [self setNeedsDisplay];
}

@end
