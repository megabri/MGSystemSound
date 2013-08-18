//
//  FirstViewController.h
//  MGSystemSound
//
//  Created by Gabriele Merlonghi on 18/08/13.
//  Copyright (c) 2013 Gabriele Merlonghi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, retain) NSDictionary *soundList;

@property (nonatomic, retain) NSMutableArray *soundIDList;


@end
