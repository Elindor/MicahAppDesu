//
//  Cliente.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/17/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "Cliente.h"

@implementation Cliente

+ (Cliente *) criaCliente:(NSString *)nome email:(NSString *)emailCliente telefoneCliente:(NSString *)telefone enderecoCliente:(NSString *)endereco cpf: (NSNumber *) cpfCliente {
    
    Cliente *novoCliente = [[Cliente alloc]init];
    
    novoCliente.nomeCliente = nome;
    novoCliente.emailCliente = emailCliente;
    novoCliente.telefoneCliente = telefone;
    novoCliente.enderecoCliente = endereco;
    novoCliente.cpfCliente = cpfCliente;
    
    return novoCliente;
}

@end
