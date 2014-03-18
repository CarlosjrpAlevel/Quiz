//
//  DatabasePath.h
//  Quiz
//
//  Created by Kevin Reid on 17/03/2014.
//  Copyright (c) 2014 com.carlos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabasePath : NSObject


@property (nonatomic,strong) NSString* databaseName;
@property (nonatomic,strong) NSString* databasePath;


-(NSString*)dbPath;


@end
