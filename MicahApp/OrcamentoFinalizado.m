//
//  OrcamentoFinalizado.m
//  MicahApp
//
//  Created by Gabriel Nopper on 03/08/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "OrcamentoFinalizado.h"

@implementation OrcamentoFinalizado



NSString *const NameKey = @"OrcamentsHistory$Name#32189kl4";
NSString *const DateKey = @"OrcamentsHistory$Date#32189kl4";
//NSString *const CategoriaKey = @"CategoriaKey";
NSString *const PDFKey = @"OrcamentsHistory$PDF#32189kl4";

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _nomeDoCliente = [aDecoder decodeObjectForKey:NameKey];
        _dataEncerrada = [aDecoder decodeObjectForKey:DateKey];
        _PDF = [aDecoder decodeObjectForKey:PDFKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.nomeDoCliente forKey:NameKey];
    [aCoder encodeObject:self.dataEncerrada forKey:DateKey];
    [aCoder encodeObject:self.PDF forKey:PDFKey];
}


@end
