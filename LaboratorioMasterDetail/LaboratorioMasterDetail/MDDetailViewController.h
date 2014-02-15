//
//  MDDetailViewController.h
//  LaboratorioMasterDetail
//
//  Created by Maria Montserrat Lozano on 15/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
