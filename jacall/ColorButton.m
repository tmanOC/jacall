//
//  ColorButton.m
//  HelpingOut
//
//  Created by Tielman Janse van Vuuren on 2016/04/20.
//  Copyright © 2016 4imobile. All rights reserved.
//

#import "ColorButton.h"

@implementation ColorButton
- (void) setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if (highlighted) {
        self.backgroundColor = self.colour_selected;
    }
    else {
        self.backgroundColor = self.colour;
    }
}
@end
