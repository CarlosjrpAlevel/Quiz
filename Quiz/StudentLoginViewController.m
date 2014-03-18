//
//  StudentViewController.m
//  Quiz
//
//  Created by Kevin Reid on 17/03/2014.
//  Copyright (c) 2014 com.carlos. All rights reserved.
//

#import "StudentLoginViewController.h"
#import "QuizViewController.h"
#import "Student.h"


@interface StudentLoginViewController ()

@end

@implementation StudentLoginViewController


@synthesize textFieldPassword;
@synthesize textFieldUserName;

@synthesize labelErrorMessage = _labelErrorMessage;

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
    
    
      _labelErrorMessage.text=@"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)showQuiz
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    QuizViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"QuizViewController"];
    [self presentViewController:viewController animated:YES completion:nil];
    
    
}


- (IBAction)Login:(id)sender {
    
    Student *student=[[Student alloc]init];
    
    student.userName=textFieldUserName.text;
    student.password=textFieldPassword.text;
    
    
    if([student Login:student]==true)
    {
    
        [self showQuiz];
    
    }else{
        
      _labelErrorMessage.text=@"User name or password not found";
        
    }
    
    student=nil;
    
}

@end
