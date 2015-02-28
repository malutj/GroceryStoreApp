//
//  RegisterController.m
//  GroceryStoreApp
//
//  Created by Jason Malutich on 2/28/15.
//  Copyright (c) 2015 Jason Malutich. All rights reserved.
//

#import "RegisterController.h"

@interface RegisterController()
@property (weak, nonatomic) IBOutlet UITextField *first_name;
@property (weak, nonatomic) IBOutlet UITextField *last_name;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *password2;
@property (weak, nonatomic) IBOutlet UILabel *feedback;

@end

@implementation RegisterController

-(void)viewDidLoad{
    NSLog(@"Register view loaded");
}
- (IBAction)CancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)RegisterButtonPressed:(id)sender {
    if([self ValidationPassed]){
        //send registration post request
    }
}


- (BOOL)ValidationPassed{
    _Bool pass = true;
    pass = pass && [self CheckField:_first_name];
    pass = pass && [self CheckField:_last_name];
    pass = pass && [self CheckField:_email];
    pass = pass && [self CheckField:_username];
    pass = pass && [self CheckField:_password];
    pass = pass && [self CheckField:_password2];
    
    if (!pass){
        _feedback.text = @"All fields required";
        return false;
    }
    
    pass = [self CheckEmail:_email];
    if (!pass){
        _feedback.text = @"Enter a valid email address";
        return false;
    }
    
    pass = [self ComparePassword:_password AndOtherPassword:_password2];
    
    if(!pass){
        _feedback.text = @"Passwords don't match";
        return false;
    }
    
    return true;
}

-(BOOL)CheckField:(UITextField *)field{
    if ([field.text isEqual:@""]){
        field.layer.borderColor = [[UIColor redColor] CGColor];
        return false;
    }
    
    return true;
}

-(BOOL)CheckEmail:(UITextField *)field{
    if (! ([field.text containsString:@"."] &&
           [field.text containsString:@"@"])){
        field.layer.borderColor = [[UIColor redColor] CGColor];
        return false;
    }
    
    return true;
}

-(BOOL)ComparePassword:(UITextField *)p1 AndOtherPassword:(UITextField *)p2{
    if (![p1.text isEqual:p2.text]){
        p1.layer.borderColor = [[UIColor redColor] CGColor];
        p2.layer.borderColor = [[UIColor redColor] CGColor];
        
        return false;
    }

    return true;
}

- (IBAction)ResetField:(UITextField *)sender {
    sender.layer.borderColor = [[UIColor clearColor]CGColor];
    
    _feedback.text = @"";
}


@end