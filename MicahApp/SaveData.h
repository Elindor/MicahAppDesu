//
//  SaveData.h
//  MicahApp
//
//  Created by Gabriel Nopper on 31/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "orcamentos.h"
#import "Produto.h"

@interface SaveData : NSObject


@property NSMutableArray *productList;
@property NSMutableArray *observationList;
@property NSMutableArray *historicList;
@property NSMutableArray *unfinishedList;
@property NSString *userName;
@property NSString *userAddress;
@property NSString *userPhone;
@property NSString *userMail;
@property UIImage *userIcon;
@property BOOL iCloudIsOn;
@property orcamentos *currentOrca;

+(instancetype)sharedAppData;    //singleton fetch

-(void)save;

@end
