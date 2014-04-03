//
//  PasswordViewController.h
//  PRJ_3DG
//
//  Created by mac on 14-4-3.
//  Copyright (c) 2014年 Mr. All rights reserved.
//

#import "BaseViewController.h"

@interface PasswordViewController : BaseViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *passwordOld;
@property (weak, nonatomic) IBOutlet UITextField *passwordNew;
@property (weak, nonatomic) IBOutlet UITextField *passwordConfirm;


@end
