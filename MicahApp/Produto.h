//
//  Produto.h
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/14/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Produto : NSObject <NSCoding>

@property (weak, nonatomic) NSString *nomeProduto;
@property (weak, nonatomic) NSString *descricaoProduto;
@property (weak, nonatomic) NSString *categoriaProduto;
@property (weak, nonatomic) NSNumber *precoPadraoProduto;

+ (Produto *) criaProduto:(NSString *)nome descricao:(NSString *)descricao categoria:(NSString *)categoria precoPadrao: (NSNumber *) precoPadrao;

@end
