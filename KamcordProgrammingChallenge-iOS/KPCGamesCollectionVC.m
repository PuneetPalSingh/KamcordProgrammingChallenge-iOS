//
//  KPCGamesCollectionVC.m
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/18/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import "KPCGamesCollectionVC.h"
#import "KPCGamesCollectionCellView.h"
#import "KPCSessionManager.h"
#import "KPCHTTPURLRequestConstant.h"
#import "KPCGamesCollection.h"
#import "KPCGame.h"


#define CELLACTUALWIDTH 100
#define CELLACTUALHEIGHT 120

#define IPADCELLNUMBERSINROW 5
#define IPHONECELLNUMBERSINROW 3

#define IPADCELLNEWWIDTH(width) ((width / IPADCELLNUMBERSINROW) - 15)
#define IPADCELLNEWHEIGHT(width)(((width / IPADCELLNUMBERSINROW) * CELLACTUALHEIGHT) / CELLACTUALWIDTH)

#define IPHONECELLNEWWIDTH(width) ((width / IPHONECELLNUMBERSINROW) - 15)
#define IPHONECELLNEWHEIGHT(width)(((width / IPHONECELLNUMBERSINROW) * CELLACTUALHEIGHT) / CELLACTUALWIDTH)

static NSString* const gameCellIdentifier = @"GamesCell";

@interface KPCGamesCollectionVC () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) KPCGamesCollection *sharedGamesCollection;
@property (nonatomic,strong) NSString *pageNumber;
@property (nonatomic,assign, getter=isLoadingInProgress) BOOL loadingInProgress;
@end

@implementation KPCGamesCollectionVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //initialize
    self.pageNumber = @"0:0";
    self.loadingInProgress = NO;
    self.sharedGamesCollection = [KPCGamesCollection sharedGamesCollection];
    
    // Register Cell With reused identifier
    [self.gamesCollectionView registerNib:[UINib nibWithNibName:@"KPCGamesCollectionCellView" bundle:nil]   forCellWithReuseIdentifier:gameCellIdentifier];
    
    // Fetch data on start
    [self fetchGamesWithPageNumber:_pageNumber];
    
}


///--------------------------------------
#pragma mark - UIcollectionView DataSource
///--------------------------------------

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.sharedGamesCollection fetchAllGames].count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    KPCGamesCollectionCellView *gamesCell = [collectionView dequeueReusableCellWithReuseIdentifier:gameCellIdentifier forIndexPath:indexPath];
    gamesCell.layer.shouldRasterize = YES;
    gamesCell.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    KPCGame *game = [self.sharedGamesCollection gameAtIndex:indexPath.row];
    gamesCell.gamesTitleTextView.text = game.gameName;
    
    // if image already fetch else fetch it asynchronously
    if (game.gameIconImage) {
        gamesCell.gamesIconImageView.image = game.gameIconImage;
    }
    else{
        [self dowmloadImageForGameAsynchronously:game collectionViewCell:gamesCell];
    }
    return gamesCell;
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    // Load more data 10 cells before.
    
    if (([_sharedGamesCollection fetchAllGames].count - 10) == indexPath.row) {
        if (![self isLoadingInProgress]) {
            [self fetchGamesWithPageNumber:_pageNumber];
        }
    }
}

///--------------------------------------
#pragma mark - UIcollectionView Delegate
///--------------------------------------

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    KPCGame *game = [_sharedGamesCollection gameAtIndex:indexPath.row];
    if (game) {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:game.gameName message:[NSString stringWithFormat:@"You've selected %@, game with game_id:%@",game.gameName,game.gameID] preferredStyle:UIAlertControllerStyleAlert];
        [alertView addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
            //Ok Button Tapped
        }]];
        // Present alert view.
        [self presentViewController:alertView animated:YES completion:nil];
    }
}

///--------------------------------------
#pragma mark - UIcollectionView ViewLayout
///--------------------------------------

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width = self.view.frame.size.width;
    UIDevice* thisDevice = [UIDevice currentDevice];
    if(thisDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad){
        return CGSizeMake(IPADCELLNEWWIDTH(width), IPADCELLNEWHEIGHT(width));
    }
    else{
        return CGSizeMake(IPHONECELLNEWWIDTH(width), IPHONECELLNEWHEIGHT(width));
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10); // top, left, bottom, right
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [self.collectionView performBatchUpdates:nil completion:nil];
}

///--------------------------------------
#pragma mark - Private Methods
///--------------------------------------

-(void)fetchGamesWithPageNumber:(NSString *)pageNumber{
    KPCSessionManager *sessionManager = [KPCSessionManager sessionWithToken:KPCToken];
    
    NSURL *url = [NSURL URLWithString:KPCGamesUrl];
    self.loadingInProgress = YES;
    
    [sessionManager getRequestWithUrlInBackground:url parameters:@{@"count": @"20", @"page" : pageNumber} completionHandler:^(NSDictionary *parsedJsonData, NSError *error){
        
        if (!error) {
            self.pageNumber = parsedJsonData[@"next_page"];
            NSArray *data = [[NSArray alloc]initWithArray:parsedJsonData[@"card_models"]];
        
            for (NSDictionary *dictionary in data) {
                NSDictionary *gameDictionary = dictionary[@"game"];
                [self.sharedGamesCollection addGameInCollectionWithGameID:(NSString *)gameDictionary[@"id"] gameName:gameDictionary[@"name"]gameIconUrl:gameDictionary[@"icons"][@"regular"]];
            }
            [self.gamesCollectionView reloadData];

            static dispatch_once_t onceToken;
            dispatch_once (&onceToken, ^{
                [self.delegate collectionViewDidFinishLoadingDataDelegate];
            });
            self.loadingInProgress = NO;
        }
    }];
    
}

-(void)dowmloadImageForGameAsynchronously:(KPCGame *)game collectionViewCell:(KPCGamesCollectionCellView *)gameCell{
    
    KPCSessionManager *sessionManager = [KPCSessionManager createSession];
    [sessionManager downloadGameImageInBackground:game completionHandler:^(UIImage *image, NSError *error){
        game.gameIconImage = image;
        gameCell.gamesIconImageView.image = image;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
