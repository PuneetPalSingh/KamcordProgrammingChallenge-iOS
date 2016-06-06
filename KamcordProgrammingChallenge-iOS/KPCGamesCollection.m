//
//  KPCGamesCollection.m
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/20/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import "KPCGamesCollection.h"
#import "KPCGame.h"

@interface KPCGamesCollection ()

@property (nonatomic,strong) NSMutableArray *games;

@end

@implementation KPCGamesCollection

-(instancetype)initWithGames{
    if (self = [super init]) {
        _games = [[NSMutableArray alloc]init];
    }
    return self;
}

+ (instancetype)sharedGamesCollection
{
    static KPCGamesCollection *_sharedGamesCollection = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedGamesCollection = [[self alloc] initWithGames];
    });
    return _sharedGamesCollection;
}

-(void)addGameInCollectionWithGameID:(NSString *) gameID gameName:(NSString *)gameName gameIconUrl:(NSString *)gameIconUrl gameIconData:(UIImage *)gameIconImage{
    
    KPCGame *newGame = [[KPCGame alloc]initWithGameID:gameID gameName:gameName gameIconUrl:gameIconUrl gameIconImage:gameIconImage];
    [_games addObject:newGame];
}

-(void)addGameInCollectionWithGameID:(NSString *) gameID gameName:(NSString *)gameName gameIconUrl:(NSString *)gameIconUrl{
    
    KPCGame *newGame = [[KPCGame alloc]initWithGameID:gameID gameName:gameName gameIconUrl:gameIconUrl gameIconImage:nil];
    [_games addObject:newGame];
}

-(KPCGame *)gameAtIndex:(NSInteger)index{
    return [_games objectAtIndex:index];
}
-(NSArray *)fetchAllGames{
    return (NSArray *)_games;
}

-(void)clearGamesCollection{
    [_games removeAllObjects];
}

@end
