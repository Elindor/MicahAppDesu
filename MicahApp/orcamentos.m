//
//  orcamentos.m
//  MicahApp
//
//  Created by Gabriel Nopper on 31/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "orcamentos.h"

@implementation orcamentos

-(id)init{
    self = [super init];
    
    _observationList = [[NSMutableArray alloc] init];
    _productList = [[NSMutableArray alloc] init];
    
    return self;
} 


- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_costumerName forKey:@"OrcamentsProduct$Name#32189kl4"];
    [aCoder encodeObject:_costumerTelephone forKey:@"OrcamentsProduct$Telephone#32189kl4"];
    [aCoder encodeObject:_costumerEmail forKey:@"OrcamentsProduct$Email#32189kl4"];
    [aCoder encodeObject:_costumerAdress forKey:@"OrcamentsProduct$Adress#32189kl4"];
    [aCoder encodeObject:_productList forKey:@"OrcamentsProduct$ProductList#32189kl4"];
    [aCoder encodeObject:_observationList forKey:@"OrcamentsProduct$ObservationList#32189kl4"];
    [aCoder encodeObject:_finalValue forKey:@"OrcamentsProduct$FinalValue#32189kl4"];
    [aCoder encodeObject:_finalSum forKey:@"OrcamentsProduct$FinalSum#32189kl4"];
    [aCoder encodeObject:_finalDiscount forKey:@"OrcamentsProduct$FinalDiscount#32189kl4"];
    [aCoder encodeObject:_resultValue forKey:@"OrcamentsProduct$ResultValue#32189kl4"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _costumerName = [aDecoder decodeObjectForKey:@"OrcamentsProduct$Name#32189kl4"];
        _costumerTelephone = [aDecoder decodeObjectForKey:@"OrcamentsProduct$Telephone#32189kl4"];
        _costumerEmail = [aDecoder decodeObjectForKey:@"OrcamentsProduct$Email#32189kl4"];
        _costumerAdress = [aDecoder decodeObjectForKey:@"OrcamentsProduct$Adress#32189kl4"];
        _productList = [aDecoder decodeObjectForKey:@"OrcamentsProduct$ProductList#32189kl4"];
        _observationList = [aDecoder decodeObjectForKey:@"OrcamentsProduct$ObservationList#32189kl4"];
        _finalValue = [aDecoder decodeObjectForKey:@"OrcamentsProduct$FinalValue#32189kl4"];
        _finalSum = [aDecoder decodeObjectForKey:@"OrcamentsProduct$FinalSum#32189kl4"];
        _finalDiscount = [aDecoder decodeObjectForKey:@"OrcamentsProduct$FinalDiscount#32189kl4"];
        _resultValue = [aDecoder decodeObjectForKey:@"OrcamentsProduct$ResultValue#32189kl4"];
    }
    return self;
}


@end
