//
//  UIViewController+Loader.m
//  jacall
//
//  Created by Tielman Janse van Vuuren on 2017/05/14.
//  Copyright © 2017 foo. All rights reserved.
//

#import "UIViewController+Loader.h"

@implementation UIViewController (Loader)
-(void)showLoader {
    [MBProgressHUD showHUDAddedTo:self.view animated:true];
}
-(void)hideLoader {
    [MBProgressHUD hideHUDForView:self.view animated:true];
}
@end
