//
//  KPCGamesCollection.h
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/20/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class KPCGame;

@interface KPCGamesCollection : NSObject

+(instancetype)sharedGamesCollection;

-(void)addGameInCollectionWithGameID:(NSString *) gameID gameName:(NSString *)gameName gameIconUrl:(NSString *)gameIconUrl gameIconData:(UIImage *)gameIconImage;


-(void)addGameInCollectionWithGameID:(NSString *) gameID gameName:(NSString *)gameName gameIconUrl:(NSString *)gameIconUrl;

-(KPCGame *)gameAtIndex:(NSInteger)index;

-(NSArray *)fetchAllGames;

-(void)clearGamesCollection;

@end
