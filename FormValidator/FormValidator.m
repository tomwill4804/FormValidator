//
//  FormValidator.m
//  FormValidator
//
//  Created by Tom Williamson on 4/26/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "FormValidator.h"

@implementation FormValidator

//
//  create a new instance and save the passed form validation
//  dictionary address:
//
+(FormValidator*)initWithDictionary:(NSArray*) dictionary;
{
    
    FormValidator *form = [[FormValidator alloc] init];
    form.validDict = dictionary;
    
    return form;
    
}


//
//  validate the passed field using the form validation dictionary
//
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
    
    if (self.fieldDictionary) {
        
        //
        //  minimum field length
        //
        NSInteger len = [self.fieldDictionary[@"minlength"] intValue];
        if (len > 0 && len < textField.text.length) {
            self.valid = NO;
            self.errorMessage = @"field is too short";
        }
        
        //
        //  max field length
        //
        len = [self.fieldDictionary[@"maxlength"] intValue];
        if (len > textField.text.length) {
            self.valid = NO;
            self.errorMessage = @"field is too long";
        }

        //
        //  min words
        //
        len = [self.fieldDictionary[@"minwords"] intValue];
        if (len > 0 && len < [[textField.text componentsSeparatedByString:@" "] count]) {
            self.valid = NO;
            self.errorMessage = @"not enough words";
        }
        
        //
        //  max words
        //
        len = [self.fieldDictionary[@"maxwords"] intValue];
        if (len > [[textField.text componentsSeparatedByString:@" "] count]) {
            self.valid = NO;
            self.errorMessage = @"too enough words";
        }


        
    }
    
    return self.valid;
    
}



-(BOOL) isAddress:(NSString*)addressString{
    
    
    NSTextCheckingType dectorType = NSTextCheckingTypeAddress;
    
    NSError* error;
    
    NSDataDetector * dataDetector = [NSDataDetector dataDetectorWithTypes:dectorType error:&error];
    
    __block BOOL rc = NO;
    
    [dataDetector enumerateMatchesInString:addressString options:kNilOptions range:NSMakeRange(0, [addressString length]) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        rc = YES;
    }];
    
    return rc;
    
}

-(BOOL) isZipCode:(NSString*)zipString{
    
    BOOL rc =NO;
    NSCharacterSet * set = [NSCharacterSet characterSetWithCharactersInString:@"1234567890"];
    
    set = [set invertedSet];
    
    NSRange myRange =[zipString rangeOfCharacterFromSet:set];
    
    rc =(myRange.location == NSNotFound);
    
    rc = ([zipString length]==5) && rc;
    
    return rc;
    
}


@end
