//
//  NovaObsOrcamentoViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 8/1/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "NovaObsOrcamentoViewController.h"
#import "SaveData.h"
#import "orcamentos.h"

@interface NovaObsOrcamentoViewController ()


@property (weak, nonatomic) IBOutlet UISwitch *salvaSwitchON;

@property (weak, nonatomic) IBOutlet UITextField *obsOrcaTextField;
@end

@implementation NovaObsOrcamentoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.observacaoOrca = self.obsOrcaTextField.text;
    self.salvaSwitchON = false;
    
    // Do any additional setup after loading the view.
}

-(IBAction)confirm:(id)sender{
    orcamentos *current = [SaveData sharedAppData].currentOrca;
    [current.observationList addObject:self.obsOrcaTextField.text];
    if(_salvaSwitchON){ // Se também salvar...
        [[SaveData sharedAppData].observationList addObject:self.obsOrcaTextField.text];
    }
    [[SaveData sharedAppData] save];
    
    [self.navigationController popViewControllerAnimated:YES];

    [self.navigationController popViewControllerAnimated:YES];
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

@end
