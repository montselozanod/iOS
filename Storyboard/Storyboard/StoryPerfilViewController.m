//
//  StoryPerfilViewController.m
//  Storyboard
//
//  Created by Maria Montserrat Lozano on 12/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "StoryPerfilViewController.h"

@interface StoryPerfilViewController ()

@end

@implementation StoryPerfilViewController

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

-(IBAction)unwindImageInfo:(UIStoryboardSegue*)segue
{

}

-(IBAction)unwindPersonalData:(UIStoryboardSegue*)segue
{
    self.nombreLabel.text = self.nombre;
    self.emailLabel.text = self.email;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([[segue identifier] isEqualToString:@"info"]){
    
        StoryImageInfoViewController *viewInfo = [segue destinationViewController];
        viewInfo.ancho = self.imagen.frame.size.width;
        viewInfo.alto = self.imagen.frame.size.height;
        
    }else{
        
        StoryPersonalDataViewController *editar = [segue destinationViewController];
        editar.nombre = self.nombreLabel.text;
        editar.email = self.emailLabel.text;
       
    }

}

@end
