//
//  RestaurantPickerTableViewController.m
//  FoodbLog
//
//  Created by Jovanny Espinal on 10/15/15.
//  Copyright © 2015 Ayuna Vogel. All rights reserved.
//

#import "RestaurantPickerTableViewController.h"

@interface RestaurantPickerTableViewController ()

@end

@implementation RestaurantPickerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.restaurantNames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RestaurantNameCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.restaurantNames[indexPath.row];
    
   
    
    return cell;
}

@end
