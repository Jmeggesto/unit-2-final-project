//
//  FoodFeedViewController.m
//  FoodbLog
//
//  Created by Jovanny Espinal on 10/12/15.
//  Copyright © 2015 Ayuna Vogel. All rights reserved.
//

#import "FoodFeedViewController.h"
#import "FoodFeedCustomCVC.h"
#import <QuartzCore/QuartzCore.h>
#import <AFNetworking/AFNetworking.h>
#import "FoodFeedObject.h"
#import <SDWebImage/UIImageView+WebCache.h>












@interface FoodFeedViewController ()  <UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate>

    @property (nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@property (nonatomic) NSMutableArray* instagramResultsArray;
@property (nonatomic) NSMutableArray* recipeResultsArray;


@property (nonatomic) IBOutlet UISegmentedControl* segmentedControl;
@property (nonatomic) NSString* instagramSearchString;
@property (nonatomic) NSString* recipeSearchString;


@end

@implementation FoodFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.segmentedControl addTarget:self
                         action:@selector(controlEventForSegmentedControlChange)
               forControlEvents:UIControlEventValueChanged];
    self.instagramSearchString = @"foodporn";
    self.recipeSearchString = @"pizza";
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    
    [self instagramRequestForString:@"foodporn"];
    
    self.searchTextField.inputAccessoryView = [[UIView alloc] init];
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [self.instagramResultsArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FoodFeedCustomCVC *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"testCell" forIndexPath:indexPath];
    
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 10;
    
    if(self.segmentedControl.selectedSegmentIndex == 0){
    
    FoodFeedObject* objectForCell = self.instagramResultsArray[indexPath.row];
    
    
    [cell.foodImage sd_setImageWithURL:[NSURL URLWithString:objectForCell.imageURLString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        cell.foodImage.image = image;
    

    }];
    } else {
        
        FoodFeedObject* objectForCell = self.recipeResultsArray[indexPath.row];
        [cell.foodImage sd_setImageWithURL:[NSURL URLWithString:objectForCell.imageURLString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            cell.foodImage.image = image;
            
            
        }];
        
        
        
    }
    
    
    
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

-(void)instagramRequestForString:(NSString*)string
{
    
    
    NSString* urlString = [NSString stringWithFormat:@"https://api.instagram.com/v1/tags/%@/media/recent?client_id=ac0ee52ebb154199bfabfb15b498c067", string];
    
    AFHTTPRequestOperationManager* manager = [[AFHTTPRequestOperationManager alloc]init];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSArray* results = responseObject[@"data"];
        
        self.instagramResultsArray = [[NSMutableArray alloc]init];
        
        for(NSDictionary* result in results){
            
            FoodFeedObject* resultObject = [[FoodFeedObject alloc]init];
            
            resultObject.imageURLString = result[@"images"][@"standard_resolution"][@"url"];
            resultObject.caption = result[@"caption"][@"text"];
            
            [self.instagramResultsArray addObject:resultObject];
            
            
            
            
        }
        
        [self.collectionView reloadData];
        
        
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"you fucking dingus");
        
    }];
    
    
}
-(void)recipeRequestForString:(NSString*)string
{

    
    

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}



#pragma mark - Navigation


-(void)controlEventForSegmentedControlChange
{
    
    if([self.segmentedControl selectedSegmentIndex] == 0){
        
        [self instagramRequestForString:self.instagramSearchString];
        
        
        
    } else {
        
        [self recipeRequestForString:self.recipeSearchString];
        
        
    }
    
}


@end
