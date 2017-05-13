//
//  NetworkHandler.m
//  jacall
//
//  Created by Tielman Janse van Vuuren on 2017/05/13.
//  Copyright © 2017 foo. All rights reserved.
//

#import "NetworkHandler.h"
#import <AFNetworking/AFNetworking.h>
@implementation NetworkHandler {
    AFHTTPSessionManager * manager_session;
}
-(instancetype)initWithURLString:(NSString*)string {
    self = [super init];
    if(self == nil) {
        return nil;
    }
    manager_session = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:string]];
    [manager_session setRequestSerializer:[AFJSONRequestSerializer serializer]];
    manager_session.requestSerializer.timeoutInterval = 30;
    [manager_session setResponseSerializer:[AFJSONResponseSerializer serializer]];
    return self;
}
// /users
-(NSURLSessionTask*)requestGetUsersWithCompletion:(void (^)(id response, NSError* error))completion {
    return [manager_session GET:@"/users" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion(nil,error);
    }];
}
@end
