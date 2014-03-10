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

- (void) cargarDatosServicioWeb{

    NSString *stringURL= [[NSString alloc]initWithFormat:@"https://www.googleapis.com/books/v1/volumes?q=%@", self.palabraClave];
    NSURL *url = [[NSURL alloc]initWithString:stringURL];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60];
    //timeout es en segundos
    
    //empezar la conexion al servicio web
    self.conexion = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    //NSDATA es un conjunto de bytes (de cualquier tipo de archivo) que estas recibiendo de servidor
    
   self.responseData = [[NSMutableData alloc] init];
    
    
    
}

- (void) cargarDatosManual{

    NSArray *misTitulos = [[NSArray alloc] initWithObjects:@"Libro 1", @"Libro 2", @"Libro 3", nil];
     NSArray *misISBN = [[NSArray alloc] initWithObjects:@"9781449372422", @"9780470918029", @"9781479211418", nil];
     NSArray *misFechas = [[NSArray alloc] initWithObjects:@"23 may 2012", @"10 feb 2000", @"1 dic 1999", nil];
     
     
     for(int i = 0; i < misTitulos.count; i++){
     
     NSDictionary *diccionario = [[NSDictionary alloc] initWithObjectsAndKeys: [misTitulos objectAtIndex:i], @"titulo", [misISBN objectAtIndex:i], @"isbn", [misFechas objectAtIndex:i], @"fecha", nil];
     [libros addObject:diccionario];
     }
}

- (void) cargaLibrosPlist{
    
    //te dice path de acceso al archivo de la aplicación
    NSBundle *miBundle = [NSBundle mainBundle];
    //ahora tienes que decir que te traiga archivo plist
    
    NSString *path = [miBundle pathForResource:@"Libroplist" ofType:@"plist" ];
    
    //arreglo de diccionarios
    NSMutableArray *misLibros = [NSMutableArray arrayWithContentsOfFile:path];
    
    for(int i = 0; i < misLibros.count; i++){
        
        [libros addObject:[misLibros objectAtIndex:i]];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   // self.navigationItem.leftBarButtonItem = self.editButtonItem;

    /*UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;*/
    
    libros = [[NSMutableArray alloc] init]; //inicializar el arreglo de libros
    
    
    //[self cargaLibrosPlist];

    
    [self cargarDatosServicioWeb];
    
    
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


/*
 //version anterior
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LibrosCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *object = libros[indexPath.row];
    
    cell.tituloCell.text = [object objectForKey:@"titulo"];
    cell.isbnCell.text =[object objectForKey:@"isbn"];
    cell.fechaCell.text = [object objectForKey:@"fecha"];
    
    NSString *stringURL = [[NSString alloc]initWithFormat:@"http://content-3.powells.com/cgi-bin/imageDB.cgi?isbn=%@", [object objectForKey:@"isbn"]];
    NSURL *url = [[NSURL alloc] initWithString: stringURL];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [cell.imagenCell loadRequest:request];
    
    
    return cell;
}*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LibrosCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *diccionarioItems = libros[indexPath.row];
    NSDictionary *diccionarioVolumInfo = [diccionarioItems objectForKey: @"volumeInfo"];
    
    
    
    cell.tituloCell.text = [diccionarioVolumInfo objectForKey:@"title"];
   
    cell.isbnCell.text =[[[diccionarioVolumInfo objectForKey:@"industryIdentifiers"] objectAtIndex:0] objectForKey:@"identifier"];
    
    cell.fechaCell.text = [diccionarioVolumInfo objectForKey:@"publishedDate"];
    
    NSString *stringURL = [[NSString alloc]initWithFormat:@"http://content-3.powells.com/cgi-bin/imageDB.cgi?isbn=%@", cell.isbnCell.text];
    
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

//es asincrono en la misma thread...todo sobre main thread

#pragma mark - NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //estar recibiendo y formando la respuesta del servidor
    [self.responseData appendData:data];

}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    [self.indicador startAnimating];
    self.indicador.hidesWhenStopped = YES;
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
    int statusCode = [httpResponse statusCode];
    
    if(statusCode != 200){
    
        UIAlertView *alert= [[UIAlertView alloc] initWithTitle: @"Servicio Web"
                                                       message: @"El Servicio web está caído. Intenta más tarde."
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }
    
    NSLog(@"status code: %d", statusCode);
    
    [self.responseData setLength:0];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self.indicador stopAnimating];
    
    NSError *error;
    NSDictionary *datos = [NSJSONSerialization JSONObjectWithData:self.responseData options:kNilOptions error: &error];
    
    if(!libros)
        libros = [[NSMutableArray alloc] init];
    
    libros = [datos objectForKey:@"items"];
    
    if([libros count] == 0){
        
        UIAlertView *alert= [[UIAlertView alloc] initWithTitle: @"Búsqueda"
                                                message: @"La búsqueda no regreso resultados. Intenta de Nuevo."
                                                delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [alert show];
    
    }
    
    [self.tableView reloadData]; //recargar vista de tableview
    
}

#pragma mark - NSURLConnectionDelegate

//falla de internet invoca a metodo didFailWithError

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{

    UIAlertView *alert= [[UIAlertView alloc] initWithTitle: [error localizedDescription] message: [error localizedFailureReason] delegate:nil                  cancelButtonTitle:@"Done" otherButtonTitles:nil];
    [alert show];
    
    NSLog (@"Falla conexión");
}

@end
