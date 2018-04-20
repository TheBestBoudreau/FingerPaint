//
//  Line.h
//  FingerPaint
//
//  Created by Tyler Boudreau on 2018-04-20.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@interface Line : NSObject

@property (nonatomic,readonly) CGPoint firstPoint;
@property (nonatomic,readonly) CGPoint secondPoint;


-(instancetype)initWithFirstpoint:(CGPoint)first secondPoint:(CGPoint)second;

@end
