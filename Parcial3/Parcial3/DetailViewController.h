//
//  DetailViewController.h
//  Parcial3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocolo.h"

@interface DetailViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nombreTF;
@property (weak, nonatomic) IBOutlet UILabel *razaTf;
@property (weak, nonatomic) IBOutlet UILabel *edadTF;
@property (weak, nonatomic) IBOutlet UITableView *tableViewVacunas;

- (IBAction)ordenarFecha:(id)sender;

- (IBAction)ordenarVacuna:(id)sender;

@property id <Protocolo> objetoMostrar;


@end
