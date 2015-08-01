//
//  PedidoDeProduto.h
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 8/1/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PedidoDeProduto : NSObject

@property (weak, nonatomic) NSString *nomeProduto;
@property (weak, nonatomic) NSString *descricaoProduto;
@property (weak, nonatomic) NSNumber *quantidadeProduto;
@property (weak, nonatomic) NSNumber *precoProduto;


+ (PedidoDeProduto *) criaPedido:(NSString *)nome descricao:(NSString *)descricao quantidadeProduto:(NSNumber*) quantidade precoAtual: (NSNumber *) preco;



@end
