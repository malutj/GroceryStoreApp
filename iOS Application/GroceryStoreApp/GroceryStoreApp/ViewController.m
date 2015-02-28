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
@property (weak, nonatomic) IBOutlet UILabel *response;
@property (strong, nonatomic) ServerCommManager *commManager;

@end

@implementation ViewController

-(void)viewDidLoad{
    NSLog(@"View did load");
    _commManager = [[ServerCommManager alloc]init];
}

- (IBAction)LoginButtonClicked:(UIButton *)sender {
    NSString *user = self.username.text;
    NSString *pw = self.password.text;
    if([user length]==0 || [pw length]==0){
        NSLog(@"Attempt to log in with no username and/or password");
        return;
    }
    NSString *returnMessage;
    
    BOOL loginSuccessful = [_commManager LoginWithUsername:user
                                               AndPassword:pw
                                          AndReturnMessage:&returnMessage];
    
    if (loginSuccessful)
    {
        _response.text = returnMessage;
    }
    else
    {
        _response.text = returnMessage;
    }
}

@end
