//
//  PedidoDeProduto.h
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 8/1/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PedidoDeProduto : NSObject

@property (strong, retain) NSString *nomeProduto;
@property (strong, retain) NSString *descricaoProduto;
@property (strong, retain) NSNumber *quantidadeProduto;
@property (strong, retain) NSNumber *precoProduto;
@property (strong, retain) NSNumber *precoAlterado;


+ (PedidoDeProduto *) criaPedido:(NSString *)nome descricao:(NSString *)descricao quantidadeProduto:(NSNumber*) quantidade precoAtual: (NSNumber *) preco;



@end
