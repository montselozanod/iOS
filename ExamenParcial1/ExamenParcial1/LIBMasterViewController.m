//
//  LIBMasterViewController.m
//  ExamenParcial1
//
//  Created by Maria Montserrat Lozano on 24/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LIBMasterViewController.h"

#import "LIBDetailViewController.h"
#import "LIBAgregarViewController.h"
#import "LIBLibro.h"

@interface LIBMasterViewController () {
    NSMutableArray *libros;
}
@end

@implementation LIBMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateFormat = @"MM/dd/yyyy";
    NSDate *fech1 = [format dateFromString:@"04/29/2006"];
    NSDate *fech2 = [format dateFromString:@"04/02/2006"];
    
    LIBLibro *temp1 = [[LIBLibro alloc] initWithName:@"ios programming cookbook" num:9781449372422 cant:3 fecha:fech1];
    
    LIBLibro *temp2 = [[LIBLibro alloc] initWithName:@"Beginning iOS 4 Application Development" num:9780470918029 cant:1 fecha:fech2];
    
    
     libros = [[NSMutableArray alloc] init];
    
    [libros addObject:temp1];
    [libros addObject:temp2];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    LIBLibro *object = libros[indexPath.row];
    cell.textLabel.text = object.titulo;
    
    NSString *isbn = [[NSString  alloc] initWithFormat:@"%lli", object.isbn];
   
 
    cell.detailTextLabel.text = isbn;
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
        NSDate *object = libros[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }else if([[segue identifier] isEqualToString:@"agregar"]){
        
        LIBAgregarViewController *dest = [segue destinationViewController];
        dest.delegado = self;
    }
}


- (void) agregarLibro: (NSString *) titulo isbn: (long long) isb cantidad: (NSInteger) cant fecha:(NSDate *)fecha{
    
    
    if (!libros) {
        libros = [[NSMutableArray alloc] init];
    }
    
    LIBLibro *temp = [[LIBLibro alloc]initWithName:titulo num:isb cant:cant fecha:fecha]; //creo objeto
    
    [libros addObject:temp];
    
    //no se ve cambio hasta que se redibuja la vista
    [self.tableView reloadData];

}

-(void) removerVista
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

@end
