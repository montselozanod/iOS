//
//  ProtoPerfil.h
//  LaboratorioProtocolo
//
//  Created by Maria Montserrat Lozano on 19/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProtoPerfil <NSObject>

//definicion de protocolo

- (void) agregarPerfil: (NSString *) nombre telefono: (NSInteger) tel correo: (NSString *) email;
-(void) removerVista;

//removerVista hace el pop

@end
