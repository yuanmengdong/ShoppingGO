//
//  animation.h
//  shiyan8
//
//  Created by rimi on 16/3/24.
//  Copyright © 2016年 momi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Animation : NSObject

- (CABasicAnimation *)moveFromValue:(CGPoint)from toValue:(CGPoint)to beginTime:(CFTimeInterval)begin duration:(CFTimeInterval)duration keep:(BOOL)keep;

- (CABasicAnimation *)zoomFromValue:(NSValue *)from toValue:(NSValue *)to beginTime:(CFTimeInterval)begin duration:(CFTimeInterval)duration keep:(BOOL)keep;

- (CABasicAnimation *)boundsFromValue:(NSValue *)from toValue:(NSValue *)to beginTime:(CFTimeInterval)begin duration:(CFTimeInterval)duration keep:(BOOL)keep;

- (CABasicAnimation *)spinFromValue:(NSValue *)from toValue:(NSValue *)to beginTime:(CFTimeInterval)begin duration:(CFTimeInterval)duration keep:(BOOL)keep;
@end
