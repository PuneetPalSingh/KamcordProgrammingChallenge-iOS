//
//  KPCGamesCollectionVC.h
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/18/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol collectionViewDelegate <NSObject>

-(void)collectionViewDidFinishLoadingDataDelegate;

@end

@interface KPCGamesCollectionVC : UICollectionViewController

@property (nonatomic,strong) IBOutlet UICollectionView *gamesCollectionView;
@property (nonatomic,weak) id<collectionViewDelegate> delegate;

@end
