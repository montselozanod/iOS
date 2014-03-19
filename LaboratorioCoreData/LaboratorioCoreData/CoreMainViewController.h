//
//  CoreMainViewController.h
//  LaboratorioCoreData
//
//  Created by Maria Montserrat Lozano on 19/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MATAppDelegate.h"

@interface CoreMainViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UITextField *claveTF;

@property (weak, nonatomic) IBOutlet UITextField *nombreTF;

@property (weak, nonatomic) IBOutlet UILabel *estatusLabel;

- (IBAction)guardarButton:(id)sender;
- (IBAction)buscarButton:(id)sender;


@end
