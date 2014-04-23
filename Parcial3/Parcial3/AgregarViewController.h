//
//  AgregarViewController.h
//  Parcial3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocolo.h"

@interface AgregarViewController : UIViewController <UITableViewDataSource,UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *vacunaLabel;
@property (weak, nonatomic) NSString *imageName;

@property (weak, nonatomic) IBOutlet UITextField *nombreTF;
@property (weak, nonatomic) IBOutlet UIImageView *imagen;

@property (weak, nonatomic) IBOutlet UITextField *razaTF;
@property (weak, nonatomic) IBOutlet UITextField *edadTF;
@property (weak, nonatomic) IBOutlet UIImageView *fotoImage;
@property (weak, nonatomic) IBOutlet UITextField *nombreVacunaTF;

- (IBAction)cargarFoto:(id)sender;
- (IBAction)buscarVacuna:(id)sender;

- (IBAction)agregarVacuna:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableViewVacunas;

- (IBAction)agregarMascota:(id)sender;

@property id <Protocolo> delegado;

@end
