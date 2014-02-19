//
//  MDAddViewController.m
//  LaboratorioProtocolo
//
//  Created by Maria Montserrat Lozano on 17/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "MDAddViewController.h"

@interface MDAddViewController ()

@end

@implementation MDAddViewController

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

- (IBAction)doneButton:(id)sender {
    
    
    [self.delegado agregarPerfil:self.nombreTF.text telefono:[self.telTF.text integerValue] correo:self.emailTF.text];
    [self.delegado removerVista];
}
@end
