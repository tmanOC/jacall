//
//  NetworkHandler.h
//  jacall
//
//  Created by Tielman Janse van Vuuren on 2017/05/13.
//  Copyright © 2017 foo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkHandler : NSObject
-(instancetype)initWithURLString:(NSString*)string;
-(NSURLSessionTask*)requestGetUsersWithCompletion:(void (^)(id response, NSError* error))completion;
@end
