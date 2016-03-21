//
//  KPCSessionManager.h
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/19/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class KPCGame;

typedef void (^KPCSessionJsonResponseBlock)(NSDictionary *parsedJsonData, NSError *error);
typedef void (^KPCSessionImageResponseBlock)(UIImage *Image, NSError *error);

@interface KPCSessionManager : NSObject <NSURLSessionDelegate>


/**
 It will store the session token .
 */
@property (nonatomic,strong) NSString *sessionToken;


/*!
 * @method      getRequestWithUrlInBackground
 * @abstract    Perform get Request
 * @return      Returns a block with parsed Json Data and Error.
 */

- (void)getRequestWithUrlInBackground:(NSURL *)url parameters:(NSDictionary *)parameters completionHandler:(KPCSessionJsonResponseBlock)block;


/*!
 * @method      downloadGameImageInBackground
 * @abstract    fetch image from server for given game.
 * @return      Returns a block with image and Error.
 */

- (void)downloadGameImageInBackground:(KPCGame *)game completionHandler:(KPCSessionImageResponseBlock)block;


///---------------------
/// @name Initialization
///---------------------

/**
 Creates and returns an `KPCSessionManager` object with token.
 */

+ (instancetype)sessionWithToken:(NSString *)token;

/**
 Creates and returns an `KPCSessionManager` object.
 */

+ (instancetype)createSession;

@end
