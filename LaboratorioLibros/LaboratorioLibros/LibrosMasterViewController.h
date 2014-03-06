//
//  LibrosMasterViewController.h
//  LaboratorioLibros
//
//  Created by Maria Montserrat Lozano on 03/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibrosMasterViewController : UITableViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (strong, nonatomic) NSString *palabraClave;

//empezar la conexion al servicio web
@property NSURLConnection *conexion;

//NSDATA es un conjunto de bytes (de cualquier tipo de archivo) que estas recibiendo de servidor

@property NSMutableData *responseData;

@end
