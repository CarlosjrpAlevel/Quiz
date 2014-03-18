//
//  DatabasePath.m
//  Quiz
//
//  Created by Kevin Reid on 17/03/2014.
//  Copyright (c) 2014 com.carlos. All rights reserved.
//

#import "DatabasePath.h"

@implementation DatabasePath


@synthesize databaseName;
@synthesize databasePath;


-(NSString*)dbPath
{
    
    databaseName = @"Game.db";
    
    // Get the path to the documents directory and append the databaseName
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    databasePath = [documentsDir stringByAppendingPathComponent:databaseName];
    
    return databasePath;
}

@end
