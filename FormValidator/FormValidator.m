//
//  FormValidator.m
//  FormValidator
//
//  Created by Tom Williamson on 4/26/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "FormValidator.h"

@implementation FormValidator


+(FormValidator*)initWithDictionary:(NSArray*) dictionary;
{
    
    FormValidator *form = [[FormValidator alloc] init];
    form.validDict = dictionary;
    
    return form;
    
}

-(BOOL) validateName:(NSString*)nameString {
    
    return [[nameString componentsSeparatedByString:@" "] count] > 1;
    
}


-(BOOL)validateField:(UITextField*)textField {
    
    self.valid = YES;
    self.errorMessage = nil;
    self.nextField = 0;
    self.fieldDictionary = nil;
    
    NSInteger tag = textField.tag;
    for (NSDictionary* dict in self.validDict) {
        NSInteger dtag = [dict[@"tag"] intValue];
        if (dtag == tag) {
            self.fieldDictionary = dict;
            self.nextField = [self.fieldDictionary[@"nextfield"] intValue];
        }
    }
    
    return self.valid;
    
}


/*

-(BOOL) validateAddress:(NSString*)addressString{
    
    return [[nameString componentsSeparatedByString:@" "] count] > 1;
    
    NSTextCheckingType dectorType = NSTextCheckingTypeAddress;
    
    NSError* error;
    
    NSDataDetector * dataDetector = [NSDataDetector dataDetectorWithTypes:dectorType error:&error];
    
    __block BOOL rc = NO;
    
    [dataDetector enumerateMatchesInString:addressString options:kNilOptions range:NSMakeRange(0, [addressString length]) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        rc = YES;
    }];
    
    return rc;
    
}

-(BOOL) isZipCode:(NSString*)codeString{

    BOOL rc = NO;
    NSCharacterSet* set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    rc = ([codeString rangeOfCharacterFromSet:set].location != NSNotFound) &&
    ([codeString length] == 5);
    
    return rc;
    
}
 
*/

@end
