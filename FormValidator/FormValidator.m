//
//  FormValidator.m
//  FormValidator
//
//  Created by Tom Williamson on 4/26/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "FormValidator.h"

@implementation FormValidator

-(BOOL) validateName:(NSString*)nameString {
    
    return [[nameString componentsSeparatedByString:@" "] count] > 1;
    
}
-(BOOL) validateAddress:(NSString*)addressString{
    
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

@end
