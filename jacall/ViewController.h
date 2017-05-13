//
//  ViewController.h
//  jacall
//
//  Created by Tielman Janse van Vuuren on 2017/05/13.
//  Copyright © 2017 foo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkHandler.h"
@interface ViewController : UIViewController
-(instancetype)initWithNetworkHandler:(NetworkHandler*)handlerNetwork;

@end

