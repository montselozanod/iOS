//
//  ViewController.h
//  Hello
//
//  Created by Maria Montserrat Lozano on 20/01/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//la interfaz (atributos y metodos)

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nombreTF;

@property (strong, nonatomic) IBOutlet UILabel *mensajeLabel;

- (IBAction)saludoButton:(id)sender;

- (IBAction)removeKeyboard:(id)sender;

@end
