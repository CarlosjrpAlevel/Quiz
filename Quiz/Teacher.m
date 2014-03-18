//
//  Teacher.m
//  Quiz
//
//  Created by Carlos Reinoso on 18/03/2014.
//  Copyright (c) 2014 com.carlos. All rights reserved.
//

#import "Teacher.h"
#import "DatabasePath.h"
#import <sqlite3.h>

@implementation Teacher

@synthesize userName;
@synthesize password;

- (bool)Login:(Teacher*)teacher
{
    // Setup the database object
    sqlite3 *database;
    BOOL found = false;
    
    
    DatabasePath *obj =[[DatabasePath alloc]init];
    NSString *databasePath=obj.dbPath;
    
    const char *sql = "SELECT * FROM Teacher where userName =? and password =?";
    sqlite3_stmt *statement;
    
    
    // Open the database from the users filessystem
    if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
        
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
            
            sqlite3_bind_text(statement, 1, [teacher.userName UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 2, [teacher.password UTF8String], -1, SQLITE_TRANSIENT);
            
            if(sqlite3_step(statement) == SQLITE_ROW) {
                // Read the data from the result row
                
                found = true;
                
                NSLog(@"Password on file");
                teacher.userName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
                teacher.password = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
                NSLog(@"User name: %@.", teacher.userName);
                NSLog(@"Pasword: %@.", teacher.password);
                
            }
        }
        // Release the compiled statement from memory
        sqlite3_finalize(statement);
        sqlite3_close(database);
        

    }
    if(found == true)
    {
        
    }else{
        
        found = false;
    }
    
    teacher = nil;
    return found;
        
}

@end
