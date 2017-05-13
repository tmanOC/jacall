//
//  ViewController.m
//  jacall
//
//  Created by Tielman Janse van Vuuren on 2017/05/13.
//  Copyright © 2017 foo. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Frame.h"
#import "UIButton+Attributes.h"
#import "ColorButton.h"

@interface ViewController ()

@end

@implementation ViewController {
    ColorButton* button_names;
    ColorButton* button_email;
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor * colour_navy = [UIColor colorWithRed:0.1 green:0.1 blue:0.5 alpha:1.0];
    
    self.view.backgroundColor = colour_navy;
    CGFloat height_button = 50.0;
    CGFloat margin = 30.0;
    button_names = [[ColorButton alloc] initWithFrame:CGRectMake(margin, self.view.height - 2 * height_button - 2 * margin, self.view.width - 2 * margin, height_button)];
    button_names.colour = [UIColor whiteColor];
    button_names.colour_selected = [UIColor lightGrayColor];
    button_names.backgroundColor = [UIColor whiteColor];
    button_names.layer.cornerRadius = button_names.height / 2.0;
    UIColor* colour_touched = [UIColor colorWithRed:0.1 green:0.1 blue:0.2 alpha:1.0];
    [button_names setTouchTitle:@"List Names" colour:colour_navy colourTouched:colour_touched font:[UIFont systemFontOfSize:17.0 weight:UIFontWeightSemibold]];
    
    button_email = [[ColorButton alloc] initWithFrame:CGRectMake(margin, self.view.height - height_button - margin, self.view.width - 2 * margin, height_button)];
    [button_email setTouchTitle:@"Samantha's Email" colour:colour_navy colourTouched:colour_touched font:[UIFont systemFontOfSize:17.0 weight:UIFontWeightSemibold]];
    button_email.colour = [UIColor whiteColor];
    button_email.colour_selected = [UIColor lightGrayColor];
    button_email.backgroundColor = [UIColor whiteColor];
    button_email.layer.cornerRadius = button_email.height / 2.0;
    [self.view addSubview:button_names];
    [self.view addSubview:button_email];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
