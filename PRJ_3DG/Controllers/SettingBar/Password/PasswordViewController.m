//
//  PasswordViewController.m
//  PRJ_3DG
//
//  Created by mac on 14-4-3.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "PasswordViewController.h"

@interface PasswordViewController ()<UIGestureRecognizerDelegate>
{
    UITapGestureRecognizer * _tapGesture;
}
@end

@implementation PasswordViewController

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
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"修改密码";

    self.view.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tap];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return NO;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{

}


- (void)tapAction:(UITapGestureRecognizer *)gesture
{
    [self.passwordConfirm resignFirstResponder];
    [self.passwordNew resignFirstResponder];
    [self.passwordOld resignFirstResponder];
}

@end
