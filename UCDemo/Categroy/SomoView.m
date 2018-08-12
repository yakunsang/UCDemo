//
//  SomoView.m
//  UCDemo
//
//  Created by syk on 2018/8/11.
//  Copyright © 2018年 UCDemo. All rights reserved.
//


#import "SomoView.h"

static const CGFloat kShadowWidth = 60.;

@interface SomoView()

@property (nonatomic, strong) CAGradientLayer *somoLayer;

@end

@implementation SomoView

-(instancetype)initWithFrame:(CGRect)rect somoColor:(UIColor *)color {
    return [[[self class] alloc] initWithFrame:rect somoColor:color animationStyle:SomoAnimationStyleOblique];
}

- (instancetype)initWithFrame:(CGRect)rect
                    somoColor:(UIColor *)color
               animationStyle:(SomoAnimationStyle)style {
    if (self = [super initWithFrame:rect]) {
        [self _setupWithColor:color animationStyle:style];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _setupWithColor:SomoColorFromRGBV(150)
               animationStyle:SomoAnimationStyleGradientVertical];
    }
    return self;
}

- (void)_setupWithColor:(UIColor *)color
         animationStyle:(SomoAnimationStyle)style {
    _somoColor = color;
    _animationStyle = style;
    self.backgroundColor = self.somoColor;
    self.layer.masksToBounds = YES;
    [self _animate];
}

- (void)_animate {
    CGSize size = self.bounds.size;
    switch (self.animationStyle) {
        case SomoAnimationStyleSolid:
            {
                CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"opacity"];
                basic.fromValue = @1.;
                basic.toValue = @0.5;
                basic.duration = 2.;
                basic.repeatCount = INFINITY;
                basic.autoreverses = YES;
                basic.removedOnCompletion = NO;
                [self.layer addAnimation:basic forKey:basic.keyPath];
            }
             break;
        case SomoAnimationStyleOblique:
            {
                CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"position"];
                basic.fromValue = [NSValue valueWithCGPoint:CGPointMake(-kShadowWidth , size.height/2.)];
                basic.toValue = [NSValue valueWithCGPoint:CGPointMake(size.width+kShadowWidth, size.height/2.)];
                basic.duration = 1.5;
                basic.repeatCount = INFINITY;
                basic.removedOnCompletion = NO;
                self.somoLayer.affineTransform = CGAffineTransformMakeRotation(0.4);
                self.somoLayer.frame = CGRectMake(0, 0, kShadowWidth, size.height+200);
                self.somoLayer.startPoint = CGPointMake(0, 0.5);
                self.somoLayer.endPoint = CGPointMake(1, 0.5);
                [self.somoLayer addAnimation:basic forKey:basic.keyPath];
                [self.layer addSublayer:self.somoLayer];
            }
             break;
        case SomoAnimationStyleGradientHorizontal:
            {
                CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"position"];
                basic.fromValue = [NSValue valueWithCGPoint:CGPointMake(-kShadowWidth/2., size.height/2.)];
                basic.toValue = [NSValue valueWithCGPoint:CGPointMake(size.width+kShadowWidth/2., size.height/2.)];
                basic.duration = 1.5;
                basic.repeatCount = INFINITY;
                basic.removedOnCompletion = NO;
                self.somoLayer.frame = CGRectMake(0, 0, kShadowWidth, size.height);
                self.somoLayer.startPoint = CGPointMake(0, 0.5);
                self.somoLayer.endPoint = CGPointMake(1, 0.5);
                [self.somoLayer addAnimation:basic forKey:basic.keyPath];
                [self.layer addSublayer:self.somoLayer];
            }
             break;
        case SomoAnimationStyleGradientVertical:
            {
                CGFloat height = size.height/2. > 40. ? : 40.;
                CABasicAnimation * basic = [CABasicAnimation animationWithKeyPath:@"position"];
                basic.fromValue = [NSValue valueWithCGPoint:CGPointMake(size.width/2., -height)];
                basic.toValue = [NSValue valueWithCGPoint:CGPointMake(size.width/2., size.height+height)];
                basic.duration = 1.5;
                basic.repeatCount = INFINITY;
                basic.removedOnCompletion = NO;
                self.somoLayer.frame = CGRectMake(0,0,size.width,height);
                self.somoLayer.startPoint = CGPointMake(0.5, 0);
                self.somoLayer.endPoint = CGPointMake(0.5, 1);
                [self.somoLayer addAnimation:basic forKey:basic.keyPath];
                [self.layer addSublayer:self.somoLayer];
            }
             break;
            
        default:
            break;
    }
}

-(CAGradientLayer *)somoLayer{
    if (!_somoLayer) {
        _somoLayer = [CAGradientLayer layer];
        UIColor * color = [UIColor whiteColor];
        _somoLayer.colors = @[(id)[color colorWithAlphaComponent:0.03].CGColor,
                              (id)[color colorWithAlphaComponent:0.09].CGColor,
                              (id)[color colorWithAlphaComponent:0.15].CGColor,
                              (id)[color colorWithAlphaComponent:0.21].CGColor,
                              (id)[color colorWithAlphaComponent:0.27].CGColor,
                              (id)[color colorWithAlphaComponent:0.30].CGColor,
                              (id)[color colorWithAlphaComponent:0.27].CGColor,
                              (id)[color colorWithAlphaComponent:0.21].CGColor,
                              (id)[color colorWithAlphaComponent:0.15].CGColor,
                              (id)[color colorWithAlphaComponent:0.09].CGColor,
                              (id)[color colorWithAlphaComponent:0.03].CGColor];
    }
    return _somoLayer;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
