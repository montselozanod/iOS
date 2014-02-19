//
//  MDAddViewController.h
//  LaboratorioProtocolo
//
//  Created by Maria Montserrat Lozano on 17/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProtoPerfil.h"

@interface MDAddViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nombreTF;

@property (weak, nonatomic) IBOutlet UITextField *telTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;

//propiedad que te diga quien es el delegado...no se implementa protocolo para que ejecute los metodos que estan en root...osea en master asi se le dice quien va reaccionar al evento

@property (strong, nonatomic) id <ProtoPerfil> delegado;

- (IBAction)doneButton:(id)sender;

@end
