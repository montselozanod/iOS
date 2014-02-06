//
//  ViewController.h
//  Flores
//
//  Created by Maria Montserrat Lozano on 29/01/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentColor;

@property (strong, nonatomic) IBOutlet UISwitch *switchOutlet;

@property (strong, nonatomic) IBOutlet UIWebView *webViewPicture;

@property (strong, nonatomic) IBOutlet UIWebView *webViewInfo;

- (IBAction)switchDetails:(id)sender;

- (IBAction)buttonPicture:(id)sender;


@end
