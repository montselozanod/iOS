//
//  MDDetailViewController.h
//  LaboratorioProtocolo
//
//  Created by Maria Montserrat Lozano on 17/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Perfil.h"

@interface MDDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *nombreLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;

@property (weak, nonatomic) IBOutlet UILabel *emailLabel;


@end
