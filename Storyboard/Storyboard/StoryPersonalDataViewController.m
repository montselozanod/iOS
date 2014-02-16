//
//  StoryPersonalDataViewController.m
//  Storyboard
//
//  Created by Maria Montserrat Lozano on 12/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "StoryPersonalDataViewController.h"

@interface StoryPersonalDataViewController ()

@end

@implementation StoryPersonalDataViewController

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
	self.nombreTF.text = self.nombre;
    self.emailTF.text = self.email;
    
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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    StoryPerfilViewController *inicio = [segue destinationViewController];
    
    if(sender == self.doneButton){
        inicio.nombre = self.nombreTF.text;
        inicio.email = self.emailTF.text;
    }

    
}

@end
