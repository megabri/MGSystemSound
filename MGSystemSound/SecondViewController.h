//
//  SecondViewController.h
//  MGSystemSound
//
//  Created by Gabriele Merlonghi on 18/08/13.
//  Copyright (c) 2013 Gabriele Merlonghi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *fieldCode;
@property (strong, nonatomic) IBOutlet UITextView *textFeedback;

- (IBAction)playSystemSound:(id)sender;

@end
