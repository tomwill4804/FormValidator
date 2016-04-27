//
//  FormValidator.h
//  FormValidator
//
//  Created by Tom Williamson on 4/26/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FormValidator : NSObject

@property (strong, nonatomic) NSArray *validDict;

@property (strong, nonatomic) NSDictionary *fieldDictionary;
@property (strong, nonatomic) NSString *errorMessage;
@property                     BOOL valid;
@property                     NSInteger nextField;


+(FormValidator*)initWithDictionary:(NSArray*) dictionary;
-(BOOL)validateField:(UITextField*)textField;


//-(BOOL) validateName:(NSString*)nameString;

//-(BOOL) validateAddress:(NSString*)addressString;

//-(BOOL) isZipCode:(NSString*)codeString;

@end
