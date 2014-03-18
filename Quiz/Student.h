//
//  Student.h
//  Quiz
//
//  Created by Kevin Reid on 17/03/2014.
//  Copyright (c) 2014 com.carlos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

{
    
 
}

//@property (nonatomic,strong) NSString *databaseName;//database name on the device
//@property (nonatomic,strong)NSString *databasePath;//database path on the device
@property (nonatomic,strong)NSString *userName;
@property(nonatomic,strong)NSString *password;

- (bool)Login:(Student*)student;






@end
