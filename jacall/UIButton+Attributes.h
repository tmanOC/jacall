//
//  UIButton+Attributes.h
//  jacall
//
//  Created by Tielman Janse van Vuuren on 2017/05/13.
//  Copyright © 2017 foo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Attributes)
-(void)setTouchTitle:(NSString*)title colour:(UIColor*)colour colourTouched:(UIColor*)colourTouched font:(UIFont*)font;
@end
