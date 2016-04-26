//
//  ViewController.m
//  FormValidator
//
//  Created by Tom Williamson on 4/26/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "ViewController.h"
#import "FormValidator.h"

@interface ViewController () 

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.formValidator = [[FormValidator alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == self.nameTextField) {
        if ([self.formValidator validateName:textField.text]) {
            
            [self.nameTextField resignFirstResponder];
            [self.addressTextField becomeFirstResponder];
            return YES;
            
        }
        else
            return NO;
    }
    else
        return [self.formValidator validateAddress:textField.text];
    
}

@end
