//
//  Teacher.h
//  Quiz
//
//  Created by Carlos Reinoso on 18/03/2014.
//  Copyright (c) 2014 com.carlos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject {
    
}

@property (nonatomic,strong)NSString *userName;
@property (nonatomic,strong)NSString *password;

- (bool)Login:(Teacher*)teacher;



@end
