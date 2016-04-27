//
//  ViewController.m
//  FormValidator
//
//  Created by Tom Williamson on 4/26/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "ViewController.h"
#import "FormValidator.h"

@interface ViewController () {
    
    NSArray *validDict;
    
}

@end

@implementation ViewController


//
//  read the form validation dictionary and create a form validator
//
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"valid" ofType:@"json"];
    
    validDict = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    self.formValidator = [FormValidator initWithDictionary:validDict];
   
}


//
//  see if this field is valid and set the next field if
//  it is
//
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    BOOL ok = [self.formValidator validateField:textField];

    if (self.formValidator.nextField != 0) {
        
        UITextField *newField = (UITextField *)[self.view viewWithTag:self.formValidator.nextField];
            
        [textField resignFirstResponder];
        [newField becomeFirstResponder];
        
    }
    
    return YES;
        
}

@end
