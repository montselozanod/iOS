//
//  SETFlipsideViewController.h
//  AppSettings
//
//  Created by Maria Montserrat Lozano on 24/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SETFlipsideViewController;

@protocol SETFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(SETFlipsideViewController *)controller;
@end

@interface SETFlipsideViewController : UIViewController

@property (weak, nonatomic) id <SETFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
