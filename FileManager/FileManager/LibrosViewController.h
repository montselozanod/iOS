//
//  LibrosViewController.h
//  FileManager
//
//  Created by Maria Montserrat Lozano on 12/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibrosViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nombreTF;

@property (weak, nonatomic) IBOutlet UITextField *emailTF;

- (IBAction)registrarButton:(id)sender;

- (IBAction)guardarButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tabla;



@end
