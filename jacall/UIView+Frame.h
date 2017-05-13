//
//  UIView+Frame.h
//  HelpingOut
//
//  Created by Tielman Janse van Vuuren on 2016/04/19.
//  Copyright © 2016 4imobile. All rights reserved.
//

#import <UIKit/UIKit.h>
//convenience properties for accessing frames
//also awesome bottom and right properties
@interface UIView (Frame)
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGSize size;

@property (nonatomic,readonly) CGFloat bottom;
@property (nonatomic,readonly) CGFloat right;
@end
