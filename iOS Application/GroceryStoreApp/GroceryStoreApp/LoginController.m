//
//  LoginController.m
//  GroceryStoreApp
//
//  Created by Jason Malutich on 12/18/14.
//  Copyright (c) 2014 Jason Malutich. All rights reserved.
//

#import "LoginController.h"
#import "ServerCommManager.h"

@interface LoginController ()

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UILabel *response;
@property (strong, nonatomic) ServerCommManager *commManager;

@end

@implementation LoginController

-(void)viewDidLoad{
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

- (IBAction)EditingDidBegin:(UITextField *)sender {
    sender.text = @"";
    sender.textColor = [UIColor blackColor];
    sender.font = [UIFont systemFontOfSize:15];
}

- (IBAction)EditingDidEnd:(UITextField *)sender {
    if ([sender.text isEqual:@""]){
        NSLog(@"restoring defaults");
        [self RestoreFieldToDefault:sender];
    }
}

- (void)RestoreFieldToDefault:(UITextField *)field {
    if ([field isEqual:_username]){
        NSLog(@"setting username field text");
        field.text = @" USERNAME";
    }
    else{
        NSLog(@"setting password field text");
        field.text = @" PASSWORD";
    }
    
    field.textColor = [UIColor colorWithRed:149/255.0f green:149/255.0f blue:149/255.0f alpha:1];
    field.font = [UIFont italicSystemFontOfSize:18];
}


@end
