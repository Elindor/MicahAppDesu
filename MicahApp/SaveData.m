//
//  SaveData.m
//  MicahApp
//
//  Created by Gabriel Nopper on 31/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "SaveData.h"

@implementation SaveData

-(id)init{
    self = [super init];
    
    _observationList = [[NSMutableArray alloc] init];
    _productList = [[NSMutableArray alloc] init];
    _historicList = [[NSMutableArray alloc] init];
    _unfinishedList = [[NSMutableArray alloc] init];
    
    return self;
}

+(instancetype)sharedGameData{
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self loadInstance];
    });
    return sharedInstance;
}

+(instancetype)loadInstance{
    NSData* decodedData = [NSData dataWithContentsOfFile:[self filePath]];
    if(decodedData){
        SaveData* appData = [NSKeyedUnarchiver unarchiveObjectWithData:decodedData];
        return appData;
    }
    
    return [[SaveData alloc] init];
}

+(NSString*)filePath{
    static NSString* filePath = nil;
    if(!filePath){
        filePath =
        [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
         stringByAppendingPathComponent:@"OrcamentoApp#185b6r77a32"];
    }
    return filePath;
}

-(void) save{
    NSData* encodedData = [NSKeyedArchiver archivedDataWithRootObject:self];
    [encodedData writeToFile:[SaveData filePath] atomically:YES];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _productList = [aDecoder decodeObjectForKey:@"OrcamentsGeneric$ProductList#32189kl4"];
        _observationList = [aDecoder decodeObjectForKey:@"OrcamentsGeneric$ObservationList#32189kl4"];
        _historicList = [aDecoder decodeObjectForKey:@"OrcamentsGeneric$HistoricList#32189kl4"];
        _unfinishedList = [aDecoder decodeObjectForKey:@"OrcamentsGeneric$UnfinishedList#32189kl4"];
        _userName = [aDecoder decodeObjectForKey:@"OrcamentsGeneric$UserName#32189kl4"];
        _userAddress = [aDecoder decodeObjectForKey:@"OrcamentsGeneric$UserAddress#32189kl4"];
        _userPhone = [aDecoder decodeObjectForKey:@"OrcamentsGeneric$UserPhone#32189kl4"];
        _userMail = [aDecoder decodeObjectForKey:@"OrcamentsGeneric$UserMail#32189kl4"];
        _userIcon = [aDecoder decodeObjectForKey:@"OrcamentsGeneric$UserIcon#32189kl4"];
        _iCloudIsOn = [aDecoder decodeBoolForKey:@"OrcamentsGeneric$iCloudIsOn#32189kl4"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_productList forKey:@"OrcamentsGeneric$ProductList#32189kl4"];
    [aCoder encodeObject:_observationList forKey:@"OrcamentsGeneric$ObservationList#32189kl4"];
    [aCoder encodeObject:_historicList forKey:@"OrcamentsGeneric$HistoricList#32189kl4"];
    [aCoder encodeObject:_unfinishedList forKey:@"OrcamentsGeneric$UnfinishedList#32189kl4"];
    [aCoder encodeObject:_userName forKey:@"OrcamentsGeneric$UserName#32189kl4"];
    [aCoder encodeObject:_userAddress forKey:@"OrcamentsGeneric$UserAddress#32189kl4"];
    [aCoder encodeObject:_userPhone forKey:@"OrcamentsGeneric$UserPhone#32189kl4"];
    [aCoder encodeObject:_userMail forKey:@"OrcamentsGeneric$UserMail#32189kl4"];
    [aCoder encodeObject:_userIcon forKey:@"OrcamentsGeneric$UserIcon#32189kl4"];
    [aCoder encodeBool:_iCloudIsOn forKey:@"OrcamentsGeneric$iCloudIsOn#32189kl4"];
}


@end
