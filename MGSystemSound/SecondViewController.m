//
//  SecondViewController.m
//  MGSystemSound
//
//  Created by Gabriele Merlonghi on 18/08/13.
//  Copyright (c) 2013 Gabriele Merlonghi. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Insert Sound", @"Insert Sound");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark Action Methods

- (IBAction)playSystemSound:(id)sender {
    
    [self.fieldCode resignFirstResponder];
    
    NSString *string = self.fieldCode.text;
    
    int SoundID = [string intValue];
    
    if ((SoundID < 1000) || (SoundID > 1351)){
        self.textFeedback.text = @"You have to insert a number from 1000 to 1351";
        return;
    }
    
    if (SoundID == 0) {
        SoundID = 1000;
    }
    
    AudioServicesPlaySystemSound(SoundID);
    
    self.textFeedback.text = @"You plaing the indicated SoundID";
    
    
    NSLog(@"AudioServicesPlaySystemSound: %i", SoundID);
    
}


@end
