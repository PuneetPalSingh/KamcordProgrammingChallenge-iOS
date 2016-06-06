//
//  KPCGamesCollectionCellView.m
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/18/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import "KPCGamesCollectionCellView.h"

@implementation KPCGamesCollectionCellView

- (void)awakeFromNib {
    // Initialization code

    _gamesIconImageView.layer.masksToBounds = YES;
    _gamesIconImageView.layer.cornerRadius = 15;

    self.layer.cornerRadius = 2;
    UIDevice* thisDevice = [UIDevice currentDevice];
    if(thisDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        _gamesTitleTextView.font = [UIFont systemFontOfSize:15];
    }
    self.layer.borderWidth = 1;
    self.layer.borderColor = [[UIColor lightGrayColor]CGColor];
}


@end
