//
//  KPCSessionManager.m
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/19/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import "KPCSessionManager.h"
#import "KPCHTTPURLRequestConstant.h"
#import "KPCHTTPURLRequestConstructor.h"
#import "NSString+Additions.h"
#import "KPCGame.h"

typedef NS_ENUM(NSInteger, SessionResponseCode) {
    SessionResponseCodeAllOk = 0,
    SessionResponseCodeInsuficientParameters = 3,
    SessionResponseCodeErrorDownloadingImage = 404,
};

#define SessionResponse @"response"

static NSString *SessionResponseStatusInsuficientParametersDomain = @"com.puneetpalsingh.ScuOffCampusApp.InsuficientParameters";
static NSString *SessionResponseStatusErrorDownloadingImageDomain = @"com.puneetpalsingh.ScuOffCampusApp.ErrorDownloadingImage";

@implementation KPCSessionManager{
    
    dispatch_queue_t _sessionQueue;
    
}


///--------------------------------------
#pragma mark - Initialization
///--------------------------------------

+ (instancetype)sessionWithToken:(NSString *)token{
    
        return[[self alloc]initWithToken:token];
}

+ (instancetype)createSession{
    
    return[[self alloc]initWithToken:nil];
}

-(instancetype)initWithToken:(NSString *)token{
    
    if (self = [super init]) {
        
        _sessionToken = token;
    }
    return self;
}

///--------------------------------------
#pragma mark - Get Request
///--------------------------------------

- (void)getRequestWithUrlInBackground:(NSURL *)url parameters:(NSDictionary *)parameters completionHandler:(KPCSessionJsonResponseBlock)block{
    
    
    _sessionQueue = dispatch_queue_create("com.puneetpalsingh.KamcordProgrammingChallenge.sessionqueue", DISPATCH_QUEUE_CONCURRENT);
    
    
    dispatch_async(_sessionQueue, ^{
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
        
        
        NSMutableURLRequest *request;
        
        NSString *thePath =  [url absoluteString];
        
        thePath = [thePath stringByAppendingQueryParameters:parameters];
        
        NSURL *newUrl = [NSURL URLWithString:thePath];
        
        request = [KPCHTTPURLRequestConstructor
                                            urlRequestWithURL:newUrl
                                            httpMethod:KPCHTTPURLRequestMethodGET
                                            httpHeaders:@{KPCHTTPURLRequestHeaderNameContentType : KPCHTTPURLRequestContentTypeJSON, KPCHTTPURLRequestHeaderNameAccept : KPCHTTPURLRequestContentTypeJSON, KPCHTTPURLRequestHeaderNameDeviceToken : _sessionToken}
                                            parameters:nil];
        
        
    
        
        NSURLSessionDataTask *getGamesDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            
            //Getting NSDictionary from JSON
            
            NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"%@",parsedObject[@"status"][@"status_code"]);
                
                if ([parsedObject[@"status"][@"status_code"] integerValue] != SessionResponseCodeAllOk) {
                    
                    NSError *error = nil;
                    
                    error = [NSError errorWithDomain:SessionResponseStatusInsuficientParametersDomain code:SessionResponseCodeInsuficientParameters userInfo:@{
                                                                                                                                                                 
                                                                                                                                                                 @"Insufficient parameters.":NSLocalizedDescriptionKey
                                                                                                                                                                 
                                                                                                                                                                 }];
                    block(nil,error);
                }
                else{
                    
                    block(parsedObject[SessionResponse],nil);
                }
                
                
            });
        }];
        
        [getGamesDataTask resume];
        [session finishTasksAndInvalidate];
        
    });
}

///--------------------------------------
#pragma mark - Get Request For Image
///--------------------------------------

- (void)downloadGameImageInBackground:(KPCGame *)game completionHandler:(KPCSessionImageResponseBlock)block{
    
    _sessionQueue = dispatch_queue_create("com.puneetpalsingh.KamcordProgrammingChallenge.sessionqueue", DISPATCH_QUEUE_CONCURRENT);
    
    
    dispatch_async(_sessionQueue, ^{
        
        //NSSession for downloading image
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
        
        NSURL *url = [NSURL URLWithString:game.gameIconUrl];
        
        NSMutableURLRequest *request;
        
        request = [KPCHTTPURLRequestConstructor
                   urlRequestWithURL:url
                   httpMethod:KPCHTTPURLRequestMethodGET
                   httpHeaders:nil
                   parameters:nil];

        NSURLSessionDataTask *getImageDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            
            UIImage *image = [UIImage imageWithData:data];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (image) {
                    
                    block(image,nil);
                }
                else{
                    
                    NSError *error = nil;
                    
                    error = [NSError errorWithDomain:SessionResponseStatusErrorDownloadingImageDomain code:SessionResponseCodeErrorDownloadingImage userInfo:@{
                                                                                                                                                                 
                                                                                                                                                                 @"Error Downloading Image.":NSLocalizedDescriptionKey
                                                                                                                                                                 
                                                                                                                                                                 }];
                    block(nil,error);
                    
                }
                
            });
        }];
        
        [getImageDataTask resume];
        [session finishTasksAndInvalidate];
        
    });

    
}

@end
