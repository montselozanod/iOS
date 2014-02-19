//
//  Perfil.m
//  LaboratorioProtocolo
//
//  Created by Maria Montserrat Lozano on 19/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "Perfil.h"

@implementation Perfil

//se crea clase personalizada

- (id) initWithName: (NSString *) nom telefono: (NSInteger) tel correo: (NSString *) email
{

    self = [super init];
    if(self){
        //con guion bajo...accesando directamente a la variable
        
        _nombre = nom;
        _telefono = tel;
        _email = email;
    }
    
    return self; //regresa apuntador al objeto creado

}

@end
