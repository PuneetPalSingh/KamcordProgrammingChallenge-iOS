//
//  KPCHTTPURLRequestConstructor.m
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/19/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import "KPCHTTPURLRequestConstructor.h"
#import "KPCHTTPURLRequestConstant.h"
@implementation KPCHTTPURLRequestConstructor

///--------------------------------------
#pragma mark - NSMutable Url Constructor Public Method
///--------------------------------------

+ (NSMutableURLRequest *)urlRequestWithURL:(NSURL *)url
                                httpMethod:(NSString *)httpMethod
                               httpHeaders:(NSDictionary *)httpHeaders
                                parameters:(NSDictionary *)parameters {
    NSParameterAssert(url != nil);
    NSParameterAssert(httpMethod != nil);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = httpMethod;
    request.allHTTPHeaderFields = httpHeaders;
    
    if (parameters != nil) {
        if([httpMethod isEqualToString:KPCHTTPURLRequestMethodPOST] ||
           [httpMethod isEqualToString:KPCHTTPURLRequestMethodPUT]){
            [request setValue:KPCHTTPURLRequestContentTypeJSON forHTTPHeaderField:KPCHTTPURLRequestHeaderNameContentType];
        }
        
        NSError *error = nil;
        request.HTTPBody = [NSJSONSerialization dataWithJSONObject:parameters
                                                           options:(NSJSONWritingOptions)0
                                                             error:&error];
    }
    return request;
}

@end
