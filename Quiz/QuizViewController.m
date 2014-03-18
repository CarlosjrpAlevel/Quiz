//
//  QuizViewController.m
//  Quiz
//
//  Created by Kevin Reid on 17/03/2014.
//  Copyright (c) 2014 com.carlos. All rights reserved.
//

#import "QuizViewController.h"
#import "ViewController.h"
#import "Quiz.h"

@interface QuizViewController ()

@property(nonatomic,strong) NSMutableArray  *questions;

@end

@implementation QuizViewController


@synthesize buttonOptionA;
@synthesize buttonOptionB;
@synthesize buttonOptionC;
@synthesize buttonOptionD;
@synthesize labelScore;
@synthesize labelScoreCaption;
@synthesize labelQuestionID;
@synthesize labelQuestionNumberCaption;
//@synthesize labelQuizQuestion;
@synthesize textViewQuizQuestion;
@synthesize buttonStartQuiz;
@synthesize questions;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self hideOrShowElements:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)dispalyMainMenu:(id)sender {

    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    ViewController *mainMenuViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainMenu"];
    // Push View Controller onto Navigation Stack
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
    
    



}



-(void)hideOrShowElements:(bool)isVisible
{
    buttonOptionA.hidden=isVisible;
    buttonOptionB.hidden=isVisible;
    buttonOptionC.hidden=isVisible;
    buttonOptionD.hidden=isVisible;
    labelScore.hidden=isVisible;
    labelScoreCaption.hidden=isVisible;
    labelQuestionID.hidden=isVisible;
    labelQuestionNumberCaption.hidden=isVisible;
    textViewQuizQuestion.hidden=isVisible;
   // labelQuizQuestion.hidden=isVisible;
    
}




- (IBAction)ButtonOptions:(id)sender
{
    
    UIButton *button = (UIButton *)sender;
    
    
   
    
    NSLog(@"Clicked button: %@",[[button titleLabel] text]);
    
    
    
    
    int nextRecord = [labelQuestionID.text intValue];
    
    if(nextRecord<=[questions count])
    {
    nextRecord++;
    
    
     [self setQuestion:nextRecord];
    }
}



-(void)setQuestion:(int)recordID
{
    
    Quiz *quiz =[[Quiz alloc]init];
    
   questions = [NSMutableArray arrayWithCapacity:20];
    
    questions = [quiz quizQuestions];
      Quiz *p=nil;
    
    for(int i=0; i< [questions count]; i++){
        
  
        
        p = (Quiz*)[questions objectAtIndex:i];
        
        if(p.questionID==recordID){
        
      //  NSLog(@"Question %@", [p question]); //display string value to the console
        //NSLog(@"Option A %@", [p optionA]);
        //NSLog(@"Option B %@", [p optionB]);
        //NSLog(@"Option C %@", [p optionC]);
        //NSLog(@"Option D %@", [p optionD]);
        //NSLog(@"Correct Answer %@", [p correctAnswer]);
        
        //NSLog(@"ID %i", [p questionID]); //display integer value to the console
        
            
            NSString* qid = [NSString stringWithFormat:@"%i", p.questionID];
            [buttonOptionA setTitle:p.optionA forState:UIControlStateNormal];
            [buttonOptionB setTitle:p.optionB forState:UIControlStateNormal];
            [buttonOptionC setTitle:p.optionC forState:UIControlStateNormal];
            [buttonOptionD setTitle:p.optionD forState:UIControlStateNormal];
          
        
            //labelScore.text;
            //labelScoreCaption.text;
            labelQuestionID.text=qid;
            //labelQuizQuestion.text=[p question];
            textViewQuizQuestion.text=[p question];
            
            
            return;
        
        }
        
        
        
    }
    

    
    
    
    
    
}


- (IBAction)startQuiz:(id)sender
{
    
    NSLog(@"Start Quiz");
    buttonStartQuiz.hidden=YES;
    [self hideOrShowElements:NO];
    
    [self setQuestion:1];
    
}

@end
