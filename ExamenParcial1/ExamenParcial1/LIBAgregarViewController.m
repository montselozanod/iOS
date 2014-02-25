//
//  LIBAgregarViewController.m
//  ExamenParcial1
//
//  Created by Maria Montserrat Lozano on 24/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LIBAgregarViewController.h"

@interface LIBAgregarViewController ()

@end

@implementation LIBAgregarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap =   [[UITapGestureRecognizer alloc]
                                     initWithTarget:self
                                     action:@selector(quitarTeclado)];
    
    [self.view addGestureRecognizer:tap];
    
    self.cantStepper.autorepeat = YES;
    self.cantStepper.minimumValue = 0;
    self.cant = self.cantStepper.value;
    self.cantTF.text = [NSString stringWithFormat: @"%d",self.cant];
}

-(void)quitarTeclado {
    
    [self.view endEditing:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButton:(id)sender {
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateFormat = @"MM/dd/yyyy";
    NSDate *fech1 = [format dateFromString:self.fecha.text];
    
    [self.delegado agregarLibro: self.tituloTF.text isbn:[self.isbnTF.text longLongValue] cantidad:[self.cantTF.text integerValue] fecha:fech1];
    
    [self.delegado removerVista];
    
}

- (IBAction)imageButton:(id)sender {
    
    self.isbn = [self.isbnTF.text longLongValue];
    
    NSString *strURL = [[NSString alloc] initWithFormat:@"http://content-3.powells.com/cgi-bin/imageDB.cgi?isbn=%lli", self.isbn];
    NSURL *imageURL = [NSURL URLWithString:strURL];
    NSURLRequest *imageRequest = [NSURLRequest requestWithURL:imageURL];
    
    [self.imagenWebView loadRequest:imageRequest];
   
}
- (IBAction)changeValueStepper:(id)sender {
    
    self.cant = self.cantStepper.value;
    self.cantTF.text = [NSString stringWithFormat:@"%d", self.cant];
}
@end
