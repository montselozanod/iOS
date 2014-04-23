//
//  LaboINTDetalleMateriaViewController.h
//  LabIntegrador
//
//  Created by Maria Montserrat Lozano on 26/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LaboINTDetalleMateriaViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *claveLabel;
@property (weak, nonatomic) IBOutlet UILabel *nombreLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableViewLibro;
@property (strong, nonatomic) id objetoMostrar;
@end
