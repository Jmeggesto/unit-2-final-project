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
@property (weak, nonatomic) IBOutlet UILabel *dishNameLabel;

@end

@implementation FoodLogDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    self.dishNameLabel.text = self.foodLogObject.name;
    self.restaurantNameLabel.text = self.foodLogObject.restaurantName;
    
    self.foodLogDescription.text = self.foodLogObject.notes;
    // Note: if the object has a recipe saved, it should display the recipe text in the self.foodLogDescription.text

    PFFile *imageFile = self.foodLogObject.image;
    
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!data) {
            return NSLog(@"%@", error);
        }

        self.foodLogImageView.image = [UIImage imageWithData:data];
    
    }];

    
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
