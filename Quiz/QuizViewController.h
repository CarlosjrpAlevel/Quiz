//
//  QuizViewController.h
//  Quiz
//
//  Created by Kevin Reid on 17/03/2014.
//  Copyright (c) 2014 com.carlos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIButton *buttonOptionA;


@property (weak, nonatomic) IBOutlet UIButton *buttonOptionB;

@property (weak, nonatomic) IBOutlet UIButton *buttonOptionC;

@property (weak, nonatomic) IBOutlet UIButton *buttonOptionD;






@property (weak, nonatomic) IBOutlet UIButton *buttonStartQuiz;

//@property (weak, nonatomic) IBOutlet UILabel *labelQuizQuestion;



@property (weak, nonatomic) IBOutlet UILabel *labelScore;


@property (weak, nonatomic) IBOutlet UILabel *labelScoreCaption;


@property (weak, nonatomic) IBOutlet UILabel *labelQuestionNumberCaption;

@property (weak, nonatomic) IBOutlet UILabel *labelQuestionID;


@property (weak, nonatomic) IBOutlet UITextView *textViewQuizQuestion;



-(void)hideOrShowElements:(bool)isVisible;


- (IBAction)startQuiz:(id)sender;

-(void)setQuestion:(int)recordID;


- (IBAction)ButtonOptions:(id)sender;





@end
