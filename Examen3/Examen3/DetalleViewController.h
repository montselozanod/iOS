//
//  DetalleViewController.h
//  Examen3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nombreLabel;

@property (weak, nonatomic) IBOutlet UILabel *razaLabel;


@property (weak, nonatomic) IBOutlet UILabel *edadLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageMascota;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)ordenarFecha:(id)sender;


- (IBAction)ordenarVacuna:(id)sender;



@end
