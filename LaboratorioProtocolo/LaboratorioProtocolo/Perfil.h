//
//  Perfil.h
//  LaboratorioProtocolo
//
//  Created by Maria Montserrat Lozano on 19/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Perfil : NSObject

@property (strong, nonatomic) NSString *nombre;
@property (strong, nonatomic) NSString *email;
@property NSInteger telefono;

- (id) initWithName: (NSString *) nom telefono: (NSInteger) tel correo: (NSString *) email;


@end
