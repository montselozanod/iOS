//
//  MDMasterViewController.m
//  LaboratorioMasterDetail
//
//  Created by Maria Montserrat Lozano on 15/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "MDMasterViewController.h"

#import "MDDetailViewController.h"

@interface MDMasterViewController () {
    NSMutableArray *perfiles;
  
}
@end

@implementation MDMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    /*UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;*/
    NSMutableArray *nombre = [[NSMutableArray alloc] initWithObjects: @"Montse", @"Carlos", @"Fany", @"Neni", @"Mapy", @"Marce", @"Neto",nil];
    
    NSMutableArray *email = [[NSMutableArray alloc] initWithObjects:@"mmontse.lozano@gmail.com", @"carlos.dieck@gmail.com", @"estefania_641@hotmail.com", @"neni_blue@hotmail.com", @"mapy.dieck@gmail.com", @"marce.quintanilla@gmail.com", @"er177@gmail.com", nil];

    perfiles = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < [nombre count]; i++){
    
        NSDictionary *miPerf = [[NSDictionary alloc] initWithObjectsAndKeys:[nombre objectAtIndex:i], @"nombre", [email objectAtIndex:i], @"email", nil];
        
        [perfiles addObject:miPerf];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void)insertNewObject:(id)sender
{
    if (!nombre) {
        nombre = [[NSMutableArray alloc] init];
    }
    [nombre insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}*/

//data source manejan los datos del contenido de la tabla
//delegate maneja caracteristicas de la tabla

#pragma mark - Table View

//seccionar tablas
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return perfiles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDictionary *object = perfiles[indexPath.row]; //el objeto que seleccionaste
    cell.textLabel.text = [object objectForKey:@"nombre"];
    cell.detailTextLabel.text = [object objectForKey:@"email"];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [perfiles removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *object = perfiles[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
