//
//  GamesCollectionCellView.h
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/18/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamesCollectionCellView : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *gamesIconImageView;
@property (weak, nonatomic) IBOutlet UITextView *gamesTitleTextView;

@end
