//
//  ServerCommManager.h
//  GroceryStoreApp
//
//  Created by Jason Malutich on 12/18/14.
//  Copyright (c) 2014 Jason Malutich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerCommManager : NSObject

-(void)LoginWithUsername:(NSString*)username AndPassword:(NSString*)password;

@end
