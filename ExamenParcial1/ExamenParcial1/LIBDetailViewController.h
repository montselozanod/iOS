//
//  LIBDetailViewController.h
//  ExamenParcial1
//
//  Created by Maria Montserrat Lozano on 24/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LIBDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *tituloLabel;
@property (weak, nonatomic) IBOutlet UILabel *isbnLabel;
@property (weak, nonatomic) IBOutlet UILabel *cantLabel;
@property (weak, nonatomic) IBOutlet UILabel *fechaLabel;

@property (weak, nonatomic) IBOutlet UIWebView *imagenWebView;

@end
