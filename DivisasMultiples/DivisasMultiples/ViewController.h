//
//  ViewController.h
//  DivisasMultiples
//
//  Created by Maria Montserrat Lozano on 03/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;

- (IBAction)segmentAction:(id)sender;

- (IBAction)converitrButton:(id)sender;

- (IBAction)tasaConvertir:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *tasa;

@property (strong, nonatomic) IBOutlet UITextField *pesosTF;
@property (strong, nonatomic) IBOutlet UITextField *cambioTF;
@property (strong, nonatomic) IBOutlet UILabel *cambioLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
