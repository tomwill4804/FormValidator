//
//  ViewController.h
//  FormValidator
//
//  Created by Tom Williamson on 4/26/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormValidator.h"

@interface ViewController : UIViewController <UITextFieldDelegate>


@property (strong, nonatomic) FormValidator* formValidator;
@property (weak, nonatomic) IBOutlet UILabel* errorMessage;


@end

