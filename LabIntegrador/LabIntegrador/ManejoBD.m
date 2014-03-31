//
//  ManejoBD.m
//  LabIntegrador
//
//  Created by Maria Montserrat Lozano on 31/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "ManejoBD.h"

@implementation ManejoBD

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (void)saveContext
{
NSError *error = nil;
NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
if (managedObjectContext != nil) {
    //si hubo cambios y no hubo errores al momento de guardar
    if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Modelo" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    //el url que estamos creando es del path del folder de documentos de la aplicacion, para agregar pathcomponent
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Modelo.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - Metodos Singleton

//metodos de singleton
//inicializar singleton
-(id) init{
    
    if(self = [super init]){
        [self setListaLibros:[[NSMutableArray alloc]init] ];
        [self setListaMaterias:[[NSMutableArray alloc]init] ];
    }
    
    return self;
}

//metodo de clase que crea el thread
+(ManejoBD *) instancia{
     //crear singleton
    //crear thread
    static ManejoBD * _instancia = nil;
    static dispatch_once_t safer;
    
    //thread (solo una vez)
    dispatch_once(&safer, ^(void)
                     {
                         _instancia = [[ManejoBD alloc]init];
                     });
    
    return _instancia;
    

}

//metodos para insertar en la BD
- (void) insertarMateria:(id) datosMateria libros:(NSArray *)misLibros{

    
    NSManagedObjectContext *context = self.managedObjectContext; //manda llamar a metodos para crear el contexto, espacio donde se escriebn los valores que se generan cuando se utiliza core data
    
    Materia *nuevo = [NSEntityDescription insertNewObjectForEntityForName:@"Materia" inManagedObjectContext:context];
    
    NSDictionary *materia = (NSDictionary*) datosMateria;
    
    nuevo.clave= [materia objectForKey:@"clave"];
    nuevo.nombre = [materia objectForKey:@"nombre"];
    
    //agregar a relacion de cada materia los libros asociados...como es inversa se hace la relacion tmb con libro
    for (int i = 0; i < misLibros.count; i++){
        [nuevo addBibliografiaObject:misLibros[i]];
    }
    
    [self saveContext]; //todo lo que esta en memoria lo guarda en el coredata
    
}

-(void) insertarLibro:(id) datosLibro{

    NSManagedObjectContext *context = self.managedObjectContext; //manda llamar a metodos para crear el contexto, espacio donde se escriebn los valores que se generan cuando se utiliza core data
    
    Libro *nuevo = [NSEntityDescription insertNewObjectForEntityForName:@"Libro" inManagedObjectContext:context];
    
    NSDictionary *miLibro = (NSDictionary*) datosLibro;
    
    nuevo.titulo = [miLibro objectForKey:@"titulo"];
    nuevo.isbn = [miLibro objectForKey:@"isbn"];
    
    [self saveContext]; //todo lo que esta en memoria lo guarda en el coredata
}

//metodos para cargar datos de la BD
-(void) cargarMaterias{
   
    NSManagedObjectContext *context = self.managedObjectContext;
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Materia" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    
    [request setEntity:entity];
    
    NSError *error;
    
    NSMutableArray *datos = (NSMutableArray *)[context executeFetchRequest:request error:&error];
    
    if(datos.count == 0){
        NSLog(@"No hay datos");
    }else{
        [self setListaMaterias:datos];
    }
}

-(void) cargarLibros{

    NSManagedObjectContext *context = self.managedObjectContext;
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Libro" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    
    [request setEntity:entity];
    
    NSError *error;
    
    NSMutableArray *datos = (NSMutableArray *)[context executeFetchRequest:request error:&error];
    
    if(datos.count == 0){
        NSLog(@"No hay datos");
    }else{
        [self setListaLibros:datos];
    }

}

//buscar

-(id) buscarLibro: (NSString *)isbn{

}

-(NSArray*) buscarLibrosMateria: (NSString *)clave{

}

@end
