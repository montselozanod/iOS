//
//  XYZAddToDoItemViewController.m
//  ToDoList
//
//  Created by Maria Montserrat Lozano on 21/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "XYZAddToDoItemViewController.h"


@interface XYZAddToDoItemViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;



@end

@implementation XYZAddToDoItemViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    
    if(self.textfield.text.length > 0){
        
        self.toDoItem = [[XYZToDoItem alloc] init];
        self.toDoItem.itemName = self.textfield.text;
    }

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
