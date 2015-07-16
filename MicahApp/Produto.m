//
//  Produto.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/14/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "Produto.h"

@implementation Produto

+ (Produto *) criaProduto:(NSString *)nome descricao:(NSString *)descricao categoria:(NSString *)categoria precoPadrao: (NSNumber *) precoPadrao{
    
    Produto *produtoNovo = [[Produto alloc]init];
    
    produtoNovo.nomeProduto = nome;
    produtoNovo.descricaoProduto = descricao;
    produtoNovo.categoriaProduto = categoria;
    produtoNovo.precoPadraoProduto = precoPadrao;
    
    return produtoNovo;
    
}

NSString *const NomeKey = @"NomeKey";
NSString *const DescricaoKey = @"DescricaoKey";
NSString *const CategoriaKey = @"CategoriaKey";
NSString *const PrecoKey = @"PrecoKey";

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _nomeProduto = [aDecoder decodeObjectForKey:NomeKey];
        _descricaoProduto = [aDecoder decodeObjectForKey:DescricaoKey];
        _categoriaProduto = [aDecoder decodeObjectForKey:CategoriaKey];
        _precoPadraoProduto = [aDecoder decodeObjectForKey:PrecoKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.nomeProduto forKey:NomeKey];
    [aCoder encodeObject:self.descricaoProduto forKey:DescricaoKey];
    [aCoder encodeObject:self.categoriaProduto forKey:CategoriaKey];
    [aCoder encodeObject:self.precoPadraoProduto forKey:PrecoKey];
}



@end
