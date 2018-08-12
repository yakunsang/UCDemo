//
//  SomoView.h
//  UCDemo
//
//  Created by syk on 2018/8/11.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SomoColorFromRGBA(R, G, B, A) \
[UIColor  colorWithRed:(R)/255.0 \
green:(G)/255.0 \
blue:(B)/255.0 \
alpha:1.0]

#define SomoColorFromRGB(R, G, B)        SomoColorFromRGBA(R, G, B, 1.0)
#define SomoColorFromRGBV(V)        SomoColorFromRGBA(V, V, V, 1.0)

typedef NS_ENUM(NSInteger,SomoAnimationStyle) {
    SomoAnimationStyleSolid,
    SomoAnimationStyleGradientHorizontal,
    SomoAnimationStyleGradientVertical,
    SomoAnimationStyleOblique
};

@interface SomoView : UIView

@property (nonatomic, strong) UIColor *somoColor;
@property (nonatomic, assign) SomoAnimationStyle animationStyle;


- (instancetype)initWithFrame:(CGRect)rect
                    somoColor:(UIColor *)color;

- (instancetype)initWithFrame:(CGRect)rect
                    somoColor:(UIColor *)color
               animationStyle:(SomoAnimationStyle)style;

@end
