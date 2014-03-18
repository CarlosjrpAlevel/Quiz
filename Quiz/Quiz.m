//
//  Quiz.m
//  Quiz
//
//  Created by Kevin Reid on 17/03/2014.
//  Copyright (c) 2014 com.carlos. All rights reserved.
//

#import "Quiz.h"

#import <sqlite3.h> // Import the SQLite database framework
#import "DatabasePath.h"

@implementation Quiz


@synthesize question;
@synthesize optionA;
@synthesize optionB;
@synthesize optionC;
@synthesize optionD;
@synthesize correctAnswer;
@synthesize score;
@synthesize questions;
@synthesize questionID;


-(NSMutableArray*)quizQuestions{
    
    // Setup the database object
	sqlite3 *database;
	BOOL found=false;
	
	const char *sql;
    Quiz *quiz=nil;
	
	sql = "Select * from Questions";
	
	sqlite3_stmt *statement;//sql select statement

    
    
    DatabasePath *obj =[[DatabasePath alloc]init];
    NSString *databasePath=obj.dbPath;
    
    questions= [NSMutableArray arrayWithCapacity:20];
   
	
	// Open the database from the users filessytem
    
    if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		
		if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
			
			//sqlite3_bind_text(statement, 1, [[self getSystemDate] UTF8String], -1, SQLITE_TRANSIENT);
			
			while(sqlite3_step(statement) == SQLITE_ROW) {
				// Read the data from the result row
                
                 NSLog(@"TEST@");
				
				found=true;
                
               
              quiz=[[Quiz alloc]init];
                
                quiz.questionID = sqlite3_column_int(statement,0);
                NSLog(@"ID %i", quiz.questionID);
                
				quiz.question = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
                NSLog(@"Question: %@.", quiz.question);
                
                
				
				//store  coursework date
				quiz.optionA = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
                NSLog(@"OptionA: %@.", quiz.optionA);
                
                
                quiz.optionB = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 3)];
                NSLog(@"OptionB: %@.", quiz.optionB);
                
                quiz.optionC = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 4)];
                NSLog(@"OptionC: %@.", quiz.optionC);
                
                quiz.optionD = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 5)];
                NSLog(@"OptionD: %@.", quiz.optionD);
                
                quiz.correctAnswer= [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 6)];
                NSLog(@"Correct Answer: %@.", quiz.correctAnswer);
                
                
                  [questions addObject:quiz];
                
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(statement);
		sqlite3_close(database);
	}
    
    
      NSLog(@"Array SIZE %i ", [questions count]); //display integer value to the console
    
    
    return questions;
    
}


@end
