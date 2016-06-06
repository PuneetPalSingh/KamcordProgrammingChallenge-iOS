//
//  KPCGamesVC.m
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/18/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import "KPCGamesVC.h"
#import "KPCGamesCollectionVC.h"

@interface KPCGamesVC () <collectionViewDelegate>

@end

@implementation KPCGamesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _gamesCollectionContainerView.hidden = YES;
    [_loadingActivityIndicator startAnimating];
}

-(void)collectionViewDidFinishLoadingDataDelegate{
    [_loadingActivityIndicator stopAnimating];
     _gamesCollectionContainerView.hidden = NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"GamesCollectionVCEmbedSegue"]) {
        KPCGamesCollectionVC *gamesCollectionVC = segue.destinationViewController;
        gamesCollectionVC.delegate = self;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
