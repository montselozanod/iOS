//
//  LaboINTAddMateriaViewController.m
//  LabIntegrador
//
//  Created by Maria Montserrat Lozano on 26/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LaboINTAddMateriaViewController.h"
#import "Materia.h"
#import "ManejoBD.h"


@interface LaboINTAddMateriaViewController (){
    NSMutableArray *biblio;
    bool find;
    ManejoBD *serv;
}

@end

@implementation LaboINTAddMateriaViewController

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
    
    biblio = [[NSMutableArray alloc]init];
    self.tableViewLibro.delegate = self;
    self.tableViewLibro.dataSource = self;
    find = false;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return biblio.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Celda" forIndexPath:indexPath];
    
    Libro *l = biblio[indexPath.row];
    cell.textLabel.text = l.titulo;
    cell.detailTextLabel.text = l.isbn;
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveButton:(id)sender {
    
    NSDictionary *mat = @{@"clave": self.claveTF.text, @"nombre": self.nombreTF.text};
    serv = [ManejoBD instancia];
    Materia *mater = [serv insertarMateria:mat libros: biblio];
    [self.delegado insertar:mater];
    [self.delegado removerVista];
    
}
- (IBAction)buscarLibro:(id)sender {
    
    ManejoBD *s = [ManejoBD instancia];
    Libro *l = [s buscarLibro:self.isbnTF.text];
    
    if (l == nil){
        //no esta ese isbn
        self.statusTF.text = @"Libro no existe";
        find = false;
        
    }else{
        
        NSString *s = [NSString stringWithFormat:@"Título: %@", l.titulo];
        self.statusTF.text = s;
        find = true;
    
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)agregarLibro:(id)sender {
    
    if(find){
        serv = [ManejoBD instancia];
        Libro *l = [serv buscarLibro:self.isbnTF.text];
        [biblio addObject:l];
        [self.tableViewLibro reloadData];
        find = false;
        self.statusTF.text = @"";
    }
    
}
@end
