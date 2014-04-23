//
//  AgregarViewController.m
//  Parcial3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "AgregarViewController.h"
#import "ManejoBD.h"
#import "Vacunas.h"
#import "Mascota.h"

@interface AgregarViewController (){
    NSMutableArray *listaVacunas;

 
}

@end

@implementation AgregarViewController

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
    self.tableViewVacunas.delegate = self;
	self.tableViewVacunas.dataSource = self;
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(enterBackground:)
     name:UIApplicationDidEnterBackgroundNotification
     object:nil];
    
    self.imageName = [NSString stringWithFormat:@"chi.jpg"];
    
    listaVacunas = [[NSMutableArray alloc]init];

}

-(void)enterBackground:(NSNotification *)notification{
    
    //solo se guarda si los campos de edad nombre y raza no son null
    if(![self.nombreTF.text isEqualToString:@""] && ![self.edadTF.text isEqualToString:@""]){
        ManejoBD *servicios = [ManejoBD instancia];
        NSNumber  *aNum = [NSNumber numberWithInteger: [self.edadTF.text integerValue]];
    
        NSDictionary *v =[[NSDictionary alloc]initWithObjectsAndKeys:self.nombreTF.text,@"nombre", self.razaTF.text, @"raza" , aNum, @"edad", @"chi.jpg", @"foto", nil];
    
        [servicios insertarMascota:v vacunas:listaVacunas];
    
        [self.delegado insertar:v];
        [self.delegado removerVista];
    }
    
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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

//- (IBAction)cargarFoto:(id)sender {
    
    //UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    //picker.delegate = self;
    //picker.allowsEditing = YES;
    //picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
   //[self presentViewController:picker animated:YES completion:NULL];
    
//}
/*
//se llama despues de que se elije la foto
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imagen.image = chosenImage;
    
    NSURL *imagePath = [info objectForKey:@"UIImagePickerControllerReferenceURL"];
    
    self.imageName= [imagePath lastPathComponent];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}*/

- (IBAction)buscarVacuna:(id)sender {
    
    NSBundle *miBundle = [NSBundle mainBundle];
    NSString *path = [miBundle pathForResource:@"Vacunas" ofType:@"plist"]; //lleva su extension en el ofType
    NSMutableArray *misVacunas = [NSMutableArray arrayWithContentsOfFile:path]; //inicializar el arreglo con el plist, esto funciona porque el plist inicia en un arreglo, si el root es dictionary no funciona esta funcion
    
    for (int i=0; i< [misVacunas count]; i++){
        
        if([misVacunas[i] isEqualToString:self.nombreVacunaTF.text]){
            self.vacunaLabel.text =@"Si existe!";
            break;
        }
        
        self.vacunaLabel.text = @"No existe";

    }
    
    
}

- (IBAction)agregarVacuna:(id)sender {
    
    NSDate *hoy = [NSDate date];
    
    if([self.vacunaLabel.text isEqualToString:@"Si existe!"]){
        NSDictionary *v =[[NSDictionary alloc]initWithObjectsAndKeys:self.nombreVacunaTF.text,@"nombre", hoy, @"fecha" , nil];
    
        //NSLog(@"Vacuna %@", v);
        [listaVacunas addObject:v];
        NSLog(@"Lista %@", listaVacunas);
        [self.tableViewVacunas reloadData];
    
    }
    
}
- (IBAction)agregarMascota:(id)sender {
    
   ManejoBD *servicios = [ManejoBD instancia];
    NSNumber  *aNum = [NSNumber numberWithInteger: [self.edadTF.text integerValue]];
    
    NSDictionary *v =[[NSDictionary alloc]initWithObjectsAndKeys:self.nombreTF.text,@"nombre", self.razaTF.text, @"raza" , aNum, @"edad", @"chi.jpg", @"foto", nil];
    Mascota *m = [servicios insertarMascota:v vacunas:listaVacunas];
    
    [self.delegado insertar:m];
    [self.delegado removerVista];
    
}

#pragma mark - table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return listaVacunas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[listaVacunas objectAtIndex:indexPath.row] objectForKey:@"nombre"];
    
    NSDate *hoy = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"MM-dd-yyyy"];
    NSString *dia = [format stringFromDate:hoy];
    
    
    cell.detailTextLabel.text = dia;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
