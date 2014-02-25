//
//  XYZToDoListViewController.h
//  ToDoList
//
//  Created by Maria Montserrat Lozano on 21/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYZToDoItem.h"

@interface XYZToDoListViewController : UITableViewController

-(IBAction)unwindToList:(UIStoryboardSegue *)segue;

@end
