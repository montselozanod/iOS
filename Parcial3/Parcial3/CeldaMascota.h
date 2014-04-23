//
//  CeldaMascota.h
//  Parcial3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CeldaMascota : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *razaTF;
@property (weak, nonatomic) IBOutlet UILabel *edadTF;
@property (weak, nonatomic) IBOutlet UIImageView *foto;
@property (weak, nonatomic) IBOutlet UILabel *nombreLabel;

@end
