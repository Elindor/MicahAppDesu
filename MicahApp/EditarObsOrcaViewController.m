//
//  EditarObsOrcaViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 8/1/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "EditarObsOrcaViewController.h"


@interface EditarObsOrcaViewController ()

@property (weak, nonatomic) IBOutlet UITextField *observacaoOrcaTextField;

@property (weak, nonatomic) IBOutlet UISwitch *salvarSwitchON;
@end

@implementation EditarObsOrcaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.observacaoOrcaTextField.text = self.observacaoOrca;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)excluirObsButton:(UIButton *)sender {
    
    
}
@end
