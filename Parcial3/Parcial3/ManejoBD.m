//
//  ManejoBD.m
//  Parcial3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "ManejoBD.h"
#import "Mascota.h"
#import "Vacunas.h"

@implementation ManejoBD

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

#pragma mark - Core Data stack
- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
			// Replace this implementation with code to handle the error appropriately.
			// abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}
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
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
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
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Model.sqlite"];
    
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
#pragma-mark Singleton Methods
- (id)init
{
	if(self = [super init]){
		[self setListaMascotas:[[NSMutableArray alloc] init]];
		[self setListaVacunas:[[NSMutableArray alloc]init]];
	}
	
	return self;
}
+ (ManejoBD *)instancia
{
	static ManejoBD *_instancia = nil;
	static dispatch_once_t safer;
	
	dispatch_once(&safer, ^(void){
		_instancia = [[ManejoBD alloc] init];
	});
	
	return _instancia;
}

- (Mascota *) insertarMascota:(id) datosMascota vacunas:(NSArray *) misVacunas{
	NSManagedObjectContext *context = self.managedObjectContext;
	Mascota *nueva = [NSEntityDescription insertNewObjectForEntityForName:@"Mascota" inManagedObjectContext:context];
	
	NSDictionary *mascota = (NSDictionary *)datosMascota;
	nueva.nombre = [mascota objectForKey:@"nombre"];
	nueva.edad = [mascota objectForKey:@"edad"];
	nueva.raza = [mascota objectForKey:@"raza"];
	nueva.foto = [mascota objectForKey:@"foto"];
	for(NSDictionary *v in misVacunas){
        
		[nueva addRelationshipObject:[self insertarVacuna:v]];
	}
	
	[self saveContext];
    return nueva;
	
}

- (Vacunas *)insertarVacuna:(id)datosVacuna {
    NSManagedObjectContext *context = self.managedObjectContext;
    Vacunas *nuevaVacuna = [NSEntityDescription insertNewObjectForEntityForName:@"Vacunas" inManagedObjectContext:context];
    NSDictionary *miVacuna = (NSDictionary *)datosVacuna;
    nuevaVacuna.nombre = [miVacuna objectForKey:@"nombre"];
    
    
    nuevaVacuna.fecha = [miVacuna objectForKey:@"fecha"];
    
    NSLog(@"Hello");
    
    [self saveContext];
    NSLog(@"Hello");
    
    return nuevaVacuna;
    
}

 
 - (void) cargaMascotasPlist {
 NSBundle *miBundle = [NSBundle mainBundle];
 
 NSString *path = [miBundle pathForResource:@"Mascotas" ofType:@"plist"];
 NSMutableArray *mascotas = [NSMutableArray arrayWithContentsOfFile:path];
 
     for(id m in mascotas) {
         [self insertarMascota:m vacunas:m[@"vacunas"]];
     }
 }
 
 


-(void)cargarMascotas
{
	NSManagedObjectContext *context = self.managedObjectContext;
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Mascota" inManagedObjectContext:context];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entity];
	
	NSError *error;
	NSMutableArray *results = (NSMutableArray*)[context executeFetchRequest:request error:&error];
	
	if(results.count == 0){
        [self cargaMascotasPlist];
		NSLog(@"No hay mascotas guardadas...");
       
	}else{
        
      
		self.listaMascotas = results;
        NSLog(@"Core Data!!!!!");
        
      
	}
    
}
-(void)cargarVacunas
{
	NSManagedObjectContext *context = self.managedObjectContext;
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Vacunas" inManagedObjectContext:context];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entity];
	
	NSError *error;
	NSArray *results = [context executeFetchRequest:request error:&error];
	
	if(results.count==0){
		NSLog(@"No hay vacunas guardadas...");
	}else{
		
		self.listaVacunas = (NSMutableArray *)results;
	}
}
-(id)buscarVacunas:(NSString *)nombre
{
	NSManagedObjectContext *context = self.managedObjectContext;
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Vacuna" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    NSPredicate *predicado = [NSPredicate predicateWithFormat:@"(nombre = %@)", nombre];
    [request setPredicate:predicado];
    NSError *error;
    NSArray *datos = [context executeFetchRequest:request error:&error];
    
    if ([datos count] == 0) {
        Vacunas *v = nil;
        return v;
    } else {
        Vacunas *v = datos[0];
        return v;
    }
}
-(NSArray *)buscarMascotas:(NSString *)nombre
{
	NSFetchRequest *request;
    NSPredicate *predicado;
    NSManagedObjectContext *context = self.managedObjectContext;
    NSEntityDescription *entityDescriptionMateria = [NSEntityDescription entityForName:@"Mascota" inManagedObjectContext:context];
    request = [[NSFetchRequest alloc]init];
    [request setEntity:entityDescriptionMateria];
    predicado = [NSPredicate predicateWithFormat:@"(nombre = %@)", nombre];
    [request setPredicate:predicado];
    NSError *error;
    NSArray *datos = [context executeFetchRequest:request error:&error];
    Mascota *mascota = datos[0];
    NSSet *vacunas = mascota.relationship;
    NSArray *lista = [vacunas allObjects];
    return lista;
}

@end

