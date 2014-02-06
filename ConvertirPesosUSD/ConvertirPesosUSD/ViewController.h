//
//  ViewController.h
//  ConvertirPesosUSD
//
//  Created by Maria Montserrat Lozano on 22/01/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *tipoCambioTF;

@property (strong, nonatomic) IBOutlet UITextField *pesosTF;
@property (strong, nonatomic) IBOutlet UITextField *dolaresTF;

- (IBAction)convertirButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imagenDolar;

@end
