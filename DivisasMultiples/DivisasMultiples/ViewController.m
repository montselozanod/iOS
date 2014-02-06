//
//  ViewController.m
//  DivisasMultiples
//
//  Created by Maria Montserrat Lozano on 03/02/14.
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
    
    self.view.backgroundColor = [UIColor colorWithRed:255/255.0f green:195/255.0f blue:42/255.0f alpha:1.0f];
    
    self.imageView.image = [UIImage imageNamed:@"usa.jpg"];
    
    [self.tasa setHidden:TRUE];
    
    UITapGestureRecognizer *tap =   [[UITapGestureRecognizer alloc]
                                    initWithTarget:self
                                     action:@selector(quitarTeclado)];
    
    [self.view addGestureRecognizer:tap];
    
}

-(void)quitarTeclado {
    
    [self.view endEditing:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentAction:(id)sender {
    
    switch(self.segmentControl.selectedSegmentIndex){
        case 0: self.cambioLabel.text = @"Dólares"; self.tasa.text=@"13.30"; self.cambioTF.text =@""; self.imageView.image = [UIImage imageNamed:@"usa.jpg"]; break;
        case 1: self.tasa.text=@"21.91"; self.cambioLabel.text= @"Libras"; self.cambioTF.text =@""; self.imageView.image = [UIImage imageNamed:@"uk.jpg"];break;
        case 2: self.tasa.text=@"17.81"; self.cambioLabel.text = @"Euros";self.cambioTF.text =@""; self.imageView.image = [UIImage imageNamed:@"euro.gif"];break;
        case 3: self.tasa.text=@"0.13"; self.cambioLabel.text = @"Yenes"; self.cambioTF.text =@""; self.imageView.image = [UIImage imageNamed:@"jap.jpg"];break;
        default: self.tasa.text=@"13.30"; self.cambioLabel.text = @"Doláres"; self.cambioTF.text =@""; self.imageView.image = [UIImage imageNamed:@"usa.jpg"]; break;
    }
}

- (IBAction)converitrButton:(id)sender {
    
    if([self.pesosTF.text isEqualToString:@""])
    {
        UIAlertView *error = [[UIAlertView alloc]
                              initWithTitle:@"ERROR"
                              message:@"Datos inválidos"
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles: nil];
        [error show];
    }else{
        
        CGFloat pesos = [self.pesosTF.text doubleValue];
        CGFloat tc;
        CGFloat change;
        
        switch (self.segmentControl.selectedSegmentIndex) {
            
            case 0: tc = 13.3; break;
            case 1: tc= 21.91; break;
            case 2: tc = 17.89; break;
            case 3: tc = 0.13; break;
            default: tc = 13.3; break;
            
        }
        
        change = pesos/tc;
        
        self.cambioTF.text=[NSString stringWithFormat:@"%0.2f", change]; //con 2 decimales float
        
    }
    
    //dolar = 13.3
    //libra = 21.91
    //euro = 17.89
    //yen = 0.13
}

- (IBAction)tasaConvertir:(id)sender {
    
    BOOL estado = [sender isOn];
    if(estado){
        [self.tasa setHidden:FALSE];
    }else if(!estado){
        [self.tasa setHidden:TRUE];
    }
}

@end
