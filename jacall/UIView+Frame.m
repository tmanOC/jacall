//
//  UIView+Frame.m
//  HelpingOut
//
//  Created by Tielman Janse van Vuuren on 2016/04/19.
//  Copyright © 2016 4imobile. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
-(CGFloat)x
{
    return self.frame.origin.x;
}
-(CGFloat)y
{
    return self.frame.origin.y;
}
-(CGFloat)height
{
    return self.frame.size.height;
}
-(CGFloat)width
{
    return self.frame.size.width;
}
-(CGSize)size
{
    return self.frame.size;
}
-(void)setX:(CGFloat)x
{
    [self setFrame:CGRectMake(x,self.y,self.width,self.height)];
}
-(void)setY:(CGFloat)y
{
    [self setFrame:CGRectMake(self.x,y,self.width,self.height)];
}
-(void)setHeight:(CGFloat)height
{
    [self setFrame:CGRectMake(self.x,self.y,self.width,height)];
}
-(void)setWidth:(CGFloat)width
{
    [self setFrame:CGRectMake(self.x,self.y,width,self.height)];
}
-(void)setSize:(CGSize)size
{
    [self setFrame:CGRectMake(self.x,self.y,size.width,size.height)];
}

-(CGFloat)bottom
{
    return self.y + self.height;
}

-(CGFloat)right
{
    return self.x + self.width;
}
@end
