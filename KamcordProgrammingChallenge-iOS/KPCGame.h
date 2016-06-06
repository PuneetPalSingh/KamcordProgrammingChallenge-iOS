//
//  KPCGame.h
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/20/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KPCGame : NSObject

@property (nonatomic,strong) NSString* gameID;
@property (nonatomic,strong) NSString *gameName;
@property (nonatomic,strong) NSString *gameIconUrl;
@property (nonatomic,strong) UIImage *gameIconImage;

-(instancetype)initWithGameID:(NSString *) gameID gameName:(NSString *)gameName gameIconUrl:(NSString *)gameIconUrl gameIconImage:(UIImage *)gameIconImage;
@end
