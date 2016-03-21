//
//  KPCSession.h
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/19/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^KPCSessionResponseBlock)(NSData *data, NSError *error);

@interface KPCSession : NSObject


/**
 It will store the session token .
 */
@property (nonatomic,strong) NSString *sessionToken;



///--------------------------------------
#pragma mark - Logging In
///--------------------------------------

/*!
 * @method      LogInWithEmailInBackground
 * @abstract    Provides instance of SCHUser Class
 * @param       email - email password to pass in request url body, password - password to pass in request url body.
 * @return      Returns an error if login fails.
 */

+ (void)getRequestWithUrl:(NSMutableURLRequest *)urlRequest token:(NSString *)token block:(KPCSessionResponseBlock)block;


@end
