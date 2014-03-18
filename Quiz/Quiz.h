//
//  Quiz.h
//  Quiz
//
//  Created by Kevin Reid on 17/03/2014.
//  Copyright (c) 2014 com.carlos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quiz : NSObject

@property (nonatomic,strong) NSString* question;
@property (nonatomic,strong) NSString* optionA;
@property (nonatomic,strong) NSString* optionB;
@property (nonatomic,strong) NSString* optionC;
@property (nonatomic,strong) NSString* optionD;
@property (nonatomic,strong) NSString* correctAnswer;
@property int questionID;
@property int score;

@property (nonatomic,strong)  NSMutableArray *questions;


- (NSMutableArray*)quizQuestions;

//- (Quiz*)quizQuestions;

@end
