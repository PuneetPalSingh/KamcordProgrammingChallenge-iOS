//
//  KPCGame.m
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/20/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import "KPCGame.h"

@implementation KPCGame


-(instancetype)initWithGameID:(NSString *) gameID gameName:(NSString *)gameName gameIconUrl:(NSString *)gameIconUrl gameIconImage:(UIImage *)gameIconImage{
    
    if (self = [super init]) {
        
        _gameID = gameID;
        _gameName = gameName;
        _gameIconUrl = gameIconUrl;
        _gameIconImage = gameIconImage;
        
    }
    
    return self;
}

@end
