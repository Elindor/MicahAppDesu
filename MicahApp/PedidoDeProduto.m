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


@end
