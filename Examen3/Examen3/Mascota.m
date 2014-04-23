//
//  Mascota.m
//  Examen3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "Mascota.h"

@implementation Mascota

-(id) initWithTitle:(NSString *)name edad: (NSInteger) edad raza: (NSString*) raza foto: (NSString *) foto{
    
    
    self = [super init];
    
    if(self){
        
        _nombre = name;
        _edad = edad;
        _raza = raza;
        _foto = foto;
        
    }
    
    return self;

}

@end
