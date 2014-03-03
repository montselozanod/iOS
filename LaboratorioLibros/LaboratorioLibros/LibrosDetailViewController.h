//
//  LibrosDetailViewController.h
//  LaboratorioLibros
//
//  Created by Maria Montserrat Lozano on 03/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibrosDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *tituloDetail;
@property (weak, nonatomic) IBOutlet UILabel *isbnDetail;
@property (weak, nonatomic) IBOutlet UILabel *fechaDetail;
@property (weak, nonatomic) IBOutlet UILabel *cantidadDetail;
@property (weak, nonatomic) IBOutlet UIWebView *imagenDetail;

@end
