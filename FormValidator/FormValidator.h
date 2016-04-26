//
//  FormValidator.h
//  FormValidator
//
//  Created by Tom Williamson on 4/26/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormValidator : NSObject

-(BOOL) validateName:(NSString*)nameString;

-(BOOL) validateAddress:(NSString*)addressString;

-(BOOL) isZipCode:(NSString*)codeString;

@end
