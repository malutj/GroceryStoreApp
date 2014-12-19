//
//  ViewController.m
//  GroceryStoreApp
//
//  Created by Jason Malutich on 12/18/14.
//  Copyright (c) 2014 Jason Malutich. All rights reserved.
//

#import "ViewController.h"
#import "ServerCommManager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) ServerCommManager *commManager;

@end

@implementation ViewController

-(void)viewDidLoad{
    NSLog(@"View did load");
    self.commManager = [[ServerCommManager alloc]init];
}

- (IBAction)LoginButtonClicked:(UIButton *)sender {
    NSString *user = self.username.text;
    NSString *pw = self.password.text;
    if([user length]==0 || [pw length]==0){
        NSLog(@"Attempt to login with no username and/or password");
        return;
    }
    
    [self.commManager LoginWithUsername:user AndPassword:pw];
}

@end
