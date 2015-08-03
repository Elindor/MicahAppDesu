//
//  ContentOrcaViewController.h
//  MicahApp
//
//  Created by Gabriel Nopper on 27/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaveData.h"

@interface ContentClientViewController : UIViewController
@property NSUInteger pageIndex;
@property NSString *titleText;

@property (weak, nonatomic) IBOutlet UITextField *clientNameField;
@property (weak, nonatomic) IBOutlet UITextField *clientPhoneField;
@property (weak, nonatomic) IBOutlet UITextField *clientMailField;
@property (weak, nonatomic) IBOutlet UITextField *clientAddressField;

- (IBAction)clientNameExit:(id)sender;
- (IBAction)clientPhoneExit:(id)sender;
- (IBAction)clientMailExit:(id)sender;
- (IBAction)clientAddressExit:(id)sender;

@end
