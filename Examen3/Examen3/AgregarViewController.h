//
//  AgregarViewController.h
//  Examen3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgregarViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nombreTF;

@property (weak, nonatomic) IBOutlet UITextField *razaTF;
@property (weak, nonatomic) IBOutlet UITextField *edadTF;
@property (weak, nonatomic) IBOutlet UITextField *vacunaTF;
@property (weak, nonatomic) IBOutlet UIImageView *imageMascota;

- (IBAction)cargarFoto:(id)sender;

- (IBAction)buscarButton:(id)sender;

- (IBAction)agregarVacuna:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)guardarButton:(id)sender;

@end
