//
//  LaboINTDetalleLibroViewController.h
//  LabIntegrador
//
//  Created by Maria Montserrat Lozano on 26/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LaboINTDetalleLibroViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *tituloLabel;


@property (weak, nonatomic) IBOutlet UILabel *isbnLabel;

@property (strong, nonatomic) id objetoMostrar;

@end
