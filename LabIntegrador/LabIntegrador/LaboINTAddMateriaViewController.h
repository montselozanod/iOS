//
//  LaboINTAddMateriaViewController.h
//  LabIntegrador
//
//  Created by Maria Montserrat Lozano on 26/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LaboINTAddMateriaViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *claveTF;

@property (weak, nonatomic) IBOutlet UITextField *nombreTF;

- (IBAction)saveButton:(id)sender;

@end
