//
//  KPCSession.m
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/19/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import "KPCSession.h"


typedef NS_ENUM(NSInteger, SessionResponseStatus) {
    SessionResponseStatusSuccessful = 200,
    SessionResponseStatusWrongCredentials = 403,
    SessionResponseStatusDataMissing = 403,
};

static NSString *noEntityFoundDomain = @"com.puneetpalsingh.ScuOffCampusApp.NoEntityFound";
static NSString *noResultFoundDomain = @"com.puneetpalsingh.ScuOffCampusApp.NoResultFound";

#define SessionResponseMessage = @"com.puneetpalsingh.ScuOffCampusApp.NoEntityFound";
#define SessionResponseMessage = @"com.puneetpalsingh.ScuOffCampusApp.NoEntityFound";

#define SessionResponseMessage = @"com.puneetpalsingh.ScuOffCampusApp.NoEntityFound";


typedef NS_ENUM(NSInteger, SessionResponseKeys) {
    SessionResponseKeys1 = 0,
    SessionResponseKeys2,
    SessionResponseKeys3,
};


@implementation KPCSession{
    dispatch_queue_t _logInSessionQueue;
}


- (void)getRequestWithUrl:(NSMutableURLRequest *)urlRequest token:(NSString *)token block:(KPCSessionResponseBlock)block{
    
    /*
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
     
     //NSSession for requesting token
     
     NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
     
     NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
     
     NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://scuoffcampus.herokuapp.com/api/sign_in?email=%@&password=%@",email,password]];
     
     NSMutableURLRequest *request = [SCHHTTPURLRequestConstructor
     urlRequestWithURL:url
     httpMethod:SCHHTTPRequestMethodPOST
     httpHeaders:@{SCHHTTPRequestHeaderNameContentType : SCHHTTPURLRequestContentTypeUrlEncoded}
     parameters:nil];
     
     
     
     
     NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
     
     
     
     //Getting NSDictionary from JSON
     
     NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
     
     
     if ([[parsedObject valueForKey:@"status"] isEqualToString:@"403"]) {
     
     
     
     dispatch_async(dispatch_get_main_queue(), ^{
     
     NSError *error = nil;
     
     error = [NSError errorWithDomain:noEntityFoundDomain code:Ses userInfo:@{
     
     @"No entity found in NSManagedObjectModel":NSLocalizedDescriptionKey
     
     }];
     
     
     });
     
     
     
     }
     
     else{
     
     
     
     // Creating new object and save to persistant store
     
     [CoreDataManager createNewManagedObjectForEntityForName:@"Token" withComplitionHandler:^(NSManagedObject *newObject, NSManagedObjectContext *context, BOOL success){
     
     
     
     
     
     if (success) {
     
     
     
     [newObject setValue:[parsedObject valueForKey:@"message"] forKey:@"message"];
     
     [newObject setValue:[parsedObject valueForKey:@"status"] forKey:@"status"];
     
     [newObject setValue:[parsedObject valueForKey:@"auth_token"] forKey:@"token"];
     
     
     
     NSError *coreDataError = nil;
     
     // Save the object to persistent store
     
     if (![context save:&coreDataError]) {
     
     NSLog(@"Can't Save! %@ %@", coreDataError, [coreDataError localizedDescription]);
     
     }
     
     else{
     
     
     
     dispatch_async(dispatch_get_main_queue(), ^{
     
     
     
     [_loginLoadingIndicator stopAnimating];
     
     
     
     SCHTabBarVC *tabBarVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarVC"];
     
     [self presentViewController:tabBarVC animated:NO completion:nil];
     
     
     
     });
     
     }
     
     }
     
     
     
     
     
     
     
     }];
     
     
     
     
     
     }
     
     
     
     }];
     
     
     
     [postDataTask resume];
     
     
     [session finishTasksAndInvalidate];
     
     
     });
     
     */
    
}


@end
