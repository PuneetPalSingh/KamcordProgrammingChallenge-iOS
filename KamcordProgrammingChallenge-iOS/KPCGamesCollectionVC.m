//
//  GamesCollectionVC.m
//  KamcordProgrammingChallenge-iOS
//
//  Created by Puneet Pal Singh on 3/18/16.
//  Copyright © 2016 Puneet Pal Singh. All rights reserved.
//

#import "GamesCollectionVC.h"
#import "GamesCollectionCellView.h"

@interface GamesCollectionVC () <UICollectionViewDataSource,UICollectionViewDelegate> {
    
    NSArray *_dataArray;
    
}

@end

@implementation GamesCollectionVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataArray = [NSArray arrayWithObjects:@"image1.png",@"image2.png",@"image3.png",@"image4.png",@"image5.png",@"image6.png",@"image7.png",@"image8.png",@"image9.png",@"image10.png",@"image11.png", nil];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _dataArray.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = @"GamesCell";
    
    
    GamesCollectionCellView *gamesCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if(gamesCell == nil)
    {
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        gamesCell = [[[NSBundle mainBundle] loadNibNamed:@"GamesCollectionCellView" owner:self options:nil] objectAtIndex:0];
        
        
    }
    
    gamesCell.gamesTitleTextView.text = [_dataArray objectAtIndex:indexPath.row];
    
    return gamesCell;
    

    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    // Adjust cell size for orientation
    if (orientation == UIDeviceOrientationPortrait) {
        return CGSizeMake(self.view.frame.size.width / 3.5, self.view.frame.size.width / 3.0);
    }
    return CGSizeMake(self.view.frame.size.width / 6.0, self.view.frame.size.width / 5.8);
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self.collectionView performBatchUpdates:nil completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
