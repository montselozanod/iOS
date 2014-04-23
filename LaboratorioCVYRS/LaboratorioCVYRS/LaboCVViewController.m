//
//  LaboCVViewController.m
//  LaboratorioCVYRS
//
//  Created by Maria Montserrat Lozano on 09/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LaboCVViewController.h"

@interface LaboCVViewController ()

@end

@implementation LaboCVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *nombre = (NSString *)self.detalle;
    self.nombreLabel.text = nombre;
    self.imagen.image = [UIImage imageNamed:nombre];

    self.tamañoLabel.text = [[NSString alloc ]initWithFormat:@"%0.0f x %0.0f", self.imagen.frame.size.width, self.imagen.frame.size.height];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendTweet:(id)sender {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetController = [SLComposeViewController
                                                    composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        //set the initial text message
        [tweetController setInitialText:@"Receta del día!!"];
        [tweetController addImage:self.imagen.image];
        
        //present the controller to the user
        [self presentViewController:tweetController animated:YES completion:nil];
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"twitter Error"
                                  message:@"You may not have set up twitter service on your device or\n                                  You may not connected to internent.\nPlease check ..."
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles: nil];
        [alertView show];
        
    }

  
}

- (IBAction)sendPostFB:(id)sender {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController *fbComposer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        //set the initial text message
        [fbComposer setInitialText:@"Receta del día!!"];
        [fbComposer addImage: self.imagen.image];
        
        //present the composer to the user
        [self presentViewController:fbComposer animated:YES completion:nil];
        
    }else {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Facebook Error"
                                  message:@"You may not have set up facebook service on your device or\n                                  You may not connected to internent.\nPlease check ..."
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles: nil];
        [alertView show];
        
    }

    
    
}
@end
