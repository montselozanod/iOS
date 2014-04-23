//
//  Vacunas.h
//  Parcial3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Mascota;

@interface Vacunas : NSManagedObject

@property (nonatomic, retain) NSDate * fecha;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) Mascota *relationship;

@end
