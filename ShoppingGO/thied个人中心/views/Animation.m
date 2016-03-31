//
//  animation.m
//  shiyan8
//
//  Created by rimi on 16/3/24.
//  Copyright © 2016年 momi. All rights reserved.
//

#import "Animation.h"

@implementation Animation

- (CABasicAnimation *)moveFromValue:(CGPoint)from toValue:(CGPoint)to beginTime:(CFTimeInterval)begin duration:(CFTimeInterval)duration keep:(BOOL)keep
{
    CABasicAnimation * move = [CABasicAnimation animationWithKeyPath:@"position"];
    
    move.beginTime = begin;
    move.duration = duration;
    move.fromValue = [NSValue valueWithCGPoint:from];
    move.toValue = [NSValue valueWithCGPoint:to];
    
    move.removedOnCompletion = keep;
    move.fillMode = kCAFillModeForwards;
    move.delegate = self;
    
    return move;
}

- (CABasicAnimation *)zoomFromValue:(NSValue *)from toValue:(NSValue *)to beginTime:(CFTimeInterval)begin duration:(CFTimeInterval)duration keep:(BOOL)keep
{
    CABasicAnimation * zoom = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    zoom.beginTime = begin;
    zoom.fromValue = from;
    
    zoom.duration = duration;
    
    zoom.toValue = to;
    
    zoom.removedOnCompletion = keep;
    zoom.fillMode = kCAFillModeForwards;
    
    return zoom;
}

- (CABasicAnimation *)boundsFromValue:(NSValue *)from toValue:(NSValue *)to beginTime:(CFTimeInterval)begin duration:(CFTimeInterval)duration keep:(BOOL)keep
{
    CABasicAnimation * bounds = [CABasicAnimation animationWithKeyPath:@"bounds"];
    bounds.beginTime = begin;
    bounds.fromValue = from;
    
    bounds.duration = duration;
    
    bounds.toValue = to;
    
    bounds.removedOnCompletion = keep;
    bounds.fillMode = kCAFillModeForwards;
    
    return bounds;
}

- (CABasicAnimation *)spinFromValue:(NSValue *)from toValue:(NSValue *)to beginTime:(CFTimeInterval)begin duration:(CFTimeInterval)duration keep:(BOOL)keep
{
    CABasicAnimation * spin = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    spin.beginTime = begin;
    spin.fromValue = from;
    
    spin.duration = duration;
    
    spin.toValue = to;
    
    spin.removedOnCompletion = keep;
    spin.fillMode = kCAFillModeForwards;
    
    return spin;
}

@end
