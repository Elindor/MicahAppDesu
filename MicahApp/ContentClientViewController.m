//
//  ContentOrcaViewController.m
//  MicahApp
//
//  Created by Gabriel Nopper on 27/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "ContentClientViewController.h"

@interface ContentClientViewController ()

@end

@implementation ContentClientViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.clientNameField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.clientPhoneField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.clientMailField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.clientAddressField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    SaveData* save = [SaveData sharedAppData];
    _clientMailField.text = save.currentOrca.costumerEmail;
    _clientNameField.text = save.currentOrca.costumerName;
    _clientAddressField.text = save.currentOrca.costumerAdress;
    _clientPhoneField.text = save.currentOrca.costumerTelephone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clientNameExit:(id)sender {
    SaveData *save = [SaveData sharedAppData];
    save.currentOrca.costumerName = _clientNameField.text;
    [save save];
}

- (IBAction)clientPhoneExit:(id)sender {
    SaveData *save = [SaveData sharedAppData];
    save.currentOrca.costumerTelephone = _clientPhoneField.text;
    [save save];
}

- (IBAction)clientMailExit:(id)sender {
    SaveData *save = [SaveData sharedAppData];
    save.currentOrca.costumerEmail = _clientMailField.text;
    [save save];
}

- (IBAction)clientAddressExit:(id)sender {
    SaveData *save = [SaveData sharedAppData];
    save.currentOrca.costumerAdress = _clientAddressField.text;
    [save save];
}
@end
