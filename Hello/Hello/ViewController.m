//
//  ViewController.m
//  Hello
//
//  Created by Maria Montserrat Lozano on 20/01/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saludoButton:(id)sender {
    
    self.mensajeLabel.hidden = NO;
    self.mensajeLabel.text = [NSString stringWithFormat: @"Salu2 %@", self.nombreTF.text];
    //tipo de formato %@ string
    //self.mensajeLabel.text = self.nombreTF.text;
}

- (IBAction)removeKeyboard:(id)sender {
    
    [self.nombreTF resignFirstResponder]; //quita el teclado cuando se termina de usar el textfield
}
@end
