//
//  LibrosMasterViewController.m
//  LaboratorioLibros
//
//  Created by Maria Montserrat Lozano on 03/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LibrosMasterViewController.h"

#import "LibrosDetailViewController.h"
#import "LibrosCell.h"

@interface LibrosMasterViewController () {
    NSMutableArray *libros;
}
@end

@implementation LibrosMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   // self.navigationItem.leftBarButtonItem = self.editButtonItem;

    /*UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;*/
    
    NSArray *misTitulos = [[NSArray alloc] initWithObjects:@"Libro 1", @"Libro 2", @"Libro 3", nil];
    NSArray *misISBN = [[NSArray alloc] initWithObjects:@"97804470018029", @"9781479211418", @"9781449372422", nil];
    NSArray *misFechas = [[NSArray alloc] initWithObjects:@"23 may 2012", @"10 feb 2000", @"1 dic 1999", nil];
    
    
    for(int i = 0; i < misTitulos.count; i++){
        
        
    
        NSDictionary *diccionario = [[NSDictionary alloc] initWithObjectsAndKeys: [misTitulos objectAtIndex:i], @"titulo", [misISBN objectAtIndex:i], @"isbn", [misFechas objectAtIndex:i], @"fecha", nil];
        [libros addObject:diccionario];
    }
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!libros) {
        libros = [[NSMutableArray alloc] init];
    }
    [libros insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return libros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LibrosCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDictionary *object = libros[indexPath.row];
    cell.tituloCell.text = [object objectForKey:@"titulo"];
    cell.isbnCell.text =[object objectForKey:@"isbn"];
    cell.fechaCell.text = [object objectForKey:@"fecha"];
    
    NSString *stringURL = [[NSString alloc]initWithFormat:@"http://content-3.powells.com/cgi-bim/imageDB.cgi?isbn=%@", [object objectForKey:@"isbn"]];
    NSURL *url = [[NSURL alloc] initWithString: stringURL];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [cell.imagenCell loadRequest:request];
    
    
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
        [libros removeObjectAtIndex:indexPath.row];
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
        NSDictionary *object = libros[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
