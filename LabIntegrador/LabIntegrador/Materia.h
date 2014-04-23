//
//  Materia.h
//  LabIntegrador
//
//  Created by Maria Montserrat Lozano on 18/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Libro;

@interface Materia : NSManagedObject

@property (nonatomic, retain) NSString * clave;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSSet *bibliografia;
@end

@interface Materia (CoreDataGeneratedAccessors)

- (void)addBibliografiaObject:(Libro *)value;
- (void)removeBibliografiaObject:(Libro *)value;
- (void)addBibliografia:(NSSet *)values;
- (void)removeBibliografia:(NSSet *)values;

@end
