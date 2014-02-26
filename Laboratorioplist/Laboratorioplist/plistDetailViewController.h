//
//  plistDetailViewController.h
//  Laboratorioplist
//
//  Created by Maria Montserrat Lozano on 26/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface plistDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *tituloLabel;

@property (weak, nonatomic) IBOutlet UILabel *isbnLabel;

@property (weak, nonatomic) IBOutlet UILabel *cantidadLabel;
@property (weak, nonatomic) IBOutlet UIWebView *imagenWebView;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
