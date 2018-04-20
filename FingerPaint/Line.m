//
//  Line.m
//  FingerPaint
//
//  Created by Tyler Boudreau on 2018-04-20.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

#import "Line.h"

@implementation Line


-(instancetype)initWithFirstpoint:(CGPoint)first secondPoint:(CGPoint)second;
{
    if (self =[super init]){
        _firstPoint=first;
        _secondPoint=second;
    }
    return self;
}
@end
