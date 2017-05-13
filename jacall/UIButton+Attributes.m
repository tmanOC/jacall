//
//  UIButton+Attributes.m
//  jacall
//
//  Created by Tielman Janse van Vuuren on 2017/05/13.
//  Copyright © 2017 foo. All rights reserved.
//

#import "UIButton+Attributes.h"
//convenience method for adding simple attributed titles to buttons
@implementation UIButton (Attributes)
-(void)setTouchTitle:(NSString*)title colour:(UIColor*)colour colourTouched:(UIColor*)colourTouched font:(UIFont*)font {
    NSAttributedString* title_normal = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:colour,NSFontAttributeName:font}];
    NSAttributedString* title_touched = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:colourTouched,NSFontAttributeName:font}];
    [self setAttributedTitle:title_normal forState:UIControlStateNormal];
    [self setAttributedTitle:title_touched forState:UIControlStateHighlighted];
}
@end
