//
//  LaboINTAddLibroViewController.h
//  LabIntegrador
//
//  Created by Maria Montserrat Lozano on 26/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LaboINTAddLibroViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *tituloTF;

@property (weak, nonatomic) IBOutlet UITextField *isbnTF;
- (IBAction)saveButton:(id)sender;

@end
