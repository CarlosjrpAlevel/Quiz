//
//  Student.m
//  Quiz
//
//  Created by Kevin Reid on 17/03/2014.
//  Copyright (c) 2014 com.carlos. All rights reserved.
//

#import "Student.h"
#import "DatabasePath.h"
#import <sqlite3.h> // Import the SQLite database framework

@implementation Student





@synthesize userName;
@synthesize password;



- (bool)Login:(Student*)student
{
    // Setup the database object
    sqlite3 *database;
    BOOL found=false;
    
    
    DatabasePath *obj =[[DatabasePath alloc]init];
    NSString *databasePath=obj.dbPath;
    
    const char *sql = "SELECT * FROM Users where userName =? and password =?";
    sqlite3_stmt *statement;
    
    
    // Open the database from the users filessytem
    if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
        
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
            
            sqlite3_bind_text(statement, 1, [student.userName UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 2, [student.password UTF8String], -1, SQLITE_TRANSIENT);
            
            if(sqlite3_step(statement) == SQLITE_ROW) {
                // Read the data from the result row
                
                found=true;
                
                NSLog(@"Password on file");
                student.userName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
                student.password = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
                NSLog(@"User name: %@.", student.userName);
                NSLog(@"Pasword: %@.", student.password);
                
            }
        }
        // Release the compiled statement from memory
        sqlite3_finalize(statement);
        sqlite3_close(database);
        
    }
    if(found==true)
    {
        
        
    }else{
    
        found=false;
    }
    
    student=nil;
    return found;
}







/*
- (void)ABC {
    
    
    // Setup the database object
	sqlite3 *database;
	BOOL found=false;
	
	const char *sql;
	
	sql = "select * from Users";
	
	sqlite3_stmt *statement;//sql select statement
	NSString *coursework;//store coursework name
    
    

    databaseName = @"test.db";
    
    // Get the path to the documents directory and append the databaseName
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    databasePath = [documentsDir stringByAppendingPathComponent:databaseName];
    
	
    
	
	// Open the database from the users filessytem
    
    if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		
		if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
			
			//sqlite3_bind_text(statement, 1, [[self getSystemDate] UTF8String], -1, SQLITE_TRANSIENT);
			
			while(sqlite3_step(statement) == SQLITE_ROW) {
				// Read the data from the result row
				
				found=true;
                
                int recId = sqlite3_column_int(statement,0);
                NSLog(@"ID %i", recId);
                
				coursework = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
                NSLog(@"Coursework: %@.", coursework);
                
                
				
				//store  coursework date
				NSString *dates = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
                NSLog(@"Date: %@.", dates);
                
                
                
                
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(statement);
		sqlite3_close(database);
	}
	
}
*/









@end
