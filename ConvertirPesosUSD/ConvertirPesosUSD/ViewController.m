//
//  ViewController.m
//  ConvertirPesosUSD
//
//  Created by Maria Montserrat Lozano on 22/01/14.
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
    
    self.imagenDolar.image = [UIImage imageNamed:@"money-bag-hi.png"];
    
    UITapGestureRecognizer *tap =
                                [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(quitarTeclado)];
    
    [self.view addGestureRecognizer:tap];
    
}

//quitar el keyboard dados los textfields que lo invocan.
-(void)quitarTeclado {
    
    [self.tipoCambioTF resignFirstResponder];
    [self.pesosTF resignFirstResponder];
    //[self.view endEditing:YES]; tambien se puede
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertirButton:(id)sender {
    
    if([self.tipoCambioTF.text isEqualToString:@""] || [self.pesosTF.text isEqualToString:@""])
    {
        UIAlertView *error = [[UIAlertView alloc]
                          initWithTitle:@"ERROR"
                          message:@"Datos inválidos"
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles: nil]; //crear objeto
        //inicializar ...delegate(el que va responder es yo misma)
        [error show];
    }else{
    
        //metodo instancia doublevalue
        CGFloat tc = [self.tipoCambioTF.text doubleValue];
        CGFloat pesos = [self.pesosTF.text doubleValue];
        CGFloat dolar = pesos/tc;
        self.dolaresTF.text=[NSString stringWithFormat:@"%0.2f", dolar]; //con 2 decimales float
    
    }
}
@end
