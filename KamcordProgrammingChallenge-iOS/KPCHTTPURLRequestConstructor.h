//
//  KPCHTTPURLRequestConstructor.h
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/19/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KPCHTTPURLRequestConstructor : NSObject

///--------------------------------------
/// Create NSMutaleRequest for provided url, httpMethod, httpHeaders and parameters
///--------------------------------------

+ (NSMutableURLRequest *)urlRequestWithURL:(NSURL *)url
                                httpMethod:(NSString *)httpMethod
                               httpHeaders:(NSDictionary *)httpHeaders
                                parameters:(NSDictionary *)parameters;


@end
