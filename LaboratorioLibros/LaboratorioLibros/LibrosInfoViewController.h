//
//  LibrosInfoViewController.h
//  LaboratorioLibros
//
//  Created by Maria Montserrat Lozano on 09/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibrosInfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *descripText;

@property (weak, nonatomic) IBOutlet UILabel *editorLabel;
@property (weak, nonatomic) IBOutlet UITextView *autorText;


@property (strong, nonatomic) id detailItem;

@end
