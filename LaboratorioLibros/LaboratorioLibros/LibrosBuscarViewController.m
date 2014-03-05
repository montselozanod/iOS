//
//  LibrosBuscarViewController.m
//  LaboratorioLibros
//
//  Created by Maria Montserrat Lozano on 05/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LibrosBuscarViewController.h"
#import "LibrosMasterViewController.h"

@interface LibrosBuscarViewController ()

@end

@implementation LibrosBuscarViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"buscar"]) {
        //enviar palabra clave
        //transferir un dato a otro controlador
        
        LibrosMasterViewController *destino = [segue destinationViewController];
       
        destino.palabraClave = self.buscarTF.text;
        
    }
}

@end
