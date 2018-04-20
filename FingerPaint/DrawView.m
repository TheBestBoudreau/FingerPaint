//
//  DrawView.m
//  FingerPaint
//
//  Created by Tyler Boudreau on 2018-04-20.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

#import "DrawView.h"
#import "Line.h"

@interface DrawView()

@property (nonatomic)NSMutableArray <Line*> *array;
@end


@implementation DrawView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self =[super initWithCoder:aDecoder]){
        _array =[NSMutableArray new];
    }
    return self;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint first =[touches.anyObject locationInView:self];
    
    Line *segment =[[Line alloc]initWithFirstpoint:first secondPoint:first];
    
    [self.array addObject:segment];
    
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch =[[touches allObjects]objectAtIndex:0];
    
    CGPoint current =[touch locationInView:self];
    CGPoint previous = [touch previousLocationInView:self];
    
    Line *segment =[[Line alloc]initWithFirstpoint:previous secondPoint:current];
    [self.array addObject:segment];
    
    [self setNeedsDisplay];
    
    for (Line *line in _array) {
        NSLog(@"First point: %@",NSStringFromCGPoint(line.firstPoint));
        NSLog(@"First point: %@",NSStringFromCGPoint(line.secondPoint));

    }
    }

-(void)drawRect:(CGRect)rect{
    UIBezierPath *ubPath =[UIBezierPath bezierPath];
    ubPath.lineWidth=4;
    ubPath.lineCapStyle=kCGLineCapSquare;
    [[UIColor blueColor] setStroke];
    
    for (Line *line in self.array){
        if (CGPointEqualToPoint(line.firstPoint, line.secondPoint)){
            [ubPath moveToPoint:line.firstPoint];
            continue;
        }
        [ubPath addLineToPoint: line.secondPoint];
    }
    [ubPath stroke];
}


@end
