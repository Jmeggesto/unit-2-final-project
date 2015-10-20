//
//  FoodFeedDetailViewController.m
//  FoodbLog
//
//  Created by Ayuna Vogel on 10/18/15.
//  Copyright © 2015 Ayuna Vogel. All rights reserved.
//

#import "FoodFeedDetailViewController.h"

@interface FoodFeedDetailViewController ()

@property (nonatomic) IBOutlet UIImageView* imageView;
@property (nonatomic) IBOutlet UITextView* textView;

@end

@implementation FoodFeedDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.textView.text = self.textViewCaption;
    
    
}


@end
