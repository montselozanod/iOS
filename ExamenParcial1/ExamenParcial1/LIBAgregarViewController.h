//
//  LIBAgregarViewController.h
//  ExamenParcial1
//
//  Created by Maria Montserrat Lozano on 24/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LIBLibro.h"
#import "LIBProto.h"

@interface LIBAgregarViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *isbnTF;

@property (weak, nonatomic) IBOutlet UITextField *tituloTF;

@property (weak, nonatomic) IBOutlet UITextField *cantTF;

@property (weak, nonatomic) IBOutlet UIWebView *imagenWebView;

@property (weak, nonatomic) IBOutlet UIStepper *cantStepper;

- (IBAction)changeValueStepper:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *fecha;

@property (strong, nonatomic) id <LIBProto> delegado;

- (IBAction)doneButton:(id)sender;

- (IBAction)imageButton:(id)sender;

@property long long isbn;
@property NSString *titulo;
@property NSInteger cant;

@end
