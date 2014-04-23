//
//  LaboCVViewController.h
//  LaboratorioCVYRS
//
//  Created by Maria Montserrat Lozano on 09/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@interface LaboCVViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nombreLabel;
@property (weak, nonatomic) IBOutlet UILabel *tamañoLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imagen;

@property (strong, nonatomic) id detalle;

- (IBAction)sendTweet:(id)sender;

- (IBAction)sendPostFB:(id)sender;


@end
