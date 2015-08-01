//
//  orcamentos.h
//  MicahApp
//
//  Created by Gabriel Nopper on 31/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface orcamentos : NSObject


@property NSMutableArray *productList;
@property NSMutableArray *observationList;

@property NSString *costumerName;
@property NSString *costumerTelephone;
@property NSString *costumerEmail;
@property NSString *costumerAdress;

@property NSNumber* finalValue;
@property NSNumber* finalSum;
@property NSNumber* finalDiscount;
@property NSNumber* resultValue;

@end
 