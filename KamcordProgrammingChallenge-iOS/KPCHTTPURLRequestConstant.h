//
//  KPCHTTPURLRequestConstant.h
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/19/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#ifndef KPCHTTPURLRequestConstant_h
#define KPCHTTPURLRequestConstant_h

static NSString *const KPCHTTPURLRequestMethodGET = @"GET";
static NSString *const KPCHTTPURLRequestMethodHEAD = @"HEAD";
static NSString *const KPCHTTPURLRequestMethodDELETE = @"DELETE";
static NSString *const KPCHTTPURLRequestMethodPOST = @"POST";
static NSString *const KPCHTTPURLRequestMethodPUT = @"PUT";

static NSString *const KPCHTTPURLRequestHeaderNameContentType = @"Content-Type";
static NSString *const KPCHTTPURLRequestHeaderNameAccept = @"Accept";
static NSString *const KPCHTTPURLRequestHeaderNameDeviceToken = @"device-token";
static NSString *const KPCHTTPURLRequestHeaderNameContentLength = @"Content-Length";

static NSString *const KPCHTTPURLRequestContentTypeJSON = @"application/json; charset=utf-8";
static NSString *const KPCHTTPURLRequestContentTypeUrlEncoded = @"application/x-www-form-urlencoded";

static NSString *const KPCGamesUrl = @"https://app.staging.kamcord.com/app/v3/games";
static NSString *const KPCToken = @"abc123";

#endif
