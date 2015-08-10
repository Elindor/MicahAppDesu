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
    
    self.clientNameField.layer.borderWidth = 1.0f;
    self.clientPhoneField.layer.borderWidth = 1.0f;
    self.clientMailField.layer.borderWidth = 1.0f;
    self.clientAddressField.layer.borderWidth = 1.0f;

    [self setPlaceHolderPosition:self.self.clientAddressField];
    [self setPlaceHolderPosition:self.self.clientMailField];
    [self setPlaceHolderPosition:self.self.clientNameField];
    [self setPlaceHolderPosition:self.self.clientPhoneField];

    
    
}

-(void)setPlaceHolderPosition: (UITextField *) textField{
    
    UIView *spacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [textField setLeftViewMode:UITextFieldViewModeAlways];
    [textField setLeftView:spacerView];
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


- (IBAction)exit1:(id)sender {
}

- (IBAction)exit2:(id)sender {
}

- (IBAction)exit4:(id)sender {
}

- (IBAction)exit3:(id)sender {
}


@end
