//
//  LaboINTAddMateriaViewController.h
//  LabIntegrador
//
//  Created by Maria Montserrat Lozano on 26/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LaboINTProtocoloGuardar.h"

@interface LaboINTAddMateriaViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *claveTF;

@property (weak, nonatomic) IBOutlet UITextField *nombreTF;

@property (weak, nonatomic) IBOutlet UITextField *isbnTF;

@property (weak, nonatomic) IBOutlet UILabel *statusTF;

@property (strong, nonatomic) id <LaboINTProtocoloGuardar> delegado;

- (IBAction)saveButton:(id)sender;

- (IBAction)buscarLibro:(id)sender;

- (IBAction)agregarLibro:(id)sender;

//poner tablview

@property (weak, nonatomic) IBOutlet UITableView *tableViewLibro;

@property (weak, nonatomic) IBOutlet UITableViewCell *tableViewLibroCell;

@end
