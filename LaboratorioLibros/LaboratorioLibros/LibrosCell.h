//
//  LibrosCell.h
//  LaboratorioLibros
//
//  Created by Maria Montserrat Lozano on 03/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibrosCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIWebView *imagenCell;
@property (weak, nonatomic) IBOutlet UILabel *tituloCell;
@property (weak, nonatomic) IBOutlet UILabel *isbnCell;
@property (weak, nonatomic) IBOutlet UILabel *fechaCell;


@end
