//
//  UIViewController+Alert.m
//  jacall
//
//  Created by Tielman Janse van Vuuren on 2017/05/14.
//  Copyright © 2017 foo. All rights reserved.
//

#import "UIViewController+Alert.h"

@implementation UIViewController (Alert)
-(void)presentOKAlertWithTitle:(NSString*)title message:(NSString*)message {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        ;
    }]];
    [self presentViewController:alert animated:true completion:nil];
}
@end
