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
    
    NetworkHandler* handler_network;
}
-(instancetype)initWithNetworkHandler:(NetworkHandler*)handlerNetwork {
    self = [super init];
    if(self == nil) {
        return nil;
    }
    handler_network = handlerNetwork;
    return self;
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
    
    [button_names addTarget:self action:@selector(getUsersNames) forControlEvents:UIControlEventTouchUpInside];
    [button_email addTarget:self action:@selector(getUsersSpecificEmail) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)presentOKAlertWithTitle:(NSString*)title message:(NSString*)message {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        ;
    }]];
    [self presentViewController:alert animated:true completion:nil];
}
-(NSString*)getNameFromUser:(id)user {
    if(![user isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    return user[@"name"];
}
-(NSString*)getEmailFromUser:(id)user {
    if(![user isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    return user[@"email"];
}
-(bool)isUserSamantha:(id)user {
    if(![user isKindOfClass:[NSDictionary class]]) {
        return false;
    }
    return [user[@"username"] isEqualToString:@"Samantha"];
}

-(NSString*)getNamesFromResponse:(id)response {
    NSLog(@"%@",response);
    if(![response isKindOfClass:[NSArray class]]) {
        return nil;
    }
    NSArray* array_users = (NSArray*) response;
    NSString* result = @"Names:";
    for(id object in array_users) {
        NSString* name = [self getNameFromUser:object];
        if(name != nil) {
            result = [NSString stringWithFormat:@"%@\n%@",result,name];
        }
    }
    return result;
}
-(NSString*)getEmailFromResponse:(id)response {
    NSLog(@"%@",response);
    if(![response isKindOfClass:[NSArray class]]) {
        return nil;
    }
    NSArray* array_users = (NSArray*) response;
    NSString* result = @"Samantha's email address:\n";
    for(id object in array_users) {
        if(![self isUserSamantha:object]) {
            continue;
        }
        result = [NSString stringWithFormat:@"%@%@",result,[self getEmailFromUser:object]];
    }
    return result;
}
-(void)getUsersNames {
    [handler_network requestGetUsersWithCompletion:^(id response, NSError *error) {
        if(error != nil) {
            [self presentOKAlertWithTitle:@"Error" message:error.localizedDescription];
            return;
        }
        if(response == nil) {
            [self presentOKAlertWithTitle:@"Error" message:@"Empty response"];
            return;
        }
        NSString* message = [self getNamesFromResponse:response];
        if(message == nil) {
            [self presentOKAlertWithTitle:@"Error" message:@"Failed to parse response"];
            return;
        }
        [self presentOKAlertWithTitle:@"Message" message:message];
    }];
}

-(void)getUsersSpecificEmail {
    [handler_network requestGetUsersWithCompletion:^(id response, NSError *error) {
        if(error != nil) {
            [self presentOKAlertWithTitle:@"Error" message:error.localizedDescription];
            return;
        }
        if(response == nil) {
            [self presentOKAlertWithTitle:@"Error" message:@"Empty response"];
            return;
        }
        NSString* message = [self getEmailFromResponse:response];
        if(message == nil) {
            [self presentOKAlertWithTitle:@"Error" message:@"Failed to parse response"];
            return;
        }
        [self presentOKAlertWithTitle:@"Message" message:message];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
