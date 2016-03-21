//
//  NSString+Additions.m
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/19/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)


///--------------------------------------
#pragma mark - Query String Constructor
///--------------------------------------
- (NSString *)stringByAppendingQueryParameters:(NSDictionary *)parameters {
    if (!parameters) {
        return self;
    }
    
    NSArray *allKeys = [parameters allKeys];
    NSArray *allValues = [parameters allValues];
    
    NSString *theSring = self;

    theSring = [theSring stringByAppendingString:@"/?"];
    
    for (int i = 0; i < allKeys.count; i++) {
        
     theSring = [[[theSring stringByAppendingString:[allKeys objectAtIndex:i]] stringByAppendingString:@"="] stringByAppendingString:[allValues objectAtIndex:i]];
       
        if (i < allKeys.count - 1) {
            
            theSring = [theSring stringByAppendingString:@"&"];
        }
    }

    return theSring;
}

@end
