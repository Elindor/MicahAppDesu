//
//  PedidoDeProduto.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 8/1/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "PedidoDeProduto.h"

@implementation PedidoDeProduto


+ (PedidoDeProduto *) criaPedido:(NSString *)nome descricao:(NSString *)descricao quantidadeProduto:(NSNumber*) quantidade precoAtual: (NSNumber *) preco{
    
    PedidoDeProduto *pedidoNovo = [[PedidoDeProduto alloc]init];
    
    pedidoNovo.nomeProduto = nome;
    pedidoNovo.descricaoProduto = descricao;
    pedidoNovo.quantidadeProduto = quantidade;
    pedidoNovo.precoProduto = preco;
    
    return pedidoNovo;
    
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _nomeProduto = [aDecoder decodeObjectForKey:@"OrcamentsReceipt$Name#32189kl4"];
        _descricaoProduto = [aDecoder decodeObjectForKey:@"OrcamentsReceipt$Desc#32189kl4"];
        _quantidadeProduto = [aDecoder decodeObjectForKey:@"OrcamentsReceipt$Quan#32189kl4"];
        _precoProduto = [aDecoder decodeObjectForKey:@"OrcamentsReceipt$Prec#32189kl4"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.nomeProduto forKey:@"OrcamentsReceipt$Name#32189kl4"];
    [aCoder encodeObject:self.descricaoProduto forKey:@"OrcamentsReceipt$Desc#32189kl4"];
    [aCoder encodeObject:self.quantidadeProduto forKey:@"OrcamentsReceipt$Quan#32189kl4"];
    [aCoder encodeObject:self.precoProduto forKey:@"OrcamentsReceipt$Prec#32189kl4"];
}


@end
