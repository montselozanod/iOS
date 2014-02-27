//
//  plistMasterViewController.m
//  Laboratorioplist
//
//  Created by Maria Montserrat Lozano on 26/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "plistMasterViewController.h"

#import "plistDetailViewController.h"
#import "Libro.h"

@interface plistMasterViewController () {
    NSMutableArray *libros;
}
@end

@implementation plistMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void) cargaLibrosPlist{

    //te dice path de acceso al archivo de la aplicación
    NSBundle *miBundle = [NSBundle mainBundle];
    //ahora tienes que decir que te traiga archivo plist
    
    NSString *path = [miBundle pathForResource:@"Libroplist" ofType:@"plist" ];
    
    //arreglo de diccionarios
    NSMutableArray *misLibros = [NSMutableArray arrayWithContentsOfFile:path];
    
    for(int i = 0; i < misLibros.count; i++){
    
        [self insertNewObject:[misLibros objectAtIndex:i]];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;

   /* UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;*/
    
    [self cargaLibrosPlist];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//recibe en sender el diccionario que mando en carga
- (void)insertNewObject:(id)sender
{
    if (!libros) {
        libros = [[NSMutableArray alloc] init];
    }
    [libros insertObject: sender atIndex:0];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    
    //NSDate *object = libros[indexPath.row];
    
    NSDictionary *miDiccionario = libros[indexPath.row];
    
    Libro *object = [[Libro alloc]initWithTitle:[miDiccionario objectForKey: @"titulo"] isbn:[[miDiccionario objectForKey: @"isbn"] longLongValue] cantidad:[[miDiccionario objectForKey: @"cantidad"] integerValue] urlImage: [[NSString alloc]initWithFormat:@"http://content-3.powells.com/cgi-bin/imageDB.cgi?isbn=%@", [miDiccionario objectForKey:@"isbn"]]];
    
    cell.textLabel.text = object.titulo;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lli", object.isbn];
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
        
        NSDictionary *miDiccionario = libros[indexPath.row];
        
        Libro *object = [[Libro alloc]initWithTitle:[miDiccionario objectForKey: @"titulo"] isbn:[[miDiccionario objectForKey: @"isbn"] longLongValue] cantidad:[[miDiccionario objectForKey: @"cantidad"] integerValue] urlImage: [[NSString alloc]initWithFormat:@"http://content-3.powells.com/cgi-bin/imageDB.cgi?isbn=%@", [miDiccionario objectForKey:@"isbn"]]];
        
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
