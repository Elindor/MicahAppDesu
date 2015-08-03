//
//  ContentAdjustmentViewController.h
//  MicahApp
//
//  Created by Gabriel Nopper on 01/08/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentAdjustmentViewController : UIViewController
@property NSUInteger pageIndex;
@property NSNumber *total;
@property NSNumber *descontoPorcentagem;
@property NSNumber *descontoPreco;
@property NSNumber *acrescimoPorcentagem;
@property NSNumber *acrescimoPreco;
@property NSNumber *totalFinal;

@end
