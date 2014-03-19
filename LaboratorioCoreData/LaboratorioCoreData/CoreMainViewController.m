//
//  CoreMainViewController.m
//  LaboratorioCoreData
//
//  Created by Maria Montserrat Lozano on 19/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "CoreMainViewController.h"

@interface CoreMainViewController ()

@end

@implementation CoreMainViewController

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
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(enterBackground:)
     name:UIApplicationDidEnterBackgroundNotification
     object:nil];
    
    UITapGestureRecognizer *tap =   [[UITapGestureRecognizer alloc]
                                     initWithTarget:self
                                     action:@selector(quitarTeclado)];
    [self.view addGestureRecognizer:tap];
}

-(void)quitarTeclado {
    
    [self.view endEditing:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)enterBackground:(NSNotification *)notification{
    
    
    //si cuando fue al background ambos campos son diferentes de vacio....se guardan en el core data
    if(![self.nombreTF.text isEqualToString:@""] && ![self.claveTF.text isEqualToString:@""])
    {
        NSLog(@"Se guardaron textfields cuando se fue al background");
        MATAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        //hay que crear contexto
    
        //delegado de la aplicacion manda a crear el contexto
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
        //indicar tabla
        NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"Materia" inManagedObjectContext:context];
    
        //poner valores en tabla
        [object setValue:self.nombreTF.text forKeyPath:@"nombre"];
        [object setValue:self.claveTF.text forKeyPath:@"clave" ];
    
        //guardar
        [appDelegate saveContext];
    
        self.estatusLabel.text = @"Se guardo exitosamente";
    }else{
        NSLog(@"faltaron campos por lo que no se guarda");
    }
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

- (IBAction)guardarButton:(id)sender {
    
    //en app delegate voy a tener al delegado de la aplicacion...es para la aplicacion no para un controlador en especifico.
    [self quitarTeclado];
    MATAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    //hay que crear contexto
    
    //delegado de la aplicacion manda a crear el contexto
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    //indicar tabla
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"Materia" inManagedObjectContext:context];
    
    //poner valores en tabla
    [object setValue:self.nombreTF.text forKeyPath:@"nombre"];
    [object setValue:self.claveTF.text forKeyPath:@"clave" ];
    
    //guardar
    [appDelegate saveContext];
    
    self.estatusLabel.text = @"Se guardo exitosamente";
}

- (IBAction)buscarButton:(id)sender {
    
    //en app delegate voy a tener al delegado de la aplicacion...es para la aplicacion no para un controlador en especifico.
    [self quitarTeclado];
    
    MATAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    //hay que crear contexto
    
    //delegado de la aplicacion manda a crear el contexto
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *materia = [NSEntityDescription entityForName:@"Materia" inManagedObjectContext:context];
    //formando la solicitud para fetch de la base de datos
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    
    [request setEntity:materia];
    
    //se tiene que decir el predicado o el criterio de busqueda
    NSPredicate *predicado = [NSPredicate predicateWithFormat:@"(clave =%@)", self.claveTF.text];
    
    //dar el criterio de busqueda
    [request setPredicate:predicado];
    
    //ejecutar el request
    NSError *error;
    NSArray *objetos = [context executeFetchRequest:request error:&error];
    
    if( [objetos count] == 0){
        self.estatusLabel.text = @"No se encontró la clave";
    }else{
        //arreglo de instancias de la entidad
        NSManagedObject *obj = objetos[0];
        self.nombreTF.text = [obj valueForKey:@"nombre"];
        self.estatusLabel.text = @"Búsqueda exitosa";
    }
    
}
@end
