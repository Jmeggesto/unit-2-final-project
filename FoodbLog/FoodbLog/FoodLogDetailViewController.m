//
//  FoodLogDetailViewController.m
//  FoodbLog
//
//  Created by Ayuna Vogel on 10/18/15.
//  Copyright © 2015 Ayuna Vogel. All rights reserved.
//

#import "FoodLogDetailViewController.h"

@interface FoodLogDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *foodLogImageView;
@property (weak, nonatomic) IBOutlet UILabel *restaurantNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *foodLogDescription;

@end

@implementation FoodLogDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    NSString *name;
//    @property (nonatomic, strong) PFFile *image;
//    @property (nonatomic, strong) NSString *restaurantName;
//    @property (nonatomic, strong) NSString *recipeName;

    self.foodLogDescription.text = self.foodLogObject.notes;
    self.restaurantNameLabel.text = self.foodLogObject.restaurantName;
    
//    UIImage *foodLogImageToBeDisplayed = self.foodLogImageView.image;
//    // Convert to JPEG with 50% quality
//    NSData* data = UIImageJPEGRepresentation(foodLogImageToBeSaved, 0.5f);
//    PFFile *foodLogImage = [PFFile fileWithData:data contentType:@"image/png"];
//    
//    
//    
//    
//    self.foodLogImageView.image = self.foodLogObject.image;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
