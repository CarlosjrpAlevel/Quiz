//
//  TeacherLoginViewController.m
//  Quiz
//
//  Created by Kevin Reid on 17/03/2014.
//  Copyright (c) 2014 com.carlos. All rights reserved.
//

#import "TeacherLoginViewController.h"
#import "TestViewController.h"
#import "Teacher.h"
#import "QuizViewController.h"
#import "ViewController.h"


@interface TeacherLoginViewController ()

@end

@implementation TeacherLoginViewController

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


- (void)showSuccessfulLogin {
    //should go to TeacherFunctionsViewController
}
    
    


- (IBAction)Login:(id)sender {
    Teacher *teacher = [[Teacher alloc]init];
    
    teacher.userName= textFieldUserName.text;
    teacher.password= textFieldPassword.text;
    
    
    if([teacher Login:teacher]==true)
    {
        
        [self showSuccessfulLogin];
        
    }else{
        
        _labelErrorMessage.text=@"User name or password not found";
        
    }
    
    teacher = nil;
    
}
@end
