//
//  Mascota.h
//  Examen3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mascota : NSObject

@property (retain, nonatomic) NSString *nombre;
@property  NSInteger edad;
@property (retain, nonatomic) NSString *raza;
@property (nonatomic, retain) NSSet *vacunas;
@property (retain, nonatomic) NSString *foto;

-(id) initWithTitle:(NSString *)name edad: (NSInteger) edad raza: (NSString*) raza foto: (NSString *) foto;

@end
