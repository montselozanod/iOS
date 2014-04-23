//
//  LaboINTDetalleLibroViewController.m
//  LabIntegrador
//
//  Created by Maria Montserrat Lozano on 26/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LaboINTDetalleLibroViewController.h"
#import "Libro.h"

@interface LaboINTDetalleLibroViewController ()

@end

@implementation LaboINTDetalleLibroViewController

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
    
    Libro *l = self.objetoMostrar;
    
    self.tituloLabel.text = l.titulo;
    self.isbnLabel.text = l.isbn;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
